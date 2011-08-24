\name{presolveCPLEX}
\alias{presolveCPLEX}
\alias{CPXpresolve}

\title{
  Perform Presolve
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXpresolve}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  presolveCPLEX(env, lp, method)
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
    A single integer value specifying the optimization algorithm to be used to
    solve the problem after the presolve is completed.
  }
}

\details{
  Interface to the C function \code{presolve} which calls the CPLEX
  function \code{CPXpresolve}.
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
  \code{\link{cplexConstants}} section \dQuote{LP/QP solution algorithms}.
}

\keyword{ optimize }

