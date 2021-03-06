% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ConfidenceIntervalCalibration.R
\name{calibrateConfidenceInterval}
\alias{calibrateConfidenceInterval}
\title{Calibrate confidence intervals}
\usage{
calibrateConfidenceInterval(logRr, seLogRr, model, ciWidth = 0.95)
}
\arguments{
\item{logRr}{A numeric vector of effect estimates on the log scale.}

\item{seLogRr}{The standard error of the log of the effect estimates. Hint: often the standard
error = (log(<lower bound 95 percent confidence interval>) - log(<effect
estimate>))/qnorm(0.025).}

\item{model}{An object of type \code{systematicErrorModel} as created by the
\code{\link{fitSystematicErrorModel}} function.}

\item{ciWidth}{The width of the confidence interval. Typically this would be .95, for the 95
percent confidence interval.}
}
\value{
A data frame with calibrated confidence intervals and point estimates.
}
\description{
Calibrate confidence intervals
}
\details{
Compute calibrated confidence intervals based on a model of the systematic error.
}
\examples{
data <- simulateControls(n = 50 * 3, mean = 0.25, sd = 0.25, trueLogRr = log(c(1, 2, 4)))
model <- fitSystematicErrorModel(data$logRr, data$seLogRr, data$trueLogRr)
newData <- simulateControls(n = 15, mean = 0.25, sd = 0.25, trueLogRr = log(c(1, 2, 4)))
result <- calibrateConfidenceInterval(newData$logRr, newData$seLogRr, model)
result

}
