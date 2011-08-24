\name{refineConflictCPLEX}
\alias{refineConflictCPLEX}
\alias{CPXrefineconflict}

\title{
  Identify a Minimal Conflict for the Infeasibility of the Linear Constraints
  and the Variable Bounds
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXrefineconflict}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  refineConflictCPLEX(env, lp)
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
  Interface to the C function \code{refineConflict} which calls the CPLEX
  function \code{CPXrefineconflict}.
}

\value{
  If successful a list is returned:
  \item{confnumrows }{number of linear constraints in the conflict}
  \item{confnumcols }{number of variable bounds in the conflict}
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
  \code{\link{getConflictCPLEX}}
}

\keyword{ optimize }

