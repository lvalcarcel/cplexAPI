#------------------------------------------------------------------------------#
#                     R Interface to C API of IBM ILOG CPLEX                   #
#------------------------------------------------------------------------------#

#  cpxerrClass.R
#  R Interface to C API of IBM ILOG CPLEX Version 12.1, 12.2, 12.3.
#
#  Copyright (C) 2011 Gabriel Gelius-Dietrich, Department for Bioinformatics,
#  Institute for Informatics, Heinrich-Heine-University, Duesseldorf, Germany.
#  All right reserved.
#  Email: geliudie@uni-duesseldorf.de
#
#  This file is part of cplexAPI.
#
#  CplexAPI is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  CplexAPI is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with cplexAPI.  If not, see <http://www.gnu.org/licenses/>.


# constructor for class cpxerr
cpxerr <- function(x) {
    out <- as.integer(x[1])
    class(out) <- "cpxerr"
    return(out)
}


# generics
as.cpxerr  <- function(x) { UseMethod("as.cpxerr") }
errmsg     <- function(x) { UseMethod("errmsg")    }
errnum     <- function(x) { UseMethod("errnum")    }
err        <- function(x) { UseMethod("err")       }

'errnum<-' <- function(x, value) { UseMethod("errnum<-") }


# methods
as.cpxerr.numeric <- function(x) {
    cpxerr(x)
}

errmsg.cpxerr <- function(x) {
    msg <- getErrorStrCPLEX(x)
    return(msg)
}

errnum.cpxerr <- function(x) {
    num <- as.integer(x)
    return(num)
}

"errnum<-.cpxerr" <- function(x, value) {
    stopifnot(isTRUE(is(value, "numeric")))
    out <- x
    out[1] <- as.integer(value)
    return(out)
}

err.cpxerr <- function(x) {
    msg <- getErrorStrCPLEX(x)
    cat(msg)
}
