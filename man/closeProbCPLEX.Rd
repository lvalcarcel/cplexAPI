\name{closeProbCPLEX}
\alias{closeProbCPLEX}

\title{
  Close CPLEX Environment And Remove CPLEX Problem Object
}
\description{
  The function \code{closeProbCPLEX} closes a CPLEX environment and removes a
  CPLEX problem object.
}
\usage{
  closeProbCPLEX(env, lp)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
  \item{lp}{
    Pointer to an IBM ILOG CPLEX problem object as returned by
    \code{\link{initProbCPLEX}}.
  }
}

\details{
  Interface to the C functions \code{delProb} and \code{closeEnv} calling CPLEX
  functions \code{CPXcloseCPLEX} and \code{CPXfreeprob}.
}

\value{
  An integer vector containing the return values of \code{CPXcloseCPLEX} and
  \code{CPXfreeprob}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\seealso{
  \code{\link{openProbCPLEX}}, \code{\link{closeEnvCPLEX}},
  \code{\link{delProbCPLEX}}
}

\keyword{ optimize }

