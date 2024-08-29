# Replication Materials for *Emergent structures of attention on social media are driven by amplification and triad transitivity*

## Contents (code)
- `{jkr, jorts}_data_parsing_interpolation_clean.ipynb`: iPython notebooks containing the data parsing and interpolation functionality for each attention broker case. Each notebook also includes a pre-trends analysis and produces the .tsv of data required for the differences-in-differences event study.
- `jorts_utils.py`: Python file containing utility functions for data parsing and interpolation.
- `{jkr, jorts}_did.R`: R file that runs the differences-in-differences event studies for each attention broker case and plots the results.
- `triad_closure.py`: Python script demonstrating the time-bounded following event collection procedure

## Contents (data):
The dataset is being uploaded to the Harvard Dataverse (TODO: add DOI)
For best results, place the data in a directory at this level labeled `data`.
- `all_{jkr, jorts}_did_data_test_all.tsv`: TSV containing the interpolated per-account per-day follower accumulation for known followers & non-followers of each attention broker.
- `HASHED_jkr_followers_full_past_20180615.json`: json object mapping all of J.K. Rowling's followers accumulated after June 15, 2018 to a cursor timestamp bounding the time at which the following event occurred. Each follower's user ID is hashed using SHA256 for privacy.
- `HASHED_jorts_follower_data_by_cursor_all.json`: json object mapping all of Jorts the Cat's followers accumulated during the period of study to a cursor timestamp bounding the time at which the following event occurred. Each follower's user ID is hashed using SHA256 for privacy. 
- `jkr_rts_labels_final.tsv`: TSV file containing the coded labels for all accounts retweeted by J.K. Rowling in the period of study
- `jkr_rts_past_20180615.tsv`: TSV file containing all of J.K. Rowling's retweets for the period of study
- `jorts_ground_truth_full.json`: json object indicating union assocation for each of Jorts the Cat's retweeted accounts 
- `jorts_rt_authors_to_ts.json`: json object mapping authors retweeted by Jorts the Cat to the timestamps at which the retweets occurred.
- `{jkr, jorts}/HASHED_*.json`: json object mapping cursor timestamps bounding follow timings to lists of hashed user IDs of followers. 
