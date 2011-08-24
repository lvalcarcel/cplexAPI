\name{getProbTypeCPLEX}
\alias{getProbTypeCPLEX}
\alias{CPXgetprobtype}

\title{
  Access Problem Type
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetprobtype}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getProbTypeCPLEX(env, lp)
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
  Interface to the C function \code{getProbType} which calls the CPLEX
  function \code{CPXgetprobtype}.
}

\value{
  A single integer value specifying the problem type.
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
  \code{\link{chgProbTypeCPLEX}},
  \code{\link{cplexConstants}} section \dQuote{Problem Types}.
}

\keyword{ optimize }

