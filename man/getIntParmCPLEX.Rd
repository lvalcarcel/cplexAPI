\name{getIntParmCPLEX}
\alias{getIntParmCPLEX}
\alias{CPXgetintparam}

\title{
  Obtain the Current Value of a CPLEX Parameter of Type CPXINT
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetintparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getIntParmCPLEX(env, parm)
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
  \item{parm}{
    Constant or reference number of the desired parameter.
  }
}

\details{
  Interface to the C function \code{getIntParm} which calls the CPLEX
  function \code{CPXgetintparam}.
}

\value{
  Parameter value if successful, otherwise an instance of class
  \code{\link{cpxerr}}.
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

