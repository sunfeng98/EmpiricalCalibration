% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ConfidenceIntervalCalibration.R
\name{computeTraditionalCi}
\alias{computeTraditionalCi}
\title{Compute the (traditional) confidence interval}
\usage{
computeTraditionalCi(logRr, seLogRr, ciWidth = 0.95)
}
\arguments{
\item{logRr}{A numeric vector of one or more effect estimates on the log scale}

\item{seLogRr}{The standard error of the log of the effect estimates. Hint: often the standard
error = (log(<lower bound 95 percent confidence interval>) - log(<effect
estimate>))/qnorm(0.025)}

\item{ciWidth}{The width of the confidence interval. Typically this would be .95, for the 95
percent confidence interval.}
}
\value{
The point estimate and confidence interval
}
\description{
\code{computeTraditionalCi} computes the traditional confidence interval based on the log of the
relative risk and the standerd error of the log of the relative risk.
}
\examples{
data(sccs)
positive <- sccs[sccs$groundTruth == 1, ]
computeTraditionalCi(positive$logRr, positive$seLogRr)

}
