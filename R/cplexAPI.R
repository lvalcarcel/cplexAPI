#------------------------------------------------------------------------------#
#                     R Interface to C API of IBM ILOG CPLEX                   #
#------------------------------------------------------------------------------#

#  cplexAPI.R
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


#------------------------------------------------------------------------------#
#                                  the interface                               #
#------------------------------------------------------------------------------#

getErrorStrCPLEX <- function(err, env = NULL) {

    if (is.null(env)) {
        Cenv <- as.null(env)
    }
    else {
        Cenv <- env
    }

    errmsg <- .Call("getErrorStr", PACKAGE = "cplexAPI",
                    Cenv,
                    as.integer(err)
              )
    return(errmsg)

}


#------------------------------------------------------------------------------#

getStatStrCPLEX <- function(env, stat) {

    statmsg <- .Call("getStatStr", PACKAGE = "cplexAPI",
                    env,
                    as.integer(stat)
              )
    return(statmsg)

}


#------------------------------------------------------------------------------#

closeEnvCPLEX <- function(env) {

    status <- .Call("closeEnv", env, PACKAGE = "cplexAPI")
    return(status)

}


#------------------------------------------------------------------------------#

openEnvCPLEX <- function() {
    return(.Call("openEnv", PACKAGE = "cplexAPI"))
}


#------------------------------------------------------------------------------#

delProbCPLEX <- function(env, lp) {

    status <- .Call("delProb", env, lp, PACKAGE = "cplexAPI")
    return(status)

}


#------------------------------------------------------------------------------#

initProbCPLEX <- function(env, pname = "CPLEX_PROB") {

    probP <- .Call("initProb", PACKAGE = "cplexAPI",
                   env,
                   as.character(pname)
             )

    return(probP)

}


#------------------------------------------------------------------------------#

cloneProbCPLEX <- function(env, lp) {
    return(.Call("cloneProb", env, lp, PACKAGE = "cplexAPI"))
}


#------------------------------------------------------------------------------#

getProbTypeCPLEX <- function(env, lp) {

    ptype <- .Call("getProbType", PACKAGE = "cplexAPI",
                   env,
                   lp
             )

    return(ptype)
}


#------------------------------------------------------------------------------#

chgProbTypeCPLEX <- function(env, lp, ptype) {

    status <- .Call("chgProbType", PACKAGE = "cplexAPI",
                     env,
                     lp,
                     as.integer(ptype)
             )

    return(status)
}


#------------------------------------------------------------------------------#

getVersionCPLEX <- function(env) {

    version <- .Call("getVersion", PACKAGE = "cplexAPI",
                     env
               )

    return(version)

}


#------------------------------------------------------------------------------#

closeProbCPLEX <- function(env, lp) {

    status    <- integer(2)
    status[1] <- .Call("delProb", env, lp, PACKAGE = "cplexAPI")
    status[2] <- .Call("closeEnv", env, PACKAGE = "cplexAPI")
    return(status)

}


#------------------------------------------------------------------------------#

openProbCPLEX <- function(pname = "CPLEX_PROB") {

    en <- .Call("openEnv", PACKAGE = "cplexAPI")
    if (!is(en, "cpxerr")) {
        pr <- .Call("initProb", PACKAGE = "cplexAPI",
                    en,
                    as.character(pname)
              )
    }
    else {
        pr <- NULL
    }

    return(list(env = en, lp = pr))
}


#------------------------------------------------------------------------------#

setDefaultParmCPLEX <- function(env) {

    status <- .Call("setDefaultParm", PACKAGE = "cplexAPI",
                    env
              )
    return(status)

}


#------------------------------------------------------------------------------#

setIntParmCPLEX <- function(env, parm, value) {

    status <- .Call("setIntParm", PACKAGE = "cplexAPI",
                    env,
                    as.integer(parm),
                    as.integer(value)
              )
    return(status)

}


#------------------------------------------------------------------------------#

getIntParmCPLEX <- function(env, parm) {

    value <- .Call("getIntParm", PACKAGE = "cplexAPI",
                   env,
                   as.integer(parm)
             )

    return(value)
}


#------------------------------------------------------------------------------#

getInfoIntParmCPLEX <- function(env, parm) {

    param <- .Call("getInfoIntParm", PACKAGE = "cplexAPI",
                   env,
                   as.integer(parm)
             )

    return(param)
}

#------------------------------------------------------------------------------#

setDblParmCPLEX <- function(env, parm, value) {

    status <- .Call("setDblParm", PACKAGE = "cplexAPI",
                    env,
                    as.integer(parm),
                    as.numeric(value)
              )
    return(status)

}


#------------------------------------------------------------------------------#

getDblParmCPLEX <- function(env, parm) {

    value <- .Call("getDblParm", PACKAGE = "cplexAPI",
                   env,
                   as.integer(parm)
             )

    return(value)
}


#------------------------------------------------------------------------------#

getInfoDblParmCPLEX <- function(env, parm) {

    param <- .Call("getInfoDblParm", PACKAGE = "cplexAPI",
                   env,
                   as.integer(parm)
             )

    return(param)
}


#------------------------------------------------------------------------------#

setStrParmCPLEX <- function(env, parm, value) {

    status <- .Call("setStrParm", PACKAGE = "cplexAPI",
                    env,
                    as.integer(parm),
                    as.character(value)
              )
    return(status)

}


#------------------------------------------------------------------------------#

getStrParmCPLEX <- function(env, parm) {

    value <- .Call("getStrParm", PACKAGE = "cplexAPI",
                   env,
                   as.integer(parm)
             )

    return(value)
}


#------------------------------------------------------------------------------#

