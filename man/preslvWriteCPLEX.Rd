\name{preslvWriteCPLEX}
\alias{preslvWriteCPLEX}
\alias{CPXpreslvwrite}

\title{
  Write a Presolved Version of the Problem to File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXpreslvwrite}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  preslvWriteCPLEX(env, lp, fname)
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
  \item{fname}{
    Single character value giving the file name to write to.
  }
}

\details{
  Interface to the C function \code{preslvWrite} which calls the CPLEX
  function \code{CPXpreslvwrite}.
}

\value{
  If successful a dingle numeric value containing the objective value difference
  between the original problem and the presolved problem, otherwise an instance
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
  \code{\link{readCopyProbCPLEX}}
}

\keyword{ optimize }

