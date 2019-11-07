context("test-pdb-content")

test_that("Check that all posteriors can access stan_data and stan_code", {
  posterior_db_path <- posteriordb:::get_test_pdb_dir()

  expect_silent(pdb_test <- pdb(posterior_db_path))
  expect_silent(posteriors <- posterior_names(pdb_test))

  for (i in seq_along(posteriors)) {
    expect_silent(po <- posterior(name = posteriors[i], pdb = pdb_test))
    expect_silent(sc <- stan_code(po))
    expect_silent(sd <- stan_data(po))
  }
})