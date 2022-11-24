# test to check that addNums matches the 'sum' function ...
testthat::test_that(desc = "Run the API & checkt hat the dimensions are the same as before.",
                    code = {
                      
         # query the API with a set of inputs ...
         results <- httr::content(
                        httr::POST(
                          # the Server URL can also be kept confidential, but will leave here for now 
                          url = "https://living-he-32wi7oazkq-nw.a.run.app",
                          # path for the API within the server URL
                          path = "runDARTHmodel",
                          # code is passed to the client API from GitHub.
                          query = list(model_functions = 
                                         paste0("https://raw.githubusercontent.com/RobertASmith/plumberHE/main/R/darth_funcs.R")),
                          # set of parameters to be changed ... 
                          # we are allowed to change these but not some others
                          body = list(
                            param_updates = jsonlite::toJSON(
                              data.frame(parameter = c("p_HS1","p_S1H"),
                                         distribution = c("beta","beta"),
                                         v1 = c(25, 50),
                                         v2 = c(150, 100))
                            )
                          ),
                          # we include a key here to access the API ... like a password protection
                          config = httr::add_headers(key = Sys.getenv("API_KEY"))
                        )
                      )
         # expect that the data structure is the same ... 
         testthat::expect_equal(dim(results),
                                dim(readRDS("tests/results_data")[1]),
                                info = "Please make sure that the CONNECT_KEY is set correctly, e.g. using:
                                Sys.setenv(CONNECT_KEY = 'XXXXXXXXXX')"
                                )
                      
                    })
  
