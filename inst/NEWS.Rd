%% cplexAPI Version History

\name{NEWS}
\title{cplexAPI News}
\encoding{UTF-8}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.4 2012-12-19}{
  \itemize{
    \item added functions \code{copyQPsepCPLEX} and \code{checkCopyQPsepCPLEX}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.3 2012-10-01}{
  \itemize{
    \item added getMIPstartsCPLEX to \file{NAMESPACE}
    \item added function \code{getBestObjValCPLEX()}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.2 2012-04-20}{
  \itemize{
    \item renamed \code{cplexPtr} method \code{isNULLpointer} to
          \code{isNULLpointerCPLEX}

    \item renamed \code{cplexPtr} method \code{pType} to \code{cplexPtrType}

    \item renamed \code{cplexPtr} method \code{ptr} to \code{cplexPointer}

    \item renamed \code{cplexPtr} slot \code{pType} to \code{cplexPtrType}

    \item renamed \code{cplexPtr} slot \code{ptr} to \code{cplexPointer}

    \item updated \file{configure.ac} script, see \file{INSTALL} for updated
          installation instructions

    \item updated \file{configure.ac} script: all \code{printf} commands in
          \file{check.c} will be replaced trough \code{Rprintf} during configure 

    \item file \file{NEWS} is now in \file{inst/NEWS.Rd}

    \item function \file{getMIPstartsCPLEX()} is not exported, it is not
          working properly
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.1 2012-03-15}{
  \itemize{
    \item added functions \code{refineConflictExtCPLEX()},
                          \code{getConflictExtCPLEX()},
                          \code{refineMIPstartConflictCPLEX()},
                          \code{refineMIPstartConflictExtCPLEX()},
                          \code{getNumQPnzCPLEX()},
                          \code{getNumQuadCPLEX()},
                          \code{getQPcoefCPLEX()},
                          \code{getQuadCPLEX()} and
                          \code{chgQPcoefCPLEX()}.

    \item exported API-functions are registered

    \item added finalizers for pointers to IBM ILOG CPLEX environments

    \item Functions like \code{openEnvCPLEX()} and \code{initProbCPLEX()} return
          now instances of class \code{cplexPtr}. This class has two slots:
    \tabular{ll}{
      pType \tab a character string giving the pointer type and \cr
      ptr   \tab a pointer to a C structure                     \cr
    }

    \item updated package vignette

    \item C function \code{status_message()} now uses \code{REprintf} instead of
          \code{fprintf} to printing to \code{stderr}

    \item C function \code{printTerminate()} uses Rprintf instead of printf

    \item added methods \code{isNULLpointer}, \code{isCPLEXprobPointer}, 
          \code{isCPLEXenvPointer}, \code{isCPLEXfilePointer},
          \code{isCPLEXchanPointer} and \code{isCPLEXtermPointer} for objects
          of class \code{cplexPtr}

    \item method \code{show} for objects of class \code{cplexPtr}

    \item method \code{summary} for objects of class \code{cplexPtr}

    \item method \code{show} for objects of class \code{cplexError}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.0 2012-02-21}{
  \itemize{
    \item added functions \code{addMIPstartsCPLEX()},
                          \code{chgMIPstartsCPLEX()},
                          \code{getMIPstartsCPLEX()},
                          \code{getNumMIPstartsCPLEX()},
                          \code{delMIPstartsCPLEX()},
                          \code{writeMIPstartsCPLEX()},
                          \code{readCopyMIPstartsCPLEX()},
                          \code{getMIPstartNameCPLEX()} and
                          \code{getMIPstartIndexCPLEX()}.

    \item added support for IBM ILOG CPLEX version 12.4

    \item added \code{-Wl,-no_compact_unwind} to \file{configure.ac} for
          MacOS X amd64

    \item S3 class \code{cpxerr} is now S4 class \code{cplexError}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.9 2012-02-03}{
  \itemize{
    \item added functions \code{checkCopyQuadCPLEX()},
                          \code{copyQuadCPLEX()} and
                          \code{qpoptCPLEX()}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.8 2011-08-24}{
  \itemize{
    \item minor update in \file{configure.ac}
    \item updated documentation
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.7 2011-08-22}{
  \itemize{
    \item added compatibility to IBM ILOG CPLEX version 12.3: new functions
          \code{getInfoLongParmCPLEX()}, \code{getLongParmCPLEX()} and
          \code{setLongParmCPLEX()}

    \item removed argument \code{ncols} from \code{getLowBndsIdsCPLEX()} and
          \code{getUppBndsIdsCPLEX()}

    \item \code{getStatStrCPLEX()} needs argument \code{env}, it can not be
          \code{NULL}

    \item \code{getParmTypeCPLEX()} returns instance of class \code{cpxerr} when
          failed

    \item updated documentation
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.6 2011-08-17}{
  \itemize{
    \item avoid changing parameters by assignment
    \item some changes in S3 class \code{cpxerr}, new methods:
      \tabular{ll}{
        \code{as.cpxerr} \tab default constructor      \cr
        \code{errmsg}    \tab get error message        \cr
        \code{errnum}    \tab get error number         \cr
        \code{err}        \tab cat error message       \cr
        \code{'errnum<-'} \tab set/change error number \cr
      }
    \item updated documentation
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.5 2011-07-28}{
  \itemize{
    \item added \file{NAMESPACE}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.4 2011-07-27}{
  \itemize{
    \item removed file \file{COPYING}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.3 2011-07-27}{
  \itemize{
    \item updated package vignette
    \item added files \file{INSTALL} and \file{README}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.2 2011-07-26}{
  \itemize{
    \item updated \file{configure.ac} script
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.1 2011-07-12}{
  \itemize{
    \item renamed from sybilCPLEX to \pkg{cplexAPI}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.0 2011-05-17}{
  \itemize{
    \item updated documentation
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.0.1 2010-12-14}{
  \itemize{
    \item fixed a bug in \code{chgRhsCPLEX()}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.0.0 2010-08-19}{
  \itemize{
    \item initial public release
  }
}



