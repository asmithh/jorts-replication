library(data.table)
library(did2s)
library(HonestDiD)
add_el <- theme_grey() + theme(text = element_text(family = "Times", size=20))
theme_set(add_el)
getAnywhere(honest_did_did2s)

# specifying data types & loading dataset
cls = c(id="factor", X='vector', G2='numeric', G='factor',  Y='numeric', period= 'numeric', treat= 'factor', ts='numeric')
data = read.table('~/jorts_replication/data/all_jorts_did_data_test_all_new_denom.tsv', stringsAsFactors = FALSE, sep = '\t', header = TRUE, colClasses=cls)

# constructing data matrix - forgive my inelegant R 
mtx = matrix(, nrow=dim(data)[1], ncol=16)
for (r in 1:dim(data)[1]) {
  vect = data$X[r]
  vect = strsplit(vect, ',')
  
  vect = as.numeric(unlist(vect))
  mtx[r,] = vect
}

data['X'] = mtx
data = as.data.table(data)

# DiD2S for non-union accounts
g0 = data[data$G == 0]
static0 = did2s(g0, 
                yname = "Y", first_stage = ~ 0 | id + period,
                second_stage = ~i(ts), treatment = "treat",
                cluster_var = "id")
static0
# sensitivity analysis
sensitivity_results0 <- static0 |>
  get_honestdid_obj_did2s(coef_name = "ts") |>
  honest_did_did2s(
    e = 0,
    type = "relative_magnitude",
    Mbarvec = seq(from = 0.5, to = 4, by = 0.5)
  )
sensitivity_results0
HonestDiD::createSensitivityPlot_relativeMagnitudes(
  sensitivity_results0$robust_ci,
  sensitivity_results0$orig_ci
)

# DiD2S for union accounts
g1 = data[data$G == 1]
static1 = did2s(g1, 
                yname = "Y", first_stage = ~ 0 | id + period,
                second_stage = ~i(ts), treatment = "treat",
                cluster_var = "id")
static1
# sensitivity analysis
sensitivity_results1 <- static1 |>
  get_honestdid_obj_did2s(coef_name = "ts") |>
  honest_did_did2s(
    e = 0,
    type = "relative_magnitude",
    Mbarvec = seq(from = 0.5, to = 4, by = 0.5)
  )
sensitivity_results1
sensitivity_results1
HonestDiD::createSensitivityPlot_relativeMagnitudes(
  sensitivity_results1$robust_ci,
  sensitivity_results1$orig_ci
)

# plotting full results
fixest::iplot(
  list(static0, static1), 
  main="Effect of treatment on following rate change",
  xlab="Relative time to RT",
  col=c("steelblue", "orange"))

legend(x=-15, y=0.00001, col = c("steelblue", "orange"), pch = c(20, 18), 
       legend=c("non-union", "union"))
