\name{initProbCPLEX}
\alias{initProbCPLEX}
\alias{CPXcreateprob}

\title{
  Create a CPLEX Problem Object in the CPLEX Environment
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcreateprob}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  initProbCPLEX(env, pname = "CPLEX_PROB")
}

\arguments{
  \item{env}{
    Pointer to an IBM ILOG CPLEX environment as returned by
    \code{\link{openEnvCPLEX}}.
  }
  \item{pname}{
    A single character string containing the name of the problem object.
  }
}

\details{
  Interface to the C function \code{CPXcreate} which calls the CPLEX
  function \code{CPXcreateprob}.
}

\value{
  If successful, a pointer to the CPLEX problem object is returnd, otherwise an
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
  \code{\link{delProbCPLEX}}
}

\keyword{ optimize }

