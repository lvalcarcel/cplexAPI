\name{chgProbTypeCPLEX}
\alias{chgProbTypeCPLEX}
\alias{CPXchgprobtype}

\title{
  Change the Current Problem to a Related Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgprobtype}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  chgProbTypeCPLEX(env, lp, ptype)
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
  \item{ptype}{
    A single integer value specifying the problem type.
  }
}

\details{
  Interface to the C function \code{chgProbType} which calls the CPLEX
  function \code{CPXchgprobtype}.
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

