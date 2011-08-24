\name{solWriteCPLEX}
\alias{solWriteCPLEX}
\alias{CPXsolwrite}

\title{
  Write a Solution File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsolwrite}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  solWriteCPLEX(env, lp, fname)
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
    Single character value giving the filname to write to.
  }
}

\details{
  Interface to the C function \code{solWrite} which calls the CPLEX
  function \code{CPXsolwrite}.
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
  \code{\link{getProbTypeCPLEX}},
  \code{\link{cplexConstants}} section \dQuote{Problem Types}.
}

\keyword{ optimize }

