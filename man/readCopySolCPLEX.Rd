\name{readCopySolCPLEX}
\alias{readCopySolCPLEX}
\alias{CPXreadcopysol}

\title{
  Reads a Solution From a SOL Format File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXreadcopysol}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  readCopySolCPLEX(env, lp, fname)
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
  \item{fname}{
    Single character value giving the filname to read from.
  }
}

\details{
  Interface to the C function \code{readCopySol} which calls the CPLEX
  function \code{CPXreadcopysol}.
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

\keyword{ optimize }

