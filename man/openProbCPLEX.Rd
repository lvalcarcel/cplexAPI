\name{openProbCPLEX}
\alias{openProbCPLEX}

\title{
  Create new CPLEX Environment And New CPLEX Problem Object
}

\description{
  The function \code{openProbCPLEX} creates a new CPLEX environment and a new
  CPLEX problem object.
}

\usage{
  openProbCPLEX(pname = "CPLEX_PROB")
}

\arguments{
  \item{pname}{
    A single character string containing the name of the problem object.
  }
}

\details{
  Interface to the C functions \code{openEnv} and \code{initProb} calling CPLEX
  functions \code{CPXopenCPLEX} and \code{CPXcreateprob}.
}

\value{
  \item{env }{A pointer to the CPLEX environment as returned by
              \code{\link{openEnvCPLEX}}.}
  \item{lp  }{A pointer to the CPLEX problem object as returned by
              \code{\link{initProbCPLEX}}.}
  If \code{openEnvCPLEX()} failes, \code{env} will be of class
  \code{\link{cpxerr}} and \code{lp} will be \code{NULL}.
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
  \code{\link{closeProbCPLEX}}, \code{\link{openEnvCPLEX}},
  \code{\link{initProbCPLEX}}
}

\keyword{ optimize }

