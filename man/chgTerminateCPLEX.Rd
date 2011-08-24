\name{chgTerminateCPLEX}
\alias{chgTerminateCPLEX}

\title{
  Change Termination Signal
}

\description{
  The function \code{chgTerminateCPLEX} changes termination signal.
}

\usage{
  chgTerminateCPLEX(env, tval = 1)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
  \item{tval}{
    Single integer value.
  }
}

\value{
  \code{NULL}
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
  \code{\link{setTerminateCPLEX}}, \code{\link{delTerminateCPLEX}},
  \code{\link{printTerminateCPLEX}}
}

\keyword{ optimize }

