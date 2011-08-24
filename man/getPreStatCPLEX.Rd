\name{getPreStatCPLEX}
\alias{getPreStatCPLEX}
\alias{CPXgetprestat}

\title{
  Access Presolve Status Information for Columns and Rows
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetprestat}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getPreStatCPLEX(env, lp)
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
}

\details{
  Interface to the C function \code{getPreStat} which calls the CPLEX
  function \code{CPXgetprestat}.
}

\value{
  If successful a list is returned:
  \item{prestat }{status of the presolved problem}
  \item{pcstat }{presolve status values of the columns}
  \item{prstat }{presolve status values of the rows}
  \item{ocstat }{presolve status values of the columns of the presolved problem}
  \item{orstat }{presolve status values of the rows of the presolved problem}
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
