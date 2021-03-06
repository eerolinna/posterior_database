% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_gold_standard_draws_stan_sampling.R,
%   R/gold_standard.R
\name{gold_standard_draws.stanfit}
\alias{gold_standard_draws.stanfit}
\alias{gold_standard_draws}
\alias{gold_standard_draws.character}
\alias{gold_standard_draws.pdb_posterior}
\alias{gold_standard_draws.pdb_gold_standard_info}
\alias{assert_gold_standard_draws}
\title{Gold standard posterior draws}
\usage{
\method{gold_standard_draws}{stanfit}(x, pdb = pdb_default(), ...)

gold_standard_draws(x, ...)

\method{gold_standard_draws}{character}(x, pdb = pdb_default(), ...)

\method{gold_standard_draws}{pdb_posterior}(x, ...)

\method{gold_standard_draws}{pdb_gold_standard_info}(x, pdb = pdb_default(), ...)

assert_gold_standard_draws(x)
}
\arguments{
\item{x}{a [posterior] object or a posterior name.}

\item{pdb}{a [pdb] object (if [x] is a posterior name)}

\item{...}{further arguments supplied to specific methods.}
}
\value{
a gold_standard, draws_list object.
}
\description{
Gold standard posterior draws
}
