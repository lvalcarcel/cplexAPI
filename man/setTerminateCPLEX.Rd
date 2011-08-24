\name{setTerminateCPLEX}
\alias{setTerminateCPLEX}

\title{
  Release Termination Signal
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsetterminate} with argument \code{terminate_p} set to \code{NULL}.
  Consult the IBM ILOG CPLEX documentation for more detailed information.
}
\usage{
  setTerminateCPLEX(env)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
}

\details{
  Interface to the C function \code{delTerminate} which calls the CPLEX
  function \code{CPXsetterminate} with argument \code{terminate_p} set to
  \code{NULL}.
}

\value{
  If successful, a pointer to a termination signal is returned, otherwise an
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
  \code{\link{delTerminateCPLEX}}, \code{\link{printTerminateCPLEX}},
  \code{\link{chgTerminateCPLEX}}
}

\keyword{ optimize }

