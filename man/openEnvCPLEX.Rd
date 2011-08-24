\name{openEnvCPLEX}
\alias{openEnvCPLEX}
\alias{CPXopenCPLEX}

\title{
  Initialize a CPLEX Environment
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXopenCPLEX}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}
\usage{
  openEnvCPLEX()
}

\details{
  Interface to the C function \code{openEnv} which calls the CPLEX
  function \code{CPXopenCPLEX}.
}

\value{
  If successful, a pointer to the CPLEX environment is returnd, otherwise an
  instance of class \code{\link{cpxerr}}.
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
  \code{\link{closeEnvCPLEX}}
}

\keyword{ optimize }

