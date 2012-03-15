\name{cplexPtr-class}

\Rdversion{1.1}
\docType{class}

\alias{cplexPtr-class}
\alias{cplexPtr}
\alias{isCPLEXchanPointer,cplexPtr-method}
\alias{isCPLEXenvPointer,cplexPtr-method}
\alias{isCPLEXfilePointer,cplexPtr-method}
\alias{isCPLEXprobPointer,cplexPtr-method}
\alias{isCPLEXtermPointer,cplexPtr-method}
\alias{isNULLpointer,cplexPtr-method}
\alias{ptr,cplexPtr-method}
\alias{summary,cplexPtr-method}
\alias{pType,cplexPtr-method}
\alias{pType<-,cplexPtr-method}
\alias{isCPLEXchanPointer}
\alias{isCPLEXenvPointer}
\alias{isCPLEXfilePointer}
\alias{isCPLEXprobPointer}
\alias{isCPLEXtermPointer}
\alias{isNULLpointer}
\alias{ptr}
\alias{pType}
\alias{pType<-}

\title{Class \code{"cplexPtr"}}

\description{
  Structure of the class \code{"cplexPtr"}. Objects of that class are
  used to hold pointers to C structures used by IBM ILOG CPLEX.
}

\section{Objects from the Class}{
    Objects can be created by calls of the form\cr
    \code{env <- openEnvCPLEX()} and/or\cr
    \code{prob <- initProbCPLEX(env))}.
}

\section{Slots}{
  \describe{
    \item{\code{pType}:}{
        Object of class \code{"character"} giving the pointer type.
    }
    \item{\code{ptr}:}{
        Object of class \code{"externalptr"} containig the pointer to a
        C structure.
    }
  }
}

\section{Methods}{
  \describe{
    \item{isCPLEXchanPointer}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{ptr(object)} is a pointer to a
        CPLEX channel, otherwise \code{FALSE}.
    }
    \item{isCPLEXenvPointer}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{ptr(object)} is a pointer to a
        CPLEX environment, otherwise \code{FALSE}.
    }
    \item{isCPLEXfilePointer}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{ptr(object)} is a pointer to a
        CPLEX file, otherwise \code{FALSE}.
    }
    \item{isCPLEXprobPointer}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{ptr(object)} is a pointer to a
        CPLEX problem object, otherwise \code{FALSE}.
    }
    \item{isCPLEXtermPointer}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{ptr(object)} is a pointer to a
        CPLEX termination signal, otherwise \code{FALSE}.
    }
    \item{isNULLpointer}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{ptr(object)} is a NULL pointer,
        otherwise \code{FALSE}.
    }
    \item{ptr}{\code{signature(object = "cplexPtr")}:
        gets the \code{ptr} slot.
    }
    \item{summary}{\code{signature(object = "cplexPtr")}:
        prints a summary of the problem object to the command line. If a
        solution is available, it prints also information retrieved by
        \code{\link{solutionCPLEX}} and \code{\link{solnInfoCPLEX}}. If no
        solution is available, it prints the corresponding error message.
        The method returns invisibly \code{NULL}. The CPLEX environment pointer
        is needed as second argument \code{env} to \code{summary}.
    }
    \item{pType}{\code{signature(object = "cplexPtr")}:
        gets the \code{pType} slot.
    }
    \item{pType<-}{\code{signature(object = "cplexPtr")}:
        sets the \code{pType} slot.
    }
  }
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
  \code{\link{openEnvCPLEX}} and \code{\link{initProbCPLEX}}
}

\keyword{ optimize }
