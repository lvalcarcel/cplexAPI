\name{baroptCPLEX}
\alias{baroptCPLEX}
\alias{CPXbaropt}

\title{
  Solve LP, QP or QCP Problem by Means of the Barrier Algorithm
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXbaropt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  baroptCPLEX(env, lp)
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
  Interface to the C function \code{baropt} which calls the CPLEX
  function \code{CPXbaropt}.
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
  \code{\link{solutionCPLEX}}
}

\keyword{ optimize }

