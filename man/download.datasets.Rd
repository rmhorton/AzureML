% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/datasets.R
\name{download.datasets}
\alias{download.datasets}
\title{Download one or more datasets from an AzureML workspace.}
\usage{
download.datasets(source, name, ...)
}
\arguments{
\item{source}{Either one or more rows from a \code{\link{datasets}} data.frame in a workspace,
or just a workspace from \code{\link{workspace}}. When \code{source} is a workspace, then
the \code{name} parameter must also be specified.}

\item{name}{Optional character vector of one or more dataset names to filter the \code{datasets}
parameter list by.}

\item{...}{Optional arguments to pass to \code{read.table} for CSV or TSV DataTypeIds. For example,
specify \code{stringsAsFactors=TRUE} if you wish, or any other valid argument to \code{read.table}.}
}
\value{
If one dataset is specified (that is, one row from a workspace \code{datasets} data.frame),
then a single data.frame is returned.
If more than one dataset is specified (more than one row), then a list of data.frames is returned.
}
\description{
Download one or more datasets from an AzureML workspace into local R data.frame objects.
}
\note{
TSV- and CSV-formatted datasets return data.frame results with \code{stringsAsFactors=FALSE}
by default (independently of the global \code{stringsAsFactors} option).

This function can download datasets with various CSV and TSV "DataTypeIds", or "DataTypeId"
of "ARFF" or "PlainText". Other "DataTypeIds" return an error. See the AzureML Data Format
Conversion modules to convert data to a supported format.
}
\examples{
\dontrun{
  keyfile <- system.file("tests/testthat/config.json", package = "AzureML")
  
  library(AzureML)
  
  # workspace_id <- ""
  # authorization_token <- ""
  name <- "Blood donation data"
  
  ws <- workspace(config = keyfile)
  
  # The following three alternatives produce the same output:
  frame1 <- download.datasets(ws, name)
  frame2 <- download.datasets(datasets(ws), name)

  # Note that one can examine all the names, sizes, etc. of the datasets
  # in ws by examining d:
  d <- datasets(ws)
  frame3 <- download.datasets(subset(d, Name == name))

  head(frame1)
}
}
\seealso{
\code{\link{workspace}}, \code{\link{datasets}}, \code{\link{read.table}},
\code{\link{download.intermediate.dataset}}
}

