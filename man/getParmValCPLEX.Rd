\name{getParmValCPLEX}
\alias{getParmValCPLEX}

\title{
  Values and Names of Parameters Having Non-Default Values
}

\description{
  The function \code{getParmValCPLEX} retrieves the names and actual values
  of all IBM ILOG CPLEX parameters, which do not have their default values.
}

\usage{
  getParmValCPLEX(env)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
}

\value{
  Either a list containing all non-default parameters and their values or
  \code{NULL}.
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
  \code{\link{cplexConstants}}
}

\keyword{ optimize }

