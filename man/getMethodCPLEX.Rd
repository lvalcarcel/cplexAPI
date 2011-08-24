\name{getMethodCPLEX}
\alias{getMethodCPLEX}
\alias{CPXgetmethod}

\title{
  Obtain Solution Algorithm
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetmethod}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getMethodCPLEX(env, lp)
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
  Interface to the C function \code{getMethod} which calls the CPLEX
  function \code{CPXgetmethod}.
}

\value{
  A single integer value specifying the solution algorithm.
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
  \code{\link{cplexConstants}} section \dQuote{LP/QP solution algorithms}.
}

\keyword{ optimize }

