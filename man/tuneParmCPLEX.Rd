\name{tuneParmCPLEX}
\alias{tuneParmCPLEX}
\alias{CPXtuneparam}

\title{
  Tune Parameters of the Environment For Improved Optimizer Performance
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXtuneparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  tuneParmCPLEX(env, lp,
                nIntP = 0, intP = NULL, intPv = NULL,
                nDblP = 0, dblP = NULL, dblPv = NULL,
                nStrP = 0, strP = NULL, strPv = NULL)
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
  \item{nIntP}{
    Number of integer parameters to be fixed during tuning.
  }
  \item{intP}{
    Parameter numbers of the integer parameters which remain fixed.
  }
  \item{intPv}{
    Values for the parameters listed in \code{intP}.
  }
  \item{nDblP}{
    Number of double parameters to be fixed during tuning.
  }
  \item{dblP}{
    Parameter numbers of the double parameters which remain fixed.
  }
  \item{dblPv}{
    Values for the parameters listed in \code{dblP}.
  }
  \item{nStrP}{
    Number of string parameters to be fixed during tuning.
  }
  \item{strP}{
    Parameter numbers of the string parameters which remain fixed.
  }
  \item{strPv}{
    Values for the parameters listed in \code{strP}.
  }
}

\details{
  Interface to the C function \code{tuneParam} which calls the CPLEX
  function \code{CPXtuneparam}.
}

\value{
  Zero if successful, otherwise an instance of class \code{\link{cpxerr}}.
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

