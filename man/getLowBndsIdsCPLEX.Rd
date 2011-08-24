\name{getLowBndsIdsCPLEX}
\alias{getLowBndsIdsCPLEX}

\title{
  Retrieve Lower Bounds on Variables
}

\description{
  The function retrieves the lower bounds on specified variables.
}

\usage{
  getLowBndsIdsCPLEX(env, lp, ind)
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
  \item{ind}{
    Column indices of variables (remember: first index is \code{0}).
  }
}

\value{
  A numeric vector containing the lower bounds on the specified variables.
  If not successfull an instance of class \code{\link{cpxerr}} is returned.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\keyword{ optimize }