getInfoStrParmCPLEX <- function(env, parm) {

    param <- .Call("getInfoStrParm", PACKAGE = "cplexAPI",
                   env,
                   as.integer(parm)
             )

    return(param)
}


#------------------------------------------------------------------------------#

getParmNameCPLEX <- function(env, wparm) {

    nparm <- .Call("getParmName", PACKAGE = "cplexAPI",
                   env,
                   as.integer(wparm)
             )

    return(nparm)
}


#------------------------------------------------------------------------------#

getParmNumCPLEX <- function(env, nparm) {

    numparm <- .Call("getParmNum", PACKAGE = "cplexAPI",
                     env,
                     as.character(nparm)
               )

    return(numparm)
}


#------------------------------------------------------------------------------#

readCopyParmCPLEX <- function(env, fname) {

    status <- .Call("readCopyParm", PACKAGE = "cplexAPI",
                    env,
                    as.character(fname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

writeParmCPLEX <- function(env, fname) {

    status <- .Call("writeParm", PACKAGE = "cplexAPI",
                    env,
                    as.character(fname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getParmTypeCPLEX <- function(env, parm) {

    status <- .Call("getParmType", PACKAGE = "cplexAPI",
                    env,
                    as.integer(parm)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getChgParmCPLEX <- function(env) {

    status <- .Call("getChgParm", PACKAGE = "cplexAPI",
                    env
              )

    return(status)
}


#------------------------------------------------------------------------------#

setObjDirCPLEX <- function(env, lp, lpdir) {

    invisible(
        .Call("setObjDir", PACKAGE = "cplexAPI",
              env,
              lp,
              as.integer(lpdir)
        )
    )

}


#------------------------------------------------------------------------------#

getObjDirCPLEX <- function(env, lp) {

    lpdir <- .Call("getObjDir", PACKAGE = "cplexAPI",
                   env,
                   lp
             )

    return(lpdir)
}


#------------------------------------------------------------------------------#

copyLpCPLEX <- function(env, lp, nCols, nRows, lpdir, objf, rhs, sense,
                        matbeg, matcnt, matind, matval, lb, ub, rngval = NULL
                       ) {

    if (is.null(rngval)) {
        Crngval <- as.null(rngval)
    }
    else {
        Crngval <- as.numeric(rngval)
    }

    status <- .Call("copyLp", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(nCols),
                    as.integer(nRows),
                    as.integer(lpdir),
                    as.numeric(objf),
                    as.numeric(rhs),
                    as.character(paste(sense, collapse = "")),
                    as.integer(matbeg),
                    as.integer(matcnt),
                    as.integer(matind),
                    as.numeric(matval),
                    as.numeric(lb),
                    as.numeric(ub),
                    Crngval
              )

    return(status)
}


#------------------------------------------------------------------------------#

copyLpwNamesCPLEX <- function(env, lp, nCols, nRows, lpdir, objf, rhs, sense,
                              matbeg, matcnt, matind, matval, lb, ub,
                              rngval = NULL, cnames = NULL, rnames = NULL) {

    if (is.null(rngval)) {
        Crngval <- as.null(rngval)
    }
    else {
        Crngval <- as.numeric(rngval)
    }

    if (is.null(cnames)) {
        Ccnames <- as.null(cnames)
    }
    else {
        Ccnames <- as.character(cnames)
    }

    if (is.null(rnames)) {
        Crnames <- as.null(rnames)
    }
    else {
        Crnames <- as.character(rnames)
    }

    status <- .Call("copyLpwNames", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(nCols),
                    as.integer(nRows),
                    as.integer(lpdir),
                    as.numeric(objf),
                    as.numeric(rhs),
                    as.character(paste(sense, collapse = "")),
                    as.integer(matbeg),
                    as.integer(matcnt),
                    as.integer(matind),
                    as.numeric(matval),
                    as.numeric(lb),
                    as.numeric(ub),
                    Crngval,
                    Ccnames,
                    Crnames
              )

    return(status)
}


#------------------------------------------------------------------------------#

writeProbCPLEX <- function(env, lp, fname, ftype = NULL) {

    if (is.null(ftype)) {
        Cftype <- as.null(ftype)
    }
    else {
        Cftype <- as.character(ftype)
    }

    status <- .Call("writeProb", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.character(fname),
                    Cftype
              )

    return(status)
}


#------------------------------------------------------------------------------#

readCopyProbCPLEX <- function(env, lp, fname, ftype = NULL) {

    if (is.null(ftype)) {
        Cftype <- as.null(ftype)
    }
    else {
        Cftype <- as.character(ftype)
    }

    status <- .Call("readCopyProb", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.character(fname),
                    Cftype
              )

    return(status)
}


#------------------------------------------------------------------------------#

dualWriteCPLEX <- function(env, lp, fname) {

    status <- .Call("dualWrite", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.character(fname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

presolveCPLEX <- function(env, lp, method) {

    preslv <- .Call("presolve", PACKAGE = "cplexAPI",
                     env,
                     lp,
                     as.integer(method)
               )

    return(preslv)
}


#------------------------------------------------------------------------------#

getPreStatCPLEX <- function(env, lp) {

    prestat <- .Call("getPreStat", PACKAGE = "cplexAPI",
                      env,
                      lp
              )

    return(prestat)
}


#------------------------------------------------------------------------------#

basicPresolveCPLEX <- function(env, lp) {

    bpres <- .Call("basicPresolve", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(bpres)
}


#------------------------------------------------------------------------------#

preslvWriteCPLEX <- function(env, lp, fname) {

    off <- .Call("preslvWrite", PACKAGE = "cplexAPI",
                  env,
                  lp,
                  as.character(fname)
           )

    return(off)
}


#------------------------------------------------------------------------------#

getRedLpCPLEX <- function(env, lp) {

    redlp <- .Call("getRedLp", PACKAGE = "cplexAPI",
                    env,
                    lp
           )

    return(redlp)
}


#------------------------------------------------------------------------------#

getObjOffsetCPLEX <- function(env, lp) {

    ooff <- .Call("getObjOffset", PACKAGE = "cplexAPI",
                   env,
                   lp
            )

    return(ooff)
}


#------------------------------------------------------------------------------#

unscaleProbCPLEX <- function(env, lp) {

    status <- .Call("unscaleProb", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(status)
}


#------------------------------------------------------------------------------#

newRowsCPLEX <- function(env, lp,
                         nrows, rhs = NULL, sense = NULL,
                         rngval = NULL, rnames = NULL) {

    if (is.null(rhs)) {
        Crhs <- as.null(rhs)
    }
    else {
        Crhs <- as.numeric(rhs)
    }

    if (is.null(sense)) {
        Csense <- as.null(sense)
    }
    else {
        Csense <- as.character(paste(sense, collapse = ""))
    }

    if (is.null(rngval)) {
        Crngval <- as.null(rngval)
    }
    else {
        Crngval <- as.numeric(rngval)
    }

    if (is.null(rnames)) {
        Crnames <- as.null(rnames)
    }
    else {
        Crnames <- as.character(rnames)
    }

    status <- .Call("newRows", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(nrows),
                    Crhs,
                    Csense,
                    Crngval,
                    Crnames
              )

    return(status)
}


#------------------------------------------------------------------------------#

addRowsCPLEX <- function(env, lp, ncols, nrows, nnz, matbeg, matind, matval,
                         rhs = NULL, sense = NULL,
                         cnames = NULL, rnames = NULL) {

    if (is.null(rhs)) {
        Crhs <- as.null(rhs)
    }
    else {
        Crhs <- as.numeric(rhs)
    }

    if (is.null(sense)) {
        Csense <- as.null(sense)
    }
    else {
        Csense <- as.character(paste(sense, collapse = ""))
    }

    if (is.null(cnames)) {
        Ccnames <- as.null(cnames)
    }
    else {
        Ccnames <- as.character(cnames)
    }

    if (is.null(rnames)) {
        Crnames <- as.null(rnames)
    }
    else {
        Crnames <- as.character(rnames)
    }

    status <- .Call("addRows", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(ncols),
                    as.integer(nrows),
                    as.integer(nnz),
                    Crhs,
                    Csense,
                    as.integer(matbeg),
                    as.integer(matind),
                    as.numeric(matval),
                    Ccnames,
                    Crnames
              )

    return(status)
}


#------------------------------------------------------------------------------#

getNumRowsCPLEX <- function(env, lp) {

    nrows <- .Call("getNumRows", PACKAGE = "cplexAPI",
                   env,
                   lp
             )

    return(nrows)
}


#------------------------------------------------------------------------------#

delRowsCPLEX <- function(env, lp, begin, end) {

    status <- .Call("delRows", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(begin),
                    as.integer(end)
              )

    return(status)
}


#------------------------------------------------------------------------------#

delSetRowsCPLEX <- function(env, lp, delstat) {

    indrows <- .Call("delSetRows", PACKAGE = "cplexAPI",
                     env,
                     lp,
                     as.integer(delstat)
               )

    return(indrows)
}


#------------------------------------------------------------------------------#

newColsCPLEX <- function(env, lp, ncols,
                         obj = NULL, lb = NULL, ub = NULL,
                         xctype = NULL, cnames = NULL) {

    if (is.null(obj)) {
        Cobj <- as.null(obj)
    }
    else {
        Cobj <- as.numeric(obj)
    }

    if (is.null(lb)) {
        Clb <- as.null(lb)
    }
    else {
        Clb <- as.numeric(lb)
    }

    if (is.null(ub)) {
        Cub <- as.null(ub)
    }
    else {
        Cub <- as.numeric(ub)
    }

    if (is.null(xctype)) {
        Cxctype <- as.null(xctype)
    }
    else {
        Cxctype <- as.character(paste(xctype, collapse = ""))
    }

    if (is.null(cnames)) {
        Ccnames <- as.null(cnames)
    }
    else {
        Ccnames <- as.character(cnames)
    }

    status <- .Call("newCols", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(ncols),
                    Cobj,
                    Clb,
                    Cub,
                    Cxctype,
                    Ccnames
              )

    return(status)
}


#------------------------------------------------------------------------------#

addColsCPLEX <- function(env, lp, ncols, nnz, objf, matbeg, matind, matval,
                         lb = NULL, ub = NULL, cnames = NULL) {

    if (is.null(lb)) {
        Clb <- as.null(lb)
    }
    else {
        Clb <- as.numeric(lb)
    }

    if (is.null(ub)) {
        Cub <- as.null(ub)
    }
    else {
        Cub <- as.numeric(ub)
    }

    if (is.null(cnames)) {
        Ccnames <- as.null(cnames)
    }
    else {
        Ccnames <- as.character(cnames)
    }

    status <- .Call("addCols", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(ncols),
                    as.integer(nnz),
                    as.numeric(objf),
                    as.integer(matbeg),
                    as.integer(matind),
                    as.numeric(matval),
                    Clb,
                    Cub,
                    Ccnames
              )

    return(status)
}


#------------------------------------------------------------------------------#

getNumColsCPLEX <- function(env, lp) {

    ncols <- .Call("getNumCols", PACKAGE = "cplexAPI",
                   env,
                   lp
             )

    return(ncols)
}


#------------------------------------------------------------------------------#

delColsCPLEX <- function(env, lp, begin, end) {

    status <- .Call("delCols", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(begin),
                    as.integer(end)
              )

    return(status)
}


#------------------------------------------------------------------------------#

delSetColsCPLEX <- function(env, lp, delstat) {

    indcols <- .Call("delSetCols", PACKAGE = "cplexAPI",
                     env,
                     lp,
                     as.integer(delstat)
               )

    return(indcols)
}


#------------------------------------------------------------------------------#

chgObjCPLEX <- function(env, lp, ncols, ind, val) {

    status <- .Call("chgObj", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(ncols),
                    as.integer(ind),
                    as.numeric(val)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getObjCPLEX <- function(env, lp, begin, end) {

    obj_coef <- .Call("getObj", PACKAGE = "cplexAPI",
                      env,
                      lp,
                      as.integer(begin),
                      as.integer(end)
                )

    return(obj_coef)
}


#------------------------------------------------------------------------------#

copyObjNameCPLEX <- function(env, lp, oname) {

    status <- .Call("copyObjName", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.character(oname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getObjNameCPLEX <- function(env, lp) {

    objname <- .Call("getObjName", PACKAGE = "cplexAPI",
                      env,
                      lp
               )

    return(objname)
}


#------------------------------------------------------------------------------#

chgCoefListCPLEX <- function(env, lp, nnz, ia, ja, ra) {

    status <- .Call("chgCoefList", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(nnz),
                    as.integer(ia),
                    as.integer(ja),
                    as.numeric(ra)
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgCoefCPLEX <- function(env, lp, i, j, val) {

    status <- .Call("chgCoef", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(i),
                    as.integer(j),
                    as.numeric(val)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getCoefCPLEX <- function(env, lp, i, j) {

    co <- .Call("getCoef", PACKAGE = "cplexAPI",
                 env,
                 lp,
                 as.integer(i),
                 as.integer(j)
              )

    return(co)
}


#------------------------------------------------------------------------------#

getNumNnzCPLEX <- function(env, lp) {

    nnz <- .Call("getNumNnz", PACKAGE = "cplexAPI",
                 env,
                 lp
           )

    return(nnz)
}


#------------------------------------------------------------------------------#

chgBndsCPLEX <- function(env, lp, ncols, ind, lu, bd) {

    status <- .Call("chgBnds", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(ncols),
                    as.integer(ind),
                    as.character(paste(lu, collapse = "")),
                    as.numeric(bd)
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgColsBndsCPLEX <- function(env, lp, j, lb, ub) {

    status <- .Call("chgColsBnds", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(j),
                    as.numeric(lb),
                    as.numeric(ub)
              )

    return(status)
}


#------------------------------------------------------------------------------#

tightenBndsCPLEX <- function(env, lp, ncols, ind, lu, bd) {

    status <- .Call("tightenBnds", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(ncols),
                    as.integer(ind),
                    as.character(paste(lu, collapse = "")),
                    as.numeric(bd)
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgColTypeCPLEX <- function(env, lp, ncols, ind, xctype) {

    status <- .Call("chgColType", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(ncols),
                    as.integer(ind),
                    as.character(paste(xctype, collapse = ""))
              )

    return(status)
}


#------------------------------------------------------------------------------#

getColTypeCPLEX <- function(env, lp, begin, end) {

    ctype <- .Call("getColType", PACKAGE = "cplexAPI",
                   env,
                   lp,
                   as.integer(begin),
                   as.integer(end)
              )

    if ((is(ctype, "cpxerr")) || (is.null(ctype))) {
        out <- ctype
    }
    else {
        out <- unlist(strsplit(ctype, NULL))
    }

    return(out)
}


#------------------------------------------------------------------------------#

copyColTypeCPLEX <- function(env, lp, xctype) {

    status <- .Call("copyColType", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.character(paste(xctype, collapse = ""))
              )

    return(status)
}


#------------------------------------------------------------------------------#

getLowerBndsCPLEX <- function(env, lp, begin, end) {

    lb <- .Call("getLowerBnds", PACKAGE = "cplexAPI",
                env,
                lp,
                as.integer(begin),
                as.integer(end)
          )

    return(lb)
}


#------------------------------------------------------------------------------#

getUpperBndsCPLEX <- function(env, lp, begin, end) {

    ub <- .Call("getUpperBnds", PACKAGE = "cplexAPI",
                env,
                lp,
                as.integer(begin),
                as.integer(end)
          )

    return(ub)
}


#------------------------------------------------------------------------------#

getLowBndsIdsCPLEX <- function(env, lp, ind) {

    ncols <- length(ind)

    lb <- .Call("getLowBndsIds", PACKAGE = "cplexAPI",
                env,
                lp,
                as.integer(ind),
                as.integer(ncols)
          )

    return(lb)
}


#------------------------------------------------------------------------------#

getUppBndsIdsCPLEX <- function(env, lp, ind) {

    ncols <- length(ind)

    ub <- .Call("getUppBndsIds", PACKAGE = "cplexAPI",
                env,
                lp,
                as.integer(ind),
                as.integer(ncols)
          )

    return(ub)
}


#------------------------------------------------------------------------------#

chgRhsCPLEX <- function(env, lp, nrows, ind, val) {

    status <- .Call("chgRhs", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(nrows),
                    as.integer(ind),
                    as.numeric(val)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getRhsCPLEX <- function(env, lp, begin, end) {

    status <- .Call("getRhs", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(begin),
                    as.integer(end)
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgSenseCPLEX <- function(env, lp, nrows, ind, sense) {

    status <- .Call("chgSense", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(nrows),
                    as.integer(ind),
                    as.character(paste(sense, collapse = ""))
              )

    return(status)
}


#------------------------------------------------------------------------------#

getSenseCPLEX <- function(env, lp, begin, end) {

    sense <- .Call("getSense", PACKAGE = "cplexAPI",
                   env,
                   lp,
                   as.integer(begin),
                   as.integer(end)
              )

    if ((is(sense, "cpxerr")) || (is.null(sense))) {
        out <- sense
    }
    else {
        out <- unlist(strsplit(sense, NULL))
    }

    return(out)
}


#------------------------------------------------------------------------------#

delNamesCPLEX <- function(env, lp) {

    status <- .Call("delNames", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgProbNameCPLEX <- function(env, lp, probname) {

    status <- .Call("chgProbName", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.character(probname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getProbNameCPLEX <- function(env, lp) {

    probname <- .Call("getProbName", PACKAGE = "cplexAPI",
                      env,
                      lp
                )

    return(probname)
}


#------------------------------------------------------------------------------#

chgNameCPLEX <- function(env, lp, key, ij, name) {

    status <- .Call("chgName", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.character(key),
                    as.integer(ij),
                    as.character(name)
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgRowNameCPLEX <- function(env, lp, nnames, ind, names) {

    status <- .Call("chgRowName", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(nnames),
                    as.integer(ind),
                    as.character(names)
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgColNameCPLEX <- function(env, lp, nnames, ind, names) {

    status <- .Call("chgColName", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(nnames),
                    as.integer(ind),
                    as.character(names)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getRowNameCPLEX <- function(env, lp, begin, end) {

    rname <- .Call("getRowName", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(begin),
                    as.integer(end)
             )

    return(rname)
}


#------------------------------------------------------------------------------#

getColNameCPLEX <- function(env, lp, begin, end) {

    cname <- .Call("getColName", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(begin),
                    as.integer(end)
             )

    return(cname)
}


#------------------------------------------------------------------------------#

getColIndexCPLEX <- function(env, lp, cname) {

    cindex <- .Call("getColIndex", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.character(cname)
             )

    return(cindex)
}


#------------------------------------------------------------------------------#

getRowIndexCPLEX <- function(env, lp, rname) {

    rindex <- .Call("getRowIndex", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.character(rname)
             )

    return(rindex)
}


#------------------------------------------------------------------------------#

chgRngValCPLEX <- function(env, lp, nrows, ind, val) {

    status <- .Call("chgRngVal", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(nrows),
                    as.integer(ind),
                    as.numeric(val)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getRngValCPLEX <- function(env, lp, begin, end) {

    rngval <- .Call("getRngVal", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(begin),
                    as.integer(end)
              )

    return(rngval)
}


#------------------------------------------------------------------------------#

getRowsCPLEX <- function(env, lp, begin, end) {

    rows <- .Call("getRows", PACKAGE = "cplexAPI",
                   env,
                   lp,
                   as.integer(begin),
                   as.integer(end)
            )

    return(rows)
}


#------------------------------------------------------------------------------#

getColsCPLEX <- function(env, lp, begin, end) {

    cols <- .Call("getCols", PACKAGE = "cplexAPI",
                   env,
                   lp,
                   as.integer(begin),
                   as.integer(end)
            )

    return(cols)
}


#------------------------------------------------------------------------------#

completelpCPLEX <- function(env, lp) {

    status <- .Call("completelp", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(status)
}


#------------------------------------------------------------------------------#

cleanupCoefCPLEX <- function(env, lp, eps) {

    status <- .Call("cleanupCoef", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.numeric(eps)
              )

    return(status)
}


#------------------------------------------------------------------------------#

copyStartCPLEX <- function(env, lp,
                           cstat = NULL, rstat = NULL,
                           cprim = NULL, rprim = NULL,
                           cdual = NULL, rdual = NULL) {

    if (is.null(cstat)) {
        Ccstat <- as.null(cstat)
    }
    else {
        Ccstat <- as.integer(cstat)
    }

    if (is.null(rstat)) {
        Crstat <- as.null(rstat)
    }
    else {
        Crstat <- as.integer(rstat)
    }

    if (is.null(cprim)) {
        Ccprim <- as.null(cprim)
    }
    else {
        Ccprim <- as.numeric(cprim)
    }

    if (is.null(rprim)) {
        Crprim <- as.null(rprim)
    }
    else {
        Crprim <- as.numeric(rprim)
    }

    if (is.null(cdual)) {
        Ccdual <- as.null(cdual)
    }
    else {
        Ccdual <- as.numeric(cdual)
    }

    if (is.null(rdual)) {
        Crdual <- as.null(rdual)
    }
    else {
        Crdual <- as.numeric(rdual)
    }

    status <- .Call("copyStart", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    Ccstat, Crstat,
                    Ccprim, Crprim,
                    Ccdual, Crdual
              )

    return(status)
}


#------------------------------------------------------------------------------#

copyBaseCPLEX <- function(env, lp, cstat, rstat) {

    status <- .Call("copyBase", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(cstat),
                    as.integer(rstat)
              )

    return(status)
}


#------------------------------------------------------------------------------#

copyPartBaseCPLEX <- function(env, lp, ncind, cind, cstat,
                                       nrind, rind, rstat) {

    status <- .Call("copyPartBase", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(ncind),
                    as.integer(cind),
                    as.integer(cstat),
                    as.integer(nrind),
                    as.integer(rind),
                    as.integer(rstat)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getBaseCPLEX <- function(env, lp) {

    base <- .Call("getBase", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(base)
}


#------------------------------------------------------------------------------#

baseWriteCPLEX <- function(env, lp, fname) {

    status <- .Call("baseWrite", PACKAGE = "cplexAPI",
                  env,
                  lp,
                  as.character(fname)
            )

    return(status)
}


#------------------------------------------------------------------------------#

readCopyBaseCPLEX <- function(env, lp, fname) {

    status <- .Call("readCopyBase", PACKAGE = "cplexAPI",
                  env,
                  lp,
                  as.character(fname)
            )

    return(status)
}


#------------------------------------------------------------------------------#

lpoptCPLEX <- function(env, lp) {

    status <- .Call("lpopt", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(status)
}


#------------------------------------------------------------------------------#

primoptCPLEX <- function(env, lp) {

    status <- .Call("primopt", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(status)
}


#------------------------------------------------------------------------------#

dualoptCPLEX <- function(env, lp) {

    status <- .Call("dualopt", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(status)
}


#------------------------------------------------------------------------------#

baroptCPLEX <- function(env, lp) {

    status <- .Call("baropt", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(status)
}


#------------------------------------------------------------------------------#

hybbaroptCPLEX <- function(env, lp, method) {

    status <- .Call("hybbaropt", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(method)
              )

    return(status)
}


#------------------------------------------------------------------------------#

hybnetoptCPLEX <- function(env, lp, method) {

    status <- .Call("hybnetopt", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(method)
              )

    return(status)
}


#------------------------------------------------------------------------------#

siftoptCPLEX <- function(env, lp) {

    status <- .Call("siftopt", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(status)
}


#------------------------------------------------------------------------------#

mipoptCPLEX <- function(env, lp) {

    status <- .Call("mipopt", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(status)
}


#------------------------------------------------------------------------------#

getCutoffCPLEX <- function(env, lp) {

    coff <- .Call("getCutoff", PACKAGE = "cplexAPI",
                   env,
                   lp
            )

    return(coff)
}


#------------------------------------------------------------------------------#

getGradCPLEX <- function(env, lp, j) {

    grad <- .Call("getGrad", PACKAGE = "cplexAPI",
                   env,
                   lp,
                   as.integer(j)
            )

    return(grad)
}


#------------------------------------------------------------------------------#

getItCntCPLEX <- function(env, lp) {

    itcnt <- .Call("getItCnt", PACKAGE = "cplexAPI",
                   env,
                   lp
             )

    return(itcnt)
}


#------------------------------------------------------------------------------#

getPhase1CntCPLEX <- function(env, lp) {

    pcnt <- .Call("getPhase1Cnt", PACKAGE = "cplexAPI",
                  env,
                  lp
            )

    return(pcnt)
}



#------------------------------------------------------------------------------#

getSiftItCntCPLEX <- function(env, lp) {

    scnt <- .Call("getSiftItCnt", PACKAGE = "cplexAPI",
                  env,
                  lp
            )

    return(scnt)
}


#------------------------------------------------------------------------------#

getSiftPase1CntCPLEX <- function(env, lp) {

    spcnt <- .Call("getSiftPase1Cnt", PACKAGE = "cplexAPI",
                   env,
                   lp
             )

    return(spcnt)
}


#------------------------------------------------------------------------------#

getDbsCntCPLEX <- function(env, lp) {

    dcnt <- .Call("getDbsCnt", PACKAGE = "cplexAPI",
                  env,
                  lp
            )

    return(dcnt)
}


#------------------------------------------------------------------------------#

# feasOptCPLEX <- function(env, lp,
#                          rhs = NULL, rng = NULL, lb = NULL, ub = NULL) {
#
#     if (is.null(rhs)) {
#         Crhs <- as.null(rhs)
#     }
#     else {
#         Crhs <- as.numeric(rhs)
#     }
#
#     if (is.null(rng)) {
#         Crng <- as.null(rng)
#     }
#     else {
#         Crng <- as.numeric(rng)
#     }
#
#     if (is.null(lb)) {
#         Clb <- as.null(lb)
#     }
#     else {
#         Clb <- as.numeric(lb)
#     }
#
#     if (is.null(ub)) {
#         Cub <- as.null(ub)
#     }
#     else {
#         Cub <- as.numeric(ub)
#     }
#
#     status <- .Call("feasOpt", PACKAGE = "cplexAPI",
#                        env, lp,
#                        Crhs, Crng, Clb, Cub
#                  )
#
#     return(status)
# }

feasOptCPLEX <- function(env, lp,
                         rhs = FALSE, rng = FALSE, lb = FALSE, ub = FALSE) {

    status <- .Call("feasOpt", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.logical(rhs),
                    as.logical(rng),
                    as.logical(lb),
                    as.logical(ub)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getColInfeasCPLEX <- function(env, lp, begin, end, sol = NULL) {

    if (is.null(sol)) {
        Csol <- as.null(sol)
    }
    else {
        Csol <- as.numeric(sol)
    }

    colinfeas <- .Call("getColInfeas", PACKAGE = "cplexAPI",
                       env,
                       lp,
                       Csol,
                       as.integer(begin),
                       as.integer(end)
                 )

    return(colinfeas)
}


#------------------------------------------------------------------------------#

getRowInfeasCPLEX <- function(env, lp, begin, end, sol = NULL) {

    if (is.null(sol)) {
        Csol <- as.null(sol)
    }
    else {
        Csol <- as.numeric(sol)
    }

    rowinfeas <- .Call("getRowInfeas", PACKAGE = "cplexAPI",
                       env,
                       lp,
                       Csol,
                       as.integer(begin),
                       as.integer(end)
                 )

    return(rowinfeas)
}


#------------------------------------------------------------------------------#

refineConflictCPLEX <- function(env, lp) {

    rcconf <- .Call("refineConflict", PACKAGE = "cplexAPI",
                     env,
                     lp
              )

    return(rcconf)
}


#------------------------------------------------------------------------------#

getConflictCPLEX <- function(env, lp) {

    confl <- .Call("getConflict", PACKAGE = "cplexAPI",
                    env,
                    lp
             )

#     if ( (is(confl, "cpxerr")) || (is.null(confl)) ) {
#         trimconfl <- confl
#     }
#     else {
#         trimconfl <- list(confstat  = confl$confstat,
#                           rowind    = confl$rowind[1:confl$confnumrows],
#                           rowbdstat = confl$rowbdstat[1:confl$confnumrows],
#                           colind    = confl$colind[1:confl$confnumcols],
#                           colbdstat = confl$colbdstat[1:confl$confnumcols])
#     }
#
#     return(trimconfl)

    return(confl)
}


#------------------------------------------------------------------------------#

cLpWriteCPLEX <- function(env, lp, fname) {

    status <- .Call("cLpWrite", PACKAGE = "cplexAPI",
                  env,
                  lp,
                  as.character(fname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

freePresolveCPLEX <- function(env, lp) {

    status <- .Call("freePresolve", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(status)
}


#------------------------------------------------------------------------------#

getMethodCPLEX <- function(env, lp) {

    method <- .Call("getMethod", PACKAGE = "cplexAPI",
                    env,
                    lp
              )

    return(method)
}


#------------------------------------------------------------------------------#

getSubMethodCPLEX <- function(env, lp) {

    submethod <- .Call("getSubMethod", PACKAGE = "cplexAPI",
                        env,
                        lp
              )

    return(submethod)
}


#------------------------------------------------------------------------------#

getDblQualCPLEX <- function(env, lp, w) {

    dqual <- .Call("getDblQual", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(w)
             )

    return(dqual)
}


#------------------------------------------------------------------------------#

getIntQualCPLEX <- function(env, lp, w) {

    iqual <- .Call("getIntQual", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(w)
              )

    return(iqual)
}


#------------------------------------------------------------------------------#

solnInfoCPLEX <- function(env, lp) {

    solinf <- .Call("solnInfo", PACKAGE = "cplexAPI",
                     env,
                     lp
              )

    return(solinf)
}


#------------------------------------------------------------------------------#

solutionCPLEX <- function(env, lp) {

    sol <- .Call("solution", PACKAGE = "cplexAPI",
                  env,
                  lp
            )

    return(sol)
}


#------------------------------------------------------------------------------#

solWriteCPLEX <- function(env, lp, fname) {

    status <- .Call("solWrite", PACKAGE = "cplexAPI",
                  env,
                  lp,
                  as.character(fname)
            )

    return(status)
}


#------------------------------------------------------------------------------#

readCopySolCPLEX <- function(env, lp, fname) {

    status <- .Call("readCopySol", PACKAGE = "cplexAPI",
                  env,
                  lp,
                  as.character(fname)
            )

    return(status)
}


#------------------------------------------------------------------------------#

getStatCPLEX <- function(env, lp) {

    stat <- .Call("getStat", PACKAGE = "cplexAPI",
                  env,
                  lp
            )

    return(stat)
}


#------------------------------------------------------------------------------#

getSubStatCPLEX <- function(env, lp) {

    substat <- .Call("getSubStat", PACKAGE = "cplexAPI",
                      env,
                      lp
            )

    return(substat)
}


#------------------------------------------------------------------------------#

getObjValCPLEX <- function(env, lp) {

    obj <- .Call("getObjVal", PACKAGE = "cplexAPI",
                  env,
                  lp
            )

    return(obj)
}


#------------------------------------------------------------------------------#

getProbVarCPLEX <- function(env, lp, begin, end) {

    xval <- .Call("getProbVar", PACKAGE = "cplexAPI",
                  env,
                  lp,
                  as.integer(begin),
                  as.integer(end)
            )

    return(xval)
}


#------------------------------------------------------------------------------#

getSlackCPLEX <- function(env, lp, begin, end) {

    slack <- .Call("getSlack", PACKAGE = "cplexAPI",
                   env,
                   lp,
                   as.integer(begin),
                   as.integer(end)
             )

    return(slack)
}


#------------------------------------------------------------------------------#

getPiCPLEX <- function(env, lp, begin, end) {

    pi <- .Call("getPi", PACKAGE = "cplexAPI",
                env,
                lp,
                as.integer(begin),
                as.integer(end)
          )

    return(pi)
}


#------------------------------------------------------------------------------#

getDjCPLEX <- function(env, lp, begin, end) {

    dj <- .Call("getDj", PACKAGE = "cplexAPI",
                env,
                lp,
                as.integer(begin),
                as.integer(end)
          )

    return(dj)
}


#------------------------------------------------------------------------------#

boundSaCPLEX <- function(env, lp, begin, end) {

    bndsa <- .Call("boundSa", PACKAGE = "cplexAPI",
                   env,
                   lp,
                   as.integer(begin),
                   as.integer(end)
             )

    return(bndsa)
}


#------------------------------------------------------------------------------#

objSaCPLEX <- function(env, lp, begin, end) {

    osa <- .Call("objSa", PACKAGE = "cplexAPI",
                 env,
                 lp,
                 as.integer(begin),
                 as.integer(end)
           )

    return(osa)
}


#------------------------------------------------------------------------------#

rhsSaCPLEX <- function(env, lp, begin, end) {

    rsa <- .Call("rhsSa", PACKAGE = "cplexAPI",
                 env,
                 lp,
                 as.integer(begin),
                 as.integer(end)
           )

    return(rsa)
}


#------------------------------------------------------------------------------#

openFileCPLEX <- function(fname, ftype = "w") {

    cpfile <- .Call("cplexfopen", PACKAGE = "cplexAPI",
                    as.character(fname),
                    as.character(ftype)
              )

    return(cpfile)
}


#------------------------------------------------------------------------------#

closeFileCPLEX <- function(cpfile) {

    status <- .Call("cplexfclose", PACKAGE = "cplexAPI",
                    cpfile
              )

    return(status)
}


#------------------------------------------------------------------------------#

fileputCPLEX <- function(cpfile, stuff = "") {

    status <- .Call("fileput", PACKAGE = "cplexAPI",
                    cpfile,
                    as.character(stuff)
              )

    return(status)
}


#------------------------------------------------------------------------------#

setLogFileCPLEX <- function(env, cpfile = NULL) {

    if (is.null(cpfile)) {
        Ccpfile <- as.null(cpfile)
    }
    else {
        Ccpfile <- cpfile
    }

    status <- .Call("setLogFile", PACKAGE = "cplexAPI",
                    env,
                    Ccpfile
              )

    return(status)
}


#------------------------------------------------------------------------------#

getLogFileCPLEX <- function(env) {

    return(.Call("getLogFile", PACKAGE = "cplexAPI", env))

}


#------------------------------------------------------------------------------#

getChannelsCPLEX <- function(env) {

    channels <- .Call("getChannels", PACKAGE = "cplexAPI",
                      env
                )

    return(channels)
}


#------------------------------------------------------------------------------#

flushStdChannelsCPLEX <- function(env) {

    status <- .Call("flushStdChannels", PACKAGE = "cplexAPI",
                    env
              )

    return(status)
}


#------------------------------------------------------------------------------#

addChannelCPLEX <- function(env) {

    newch <- .Call("addChannel", PACKAGE = "cplexAPI",
                   env
              )

    return(newch)
}


#------------------------------------------------------------------------------#

delChannelCPLEX <- function(env, newch) {

    invisible(
        .Call("delChannel", PACKAGE = "cplexAPI",
              env,
              newch
        )
    )

}


#------------------------------------------------------------------------------#

disconnectChannelCPLEX <- function(env, newch) {

    invisible(
        .Call("disconnectChannel", PACKAGE = "cplexAPI",
              env,
              newch
        )
    )

}


#------------------------------------------------------------------------------#

flushChannelCPLEX <- function(env, newch) {

    invisible(
        .Call("flushChannel", PACKAGE = "cplexAPI",
              env,
              newch
        )
    )

}


#------------------------------------------------------------------------------#

addFpDestCPLEX <- function(env, newch, cpfile) {

    status <- .Call("addFpDest", PACKAGE = "cplexAPI",
                      env,
                      newch,
                      cpfile
              )

    return(status)
}


#------------------------------------------------------------------------------#

delFpDestCPLEX <- function(env, newch, cpfile) {

    status <- .Call("delFpDest", PACKAGE = "cplexAPI",
                      env,
                      newch,
                      cpfile
              )

    return(status)
}


#------------------------------------------------------------------------------#

getTimeCPLEX <- function(env) {

    timest <- .Call("getTime", PACKAGE = "cplexAPI",
                     env
              )

    return(timest)
}


#------------------------------------------------------------------------------#

tuneParmCPLEX <- function(env, lp,
                          nIntP = 0, intP = NULL, intPv = NULL,
                          nDblP = 0, dblP = NULL, dblPv = NULL,
                          nStrP = 0, strP = NULL, strPv = NULL) {

    if (is.null(intP)) {
        CintP <- as.null(intP)
    }
    else {
        CintP <- as.integer(intP)
    }

    if (is.null(intPv)) {
        CintPv <- as.null(intPv)
    }
    else {
        CintPv <- as.integer(intPv)
    }

    if (is.null(dblP)) {
        CdblP <- as.null(dblP)
    }
    else {
        CdblP <- as.integer(dblP)
    }

    if (is.null(dblPv)) {
        CdblPv <- as.null(dblPv)
    }
    else {
        CdblPv <- as.numeric(dblPv)
    }

    if (is.null(strP)) {
        CstrP <- as.null(strP)
    }
    else {
        CstrP <- as.integer(strP)
    }

    if (is.null(strPv)) {
        CstrPv <- as.null(strPv)
    }
    else {
        CstrPv <- as.character(strPv)
    }

    tstat <- .Call("tuneParam", PACKAGE = "cplexAPI",
                    env,
                    lp,
                    as.integer(nIntP),
                    CintP, CintPv,
                    as.integer(nDblP),
                    CdblP, CdblPv,
                    as.integer(nStrP),
                    CstrP, CstrPv
              )

    return(tstat)
}


#------------------------------------------------------------------------------#

setTerminateCPLEX <- function(env) {

    return(.Call("setTerminate", env, PACKAGE = "cplexAPI"))

}


#------------------------------------------------------------------------------#

delTerminateCPLEX <- function(env, tsig) {

    status <- .Call("delTerminate", PACKAGE = "cplexAPI",
                  env, tsig
              )

    return(status)

}


#------------------------------------------------------------------------------#

chgTerminateCPLEX <- function(env, tval = 1) {
    invisible(
        .Call("chgTerminate", PACKAGE = "cplexAPI",
               env,
               as.integer(tval)
        )
    )
}


#------------------------------------------------------------------------------#

printTerminateCPLEX <- function(env) {

    invisible(.Call("printTerminate", env, PACKAGE = "cplexAPI"))

}

