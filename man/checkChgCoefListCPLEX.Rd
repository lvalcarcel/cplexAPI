\name{checkChgCoefListCPLEX}
\alias{checkChgCoefListCPLEX}
\alias{CPXcheckchgcoeflist}

\title{
  Validate Arguments of the Corresponding \code{chgCoefListCPLEX} Routine
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcheckchgcoeflist}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  checkChgCoefListCPLEX(env, lp, nnz, ia, ja, ra)
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
  \item{nnz}{
    Number of nonzero constraint coefficients.
  }
  \item{ia}{
	Row indices of the nonzero elements.
  }
  \item{ja}{
	Column indices of the nonzero elements.
  }
  \item{ra}{
	Nonzero elements.
  }
}

\details{
  Interface to the C function \code{checkChgCoefList} which calls the CPLEX
  function \code{CPXcheckchgcoeflist}.
}

\value{
  Nonzero if it detects an error in the data; it returns zero if it does not
  detect any data errors.
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
  \code{\link{chgCoefListCPLEX}}
}

\keyword{ optimize }

