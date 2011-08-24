\name{setObjDirCPLEX}
\alias{setObjDirCPLEX}
\alias{CPXchgobjsen}

\title{
  Change the Sense of the Optimization for a Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgobjsen}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  setObjDirCPLEX(env, lp, lpdir)
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
  \item{lpdir}{
    A single integer value specifying the sense of the problem.
  }
}

\details{
  Interface to the C function \code{setObjDir} which calls the CPLEX
  function \code{CPXchgobjsen}.
}

\value{
  \code{NULL}
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
  \code{\link{cplexConstants}} section \dQuote{Generic constants}.
}

\keyword{ optimize }
