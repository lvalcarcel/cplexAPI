\name{getChgParmCPLEX}
\alias{getChgParmCPLEX}
\alias{CPXgetchgparam}

\title{
  Get Parameter Numbers for Parameters Which are Not Set at Their Default Values
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetchgparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}
\usage{
  getChgParmCPLEX(env)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
}

\details{
  Interface to the C function \code{getChgParm} which calls the CPLEX
  function \code{CPXgetchgparam}.
}

\value{
  A vector containing integer values (unique parameter identifiers) for
  parameters which are not set at their default values, otherwise an instance
  of class \code{\link{cpxerr}}.
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
  \code{\link{cplexConstants}}
}

\keyword{ optimize }

