\name{delColsCPLEX}
\alias{delColsCPLEX}
\alias{CPXdelcols}

\title{
  Delete all Columns in a Specified Range
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdelcols}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  delColsCPLEX(env, lp, begin, end)
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
  \item{begin}{
    Integer value, numeric index of the first column to be deleted.
  }
  \item{end}{
    Integer value, numeric index of the last column to be deleted.
  }
}

\details{
  Interface to the C function \code{delCols} which calls the CPLEX
  function \code{CPXdelcols}.
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

