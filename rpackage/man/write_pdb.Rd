% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_pdb.R
\name{write_pdb}
\alias{write_pdb}
\alias{write_pdb.pdb_gold_standard_info}
\alias{write_pdb.pdb_gold_standard_draws}
\alias{write_pdb.pdb_data}
\alias{write_pdb.pdb_data_info}
\alias{write_pdb.stanmodel}
\alias{write_pdb.pdb_model_info}
\alias{write_pdb.pdb_posterior}
\title{Write objects to pdb}
\usage{
write_pdb(x, pdb, overwrite = FALSE, ...)

\method{write_pdb}{pdb_gold_standard_info}(x, pdb, overwrite = FALSE, ...)

\method{write_pdb}{pdb_gold_standard_draws}(x, pdb, overwrite = FALSE, ...)

\method{write_pdb}{pdb_data}(x, pdb, overwrite = FALSE, name, ...)

\method{write_pdb}{pdb_data_info}(x, pdb, overwrite = FALSE, ...)

\method{write_pdb}{stanmodel}(x, pdb, overwrite = FALSE, ...)

\method{write_pdb}{pdb_model_info}(x, pdb, overwrite = FALSE, ...)

\method{write_pdb}{pdb_posterior}(x, pdb, overwrite = FALSE, ...)
}
\arguments{
\item{x}{an object to write to the pdb.}

\item{pdb}{the pdb to write to. Currently only a local pdb.}

\item{overwrite}{overwrite existing file?}

\item{...}{further arguments supplied to methods.}

\item{name}{the name of the data (used for [pdb_data] objects only).}
}
\description{
a function to simplify writing to a local pdb.
}
