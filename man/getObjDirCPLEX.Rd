\name{getObjDirCPLEX}
\alias{getObjDirCPLEX}
\alias{CPXgetobjsen}

\title{
  Access the Direction of Optimization
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetobjsen}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
	getObjDirCPLEX(env, lp)
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
  Interface to the C function \code{getObjDir} which calls the CPLEX
  function \code{CPXgetobjsen}.
}

\value{
  Zero if the problem object or environment does not exist, otherwise nonzero.
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
