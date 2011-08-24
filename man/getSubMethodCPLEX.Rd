\name{getSubMethodCPLEX}
\alias{getSubMethodCPLEX}
\alias{CPXgetsubmethod}

\title{
  Accesses Solution Method of the Last Subproblem Optimization
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetsubmethod}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getSubMethodCPLEX(env, lp)
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
  Interface to the C function \code{getSubMethod} which calls the CPLEX
  function \code{CPXgetsubmethod}.
}

\value{
  Integer value specifying the solution method.
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
