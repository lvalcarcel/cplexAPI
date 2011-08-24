\name{getParmNumCPLEX}
\alias{getParmNumCPLEX}
\alias{CPXgetparamnum}

\title{
  Obtain the Reference Number of a CPLEX Parameter
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetparamnum}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getParmNumCPLEX(env, nparm)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
  \item{nparm}{
    A single character value containing the name of the parameter.
  }
}

\details{
  Interface to the C function \code{getParmNum} which calls the CPLEX
  function \code{CPXgetparamnum}.
}

\value{
  A single integer value.
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

