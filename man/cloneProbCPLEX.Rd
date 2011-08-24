\name{cloneProbCPLEX}
\alias{cloneProbCPLEX}
\alias{CPXcloneprob}

\title{
  Copy a CPLEX Problem Object
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcloneprob}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}
\usage{
  cloneProbCPLEX(env, lp)
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
  Interface to the C function \code{cloneProb} which calls the CPLEX
  function \code{CPXcloneprob}.
}

\value{
  If successful a pointer to the new CPLEX problem object as returned by
  \code{\link{initProbCPLEX}}, otherwise an instance of class
  \code{\link{cpxerr}}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\keyword{ optimize }

