\name{getInfoStrParmCPLEX}
\alias{getInfoStrParmCPLEX}
\alias{CPXinfostrparam}

\title{
  Obtain Default Value of a String Parameter
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXinfostrparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getInfoStrParmCPLEX(env, parm)
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
  Interface to the C function \code{getInfoStrParm} which calls the CPLEX
  function \code{CPXinfostrparam}.
}

\value{
  A single character value.
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

