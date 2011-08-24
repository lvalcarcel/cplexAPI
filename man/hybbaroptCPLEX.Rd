\name{hybbaroptCPLEX}
\alias{hybbaroptCPLEX}
\alias{CPXhybbaropt}

\title{
  Solve the Specified Problem by the CPLEX Barrier Optimizer
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXhybbaropt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  hybbaroptCPLEX(env, lp, method)
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
  \item{method}{
    A single integer value giving the crossover method to be implemented.
  }
}

\details{
  Interface to the C function \code{hybbaropt} which calls the CPLEX
  function \code{CPXhybbaropt}.
}

\value{
  Zero if successful, otherwise nonzero.
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
  \code{\link{solnInfoCPLEX}}, \code{\link{getStatCPLEX}},
  \code{\link{solutionCPLEX}}, \code{\link{cplexConstants}} section
  \dQuote{LP/QP solution algorithms}.
}

\keyword{ optimize }

