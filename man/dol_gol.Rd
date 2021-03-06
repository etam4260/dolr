% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dolrgrowthlearning.R
\name{dol_gol}
\alias{dol_gol}
\title{dol_gol}
\usage{
dol_gol(dataset = 1, sheet = 1, key = Sys.getenv("DOL_KEY"))
}
\arguments{
\item{dataset}{There are currently 11 datasets to choose from. Specify the one you want with a number from 1-11.
\enumerate{
\item OIT Initial Claims
\item OUI Initial Claims V1
\item IPIA V1
\item Quarterly Census Employment and Wage (CEW) V1
\item Occupational Employment Statistics Survey (OES) V1
\item Current Population Survey (CPS) V1
\item Current Employment Statistics (CES) V1
\item Consumer Price Indexes (CPI) V1
\item 2010 Workforce Investment Act V1
\item 2010 Occupational Employment Statistics V1
\item BLS Numbers V1
}}

\item{sheet}{For each dataset chosen, there are sub sheets within them. You must specify which sub-sheet you want.}

\item{key}{The API key for this user. You must go to the DOL and sign up for an account and request for an API key.}
}
\value{
A dataframe
}
\description{
This function queries the US Department of Labor Expanding Growth Opportunities and Learning Datasets. The datasets currently use V1 of DOL API.
}
\keyword{Expanding}
\keyword{Growth}
\keyword{Learning}
\keyword{Opportunities}
\keyword{and}
