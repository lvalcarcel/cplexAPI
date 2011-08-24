\name{getInfoIntParmCPLEX}
\alias{getInfoIntParmCPLEX}
\alias{CPXinfointparam}

\title{
  Obtain Default, Minimum and Maximum Values of a Parameter of Type CPXINT
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXinfointparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getInfoIntParmCPLEX(env, parm)
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
  Interface to the C function \code{getInfoIntParm} which calls the CPLEX
  function \code{CPXinfointparam}.
}

\value{
  If successful a list is returned:
  \item{defvalue }{default value}
  \item{minvalue }{minimum value}
  \item{maxvalue }{maximum value}
  otherwise an instance of class \code{\link{cpxerr}}.
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

