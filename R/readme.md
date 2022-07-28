# Model functions

The functions contained in the [darth_funcs.R](https://github.com/RobertASmithBresMed/plumberHE/blob/main/R/darth_funcs.R) script constitute a health economic model.

There are several functions from the DARTH group:
- `simulate_strategies` runs the model for different strategies
- `run_sick_sicker_model` is the engine, it runs the model for a set of parameter inputs
- `generate_psa_params` is adapted from DARTH, using the new `drawHelper` function to draw PSA iterations from defined distributions.
- `run_model` function runs the model for each PSA iteration and returns results. Uses the `dampack::run_psa` function.

A custom function is defined in the script.
- `overwrite_parameter_value` overwrites defined parameter inputs (e.g. parameter "p_HS1" use distribution "norm" with defined "mean" and "sd". 
