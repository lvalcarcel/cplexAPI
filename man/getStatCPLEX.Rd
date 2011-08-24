\name{getStatCPLEX}
\alias{getStatCPLEX}
\alias{CPXgetstat}

\title{
  Access the Solution Status of the Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetstat}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getStatCPLEX(env, lp)
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
  Interface to the C function \code{getStat} which calls the CPLEX
  function \code{CPXgetstat}.
}

\value{
  A single integer value giving the solution status.
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
  \code{\link{cplexConstants}} section \dQuote{Values returned for \code{stat}
  by solution}.
}

\keyword{ optimize }

