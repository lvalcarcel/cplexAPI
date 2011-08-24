\name{getLogFileCPLEX}
\alias{getLogFileCPLEX}
\alias{CPXgetlogfile}

\title{
  Access log file to Which Messages are Written
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetlogfile}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getLogFileCPLEX(env)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
}

\details{
  Interface to the C function \code{getLogFile} which calls the CPLEX
  function \code{CPXgetlogfile}.
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
  \code{\link{setLogFileCPLEX}}
}

\keyword{ optimize }

