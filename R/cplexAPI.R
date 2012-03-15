#------------------------------------------------------------------------------#
#                     R Interface to C API of IBM ILOG CPLEX                   #
#------------------------------------------------------------------------------#

#  cplexAPI.R
#  R Interface to C API of IBM ILOG CPLEX Version 12.1, 12.2, 12.3, 12.4.
#
#  Copyright (C) 2011-2012 Gabriel Gelius-Dietrich, Dpt. for Bioinformatics,
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
        Cenv <- ptr(env)
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
                    ptr(env),
                    as.integer(stat)
              )

    return(statmsg)
}


#------------------------------------------------------------------------------#

closeEnvCPLEX <- function(env) {

    status <- .Call("closeEnv", PACKAGE = "cplexAPI",
                    ptr(env)
              )

    return(cplexError(status))
}


#------------------------------------------------------------------------------#

openEnvCPLEX <- function(ptrtype = "cplex_env") {

    env <- .Call("openEnv", PACKAGE = "cplexAPI",
                 as.character(ptrtype)
           )

    envP <- cplex_EnvPointer(env)

    return(cplexError(envP))
}


#------------------------------------------------------------------------------#

delProbCPLEX <- function(env, lp) {

    status <- .Call("delProb", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(cplexError(status))
}


#------------------------------------------------------------------------------#

initProbCPLEX <- function(env, pname = "CPLEX_PROB", ptrtype = "cplex_prob") {

    prob <- .Call("initProb", PACKAGE = "cplexAPI",
                  ptr(env),
                  as.character(pname),
                  as.character(ptrtype)
            )

    probP <- cplex_ProbPointer(prob)
    
    return(cplexError(probP))
}


#------------------------------------------------------------------------------#

cloneProbCPLEX <- function(env, lp, ptrtype = "cplex_prob") {

    clp <- .Call("cloneProb", PACKAGE = "cplexAPI",
                 ptr(env),
                 ptr(lp),
                 as.character(ptrtype)
           )

    clpP <- cplex_ProbPointer(clp)
    
    return(cplexError(clpP))
}


#------------------------------------------------------------------------------#

getProbTypeCPLEX <- function(env, lp) {

    ptype <- .Call("getProbType", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp)
             )

    return(ptype)
}


#------------------------------------------------------------------------------#

chgProbTypeCPLEX <- function(env, lp, ptype) {

    status <- .Call("chgProbType", PACKAGE = "cplexAPI",
                     ptr(env),
                     ptr(lp),
                     as.integer(ptype)
             )

    return(status)
}


#------------------------------------------------------------------------------#

getVersionCPLEX <- function(env) {

    version <- .Call("getVersion", PACKAGE = "cplexAPI",
                     ptr(env)
               )

    return(version)

}


#------------------------------------------------------------------------------#

closeProbCPLEX <- function(prob) {

    status    <- integer(2)
    status[1] <- delProbCPLEX(prob[["env"]], prob[["lp"]])
    status[2] <- closeEnvCPLEX(prob[["env"]])
    return(status)

}


#------------------------------------------------------------------------------#

openProbCPLEX <- function(pname = "CPLEX_PROB",
                          ptrtypeENV = "cplex_env",
                          ptrtypePROB = "cplex_prob") {

    en <- openEnvCPLEX(ptrtype = ptrtypeENV)
    if (!is(en, "cpxerr")) {
        pr <- initProbCPLEX(env = en,
                            pname = pname,
                            ptrtype = ptrtypePROB)
    }
    else {
        pr <- NULL
    }

    return(list(env = en, lp = pr))
}


#------------------------------------------------------------------------------#

setDefaultParmCPLEX <- function(env) {

    status <- .Call("setDefaultParm", PACKAGE = "cplexAPI",
                    ptr(env)
              )

    return(status)
}


#------------------------------------------------------------------------------#

setIntParmCPLEX <- function(env, parm, value) {

    status <- .Call("setIntParm", PACKAGE = "cplexAPI",
                    ptr(env),
                    as.integer(parm),
                    as.integer(value)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getIntParmCPLEX <- function(env, parm) {

    value <- .Call("getIntParm", PACKAGE = "cplexAPI",
                   ptr(env),
                   as.integer(parm)
             )

    return(cplexError(value))
}


#------------------------------------------------------------------------------#

getInfoIntParmCPLEX <- function(env, parm) {

    param <- .Call("getInfoIntParm", PACKAGE = "cplexAPI",
                   ptr(env),
                   as.integer(parm)
             )

    return(cplexError(param))
}

#------------------------------------------------------------------------------#

setDblParmCPLEX <- function(env, parm, value) {

    status <- .Call("setDblParm", PACKAGE = "cplexAPI",
                    ptr(env),
                    as.integer(parm),
                    as.numeric(value)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getDblParmCPLEX <- function(env, parm) {

    value <- .Call("getDblParm", PACKAGE = "cplexAPI",
                   ptr(env),
                   as.integer(parm)
             )

    return(cplexError(value))
}


#------------------------------------------------------------------------------#

getInfoDblParmCPLEX <- function(env, parm) {

    param <- .Call("getInfoDblParm", PACKAGE = "cplexAPI",
                   ptr(env),
                   as.integer(parm)
             )

    return(cplexError(param))
}


#------------------------------------------------------------------------------#

setStrParmCPLEX <- function(env, parm, value) {

    status <- .Call("setStrParm", PACKAGE = "cplexAPI",
                    ptr(env),
                    as.integer(parm),
                    as.character(value)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getStrParmCPLEX <- function(env, parm) {

    value <- .Call("getStrParm", PACKAGE = "cplexAPI",
                   ptr(env),
                   as.integer(parm)
             )

    return(value)
}


#------------------------------------------------------------------------------#

getInfoStrParmCPLEX <- function(env, parm) {

    param <- .Call("getInfoStrParm", PACKAGE = "cplexAPI",
                   ptr(env),
                   as.integer(parm)
             )

    return(param)
}


#------------------------------------------------------------------------------#

getParmNameCPLEX <- function(env, wparm) {

    nparm <- .Call("getParmName", PACKAGE = "cplexAPI",
                   ptr(env),
                   as.integer(wparm)
             )

    return(nparm)
}


#------------------------------------------------------------------------------#

getParmNumCPLEX <- function(env, nparm) {

    numparm <- .Call("getParmNum", PACKAGE = "cplexAPI",
                     ptr(env),
                     as.character(nparm)
               )

    return(numparm)
}


#------------------------------------------------------------------------------#

readCopyParmCPLEX <- function(env, fname) {

    status <- .Call("readCopyParm", PACKAGE = "cplexAPI",
                    ptr(env),
                    as.character(fname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

writeParmCPLEX <- function(env, fname) {

    status <- .Call("writeParm", PACKAGE = "cplexAPI",
                    ptr(env),
                    as.character(fname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getParmTypeCPLEX <- function(env, parm) {

    status <- .Call("getParmType", PACKAGE = "cplexAPI",
                    ptr(env),
                    as.integer(parm)
              )

    return(cplexError(status))
}


#------------------------------------------------------------------------------#

getChgParmCPLEX <- function(env) {

    status <- .Call("getChgParm", PACKAGE = "cplexAPI",
                    ptr(env)
              )

    return(cplexError(status))
}


#------------------------------------------------------------------------------#

setObjDirCPLEX <- function(env, lp, lpdir) {

    invisible(
        .Call("setObjDir", PACKAGE = "cplexAPI",
              ptr(env),
              ptr(lp),
              as.integer(lpdir)
        )
    )

}


#------------------------------------------------------------------------------#

getObjDirCPLEX <- function(env, lp) {

    lpdir <- .Call("getObjDir", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp)
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
                    ptr(env),
                    ptr(lp),
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
                    ptr(env),
                    ptr(lp),
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

copyQuadCPLEX <- function(env, lp, qmatbeg, qmatcnt, qmatind, qmatval) {

    status <- .Call("copyQuad", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(qmatbeg),
                    as.integer(qmatcnt),
                    as.integer(qmatind),
                    as.numeric(qmatval)
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
                    ptr(env),
                    ptr(lp),
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
                    ptr(env),
                    ptr(lp),
                    as.character(fname),
                    Cftype
              )

    return(status)
}


#------------------------------------------------------------------------------#

dualWriteCPLEX <- function(env, lp, fname) {

    status <- .Call("dualWrite", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(fname)
              )

    return(cplexError(status))
}


#------------------------------------------------------------------------------#

presolveCPLEX <- function(env, lp, method) {

    preslv <- .Call("presolve", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(method)
               )

    return(preslv)
}


#------------------------------------------------------------------------------#

getPreStatCPLEX <- function(env, lp) {

    prestat <- .Call("getPreStat", PACKAGE = "cplexAPI",
                     ptr(env),
                     ptr(lp)
              )

    return(cplexError(prestat))
}


#------------------------------------------------------------------------------#

basicPresolveCPLEX <- function(env, lp) {

    bpres <- .Call("basicPresolve", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp)
              )

    return(cplexError(bpres))
}


#------------------------------------------------------------------------------#

preslvWriteCPLEX <- function(env, lp, fname) {

    off <- .Call("preslvWrite", PACKAGE = "cplexAPI",
                 ptr(env),
                 ptr(lp),
                 as.character(fname)
           )

    return(cplexError(off))
}


#------------------------------------------------------------------------------#

getRedLpCPLEX <- function(env, lp, ptrtype = "cplex_prob") {

    redlp <- .Call("getRedLp", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp),
                   as.character(ptrtype)
             )

    return(cplexError(redlp))
}


#------------------------------------------------------------------------------#

getObjOffsetCPLEX <- function(env, lp) {

    ooff <- .Call("getObjOffset", PACKAGE = "cplexAPI",
                  ptr(env),
                  ptr(lp)
            )

    return(cplexError(ooff))
}


#------------------------------------------------------------------------------#

unscaleProbCPLEX <- function(env, lp) {

    status <- .Call("unscaleProb", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
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
                    ptr(env),
                    ptr(lp),
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
                    ptr(env),
                    ptr(lp),
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
                   ptr(env),
                   ptr(lp)
             )

    return(nrows)
}


#------------------------------------------------------------------------------#

delRowsCPLEX <- function(env, lp, begin, end) {

    status <- .Call("delRows", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(begin),
                    as.integer(end)
              )

    return(status)
}


#------------------------------------------------------------------------------#

delSetRowsCPLEX <- function(env, lp, delstat) {

    indrows <- .Call("delSetRows", PACKAGE = "cplexAPI",
                     ptr(env),
                     ptr(lp),
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
                    ptr(env),
                    ptr(lp),
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
                    ptr(env),
                    ptr(lp),
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
                   ptr(env),
                   ptr(lp)
             )

    return(ncols)
}


#------------------------------------------------------------------------------#

delColsCPLEX <- function(env, lp, begin, end) {

    status <- .Call("delCols", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(begin),
                    as.integer(end)
              )

    return(status)
}


#------------------------------------------------------------------------------#

delSetColsCPLEX <- function(env, lp, delstat) {

    indcols <- .Call("delSetCols", PACKAGE = "cplexAPI",
                     ptr(env),
                     ptr(lp),
                     as.integer(delstat)
               )

    return(indcols)
}


#------------------------------------------------------------------------------#

chgObjCPLEX <- function(env, lp, ncols, ind, val) {

    status <- .Call("chgObj", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(ncols),
                    as.integer(ind),
                    as.numeric(val)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getObjCPLEX <- function(env, lp, begin, end) {

    obj_coef <- .Call("getObj", PACKAGE = "cplexAPI",
                      ptr(env),
                      ptr(lp),
                      as.integer(begin),
                      as.integer(end)
                )

    return(cplexError(obj_coef))
}


#------------------------------------------------------------------------------#

copyObjNameCPLEX <- function(env, lp, oname) {

    status <- .Call("copyObjName", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(oname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getObjNameCPLEX <- function(env, lp) {

    objname <- .Call("getObjName", PACKAGE = "cplexAPI",
                      ptr(env),
                      ptr(lp)
               )

    return(cplexError(objname))
}


#------------------------------------------------------------------------------#

chgCoefListCPLEX <- function(env, lp, nnz, ia, ja, ra) {

    status <- .Call("chgCoefList", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(nnz),
                    as.integer(ia),
                    as.integer(ja),
                    as.numeric(ra)
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgQPcoefCPLEX <- function(env, lp, i, j, val) {

    status <- .Call("chgQPcoef", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(i),
                    as.integer(j),
                    as.numeric(val)
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgCoefCPLEX <- function(env, lp, i, j, val) {

    status <- .Call("chgCoef", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(i),
                    as.integer(j),
                    as.numeric(val)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getCoefCPLEX <- function(env, lp, i, j) {

    co <- .Call("getCoef", PACKAGE = "cplexAPI",
                 ptr(env),
                 ptr(lp),
                 as.integer(i),
                 as.integer(j)
              )

    return(cplexError(co))
}


#------------------------------------------------------------------------------#

getNumNnzCPLEX <- function(env, lp) {

    nnz <- .Call("getNumNnz", PACKAGE = "cplexAPI",
                 ptr(env),
                 ptr(lp)
           )

    return(nnz)
}


#------------------------------------------------------------------------------#

chgBndsCPLEX <- function(env, lp, ncols, ind, lu, bd) {

    status <- .Call("chgBnds", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
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
                    ptr(env),
                    ptr(lp),
                    as.integer(j),
                    as.numeric(lb),
                    as.numeric(ub)
              )

    return(status)
}


#------------------------------------------------------------------------------#

tightenBndsCPLEX <- function(env, lp, ncols, ind, lu, bd) {

    status <- .Call("tightenBnds", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
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
                    ptr(env),
                    ptr(lp),
                    as.integer(ncols),
                    as.integer(ind),
                    as.character(paste(xctype, collapse = ""))
              )

    return(cplexError(status))
}


#------------------------------------------------------------------------------#

getColTypeCPLEX <- function(env, lp, begin, end) {

    ctype <- .Call("getColType", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp),
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
                    ptr(env),
                    ptr(lp),
                    as.character(paste(xctype, collapse = ""))
              )

    return(status)
}


#------------------------------------------------------------------------------#

getLowerBndsCPLEX <- function(env, lp, begin, end) {

    lb <- .Call("getLowerBnds", PACKAGE = "cplexAPI",
                ptr(env),
                ptr(lp),
                as.integer(begin),
                as.integer(end)
          )

    return(cplexError(lb))
}


#------------------------------------------------------------------------------#

getUpperBndsCPLEX <- function(env, lp, begin, end) {

    ub <- .Call("getUpperBnds", PACKAGE = "cplexAPI",
                ptr(env),
                ptr(lp),
                as.integer(begin),
                as.integer(end)
          )

    return(cplexError(ub))
}


#------------------------------------------------------------------------------#

getLowBndsIdsCPLEX <- function(env, lp, ind) {

    ncols <- length(ind)

    lb <- .Call("getLowBndsIds", PACKAGE = "cplexAPI",
                ptr(env),
                ptr(lp),
                as.integer(ind),
                as.integer(ncols)
          )

    return(cplexError(lb))
}


#------------------------------------------------------------------------------#

getUppBndsIdsCPLEX <- function(env, lp, ind) {

    ncols <- length(ind)

    ub <- .Call("getUppBndsIds", PACKAGE = "cplexAPI",
                ptr(env),
                ptr(lp),
                as.integer(ind),
                as.integer(ncols)
          )

    return(cplexError(ub))
}


#------------------------------------------------------------------------------#

chgRhsCPLEX <- function(env, lp, nrows, ind, val) {

    status <- .Call("chgRhs", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(nrows),
                    as.integer(ind),
                    as.numeric(val)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getRhsCPLEX <- function(env, lp, begin, end) {

    status <- .Call("getRhs", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(begin),
                    as.integer(end)
              )

    return(cplexError(status))
}


#------------------------------------------------------------------------------#

chgSenseCPLEX <- function(env, lp, nrows, ind, sense) {

    status <- .Call("chgSense", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(nrows),
                    as.integer(ind),
                    as.character(paste(sense, collapse = ""))
              )

    return(status)
}


#------------------------------------------------------------------------------#

getSenseCPLEX <- function(env, lp, begin, end) {

    sense <- .Call("getSense", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp),
                   as.integer(begin),
                   as.integer(end)
              )

    if ((is(sense, "cpxerr")) || (is.null(sense))) {
        out <- sense
    }
    else {
        out <- unlist(strsplit(sense, NULL))
    }

    return(cplexError(out))
}


#------------------------------------------------------------------------------#

delNamesCPLEX <- function(env, lp) {

    status <- .Call("delNames", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgProbNameCPLEX <- function(env, lp, probname) {

    status <- .Call("chgProbName", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(probname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getProbNameCPLEX <- function(env, lp) {

    probname <- .Call("getProbName", PACKAGE = "cplexAPI",
                      ptr(env),
                      ptr(lp)
                )

    return(cplexError(probname))
}


#------------------------------------------------------------------------------#

chgNameCPLEX <- function(env, lp, key, ij, name) {

    status <- .Call("chgName", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(key),
                    as.integer(ij),
                    as.character(name)
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgRowNameCPLEX <- function(env, lp, nnames, ind, names) {

    status <- .Call("chgRowName", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(nnames),
                    as.integer(ind),
                    as.character(names)
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgColNameCPLEX <- function(env, lp, nnames, ind, names) {

    status <- .Call("chgColName", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(nnames),
                    as.integer(ind),
                    as.character(names)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getRowNameCPLEX <- function(env, lp, begin, end) {

    rname <- .Call("getRowName", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(begin),
                    as.integer(end)
             )

    return(cplexError(rname))
}


#------------------------------------------------------------------------------#

getColNameCPLEX <- function(env, lp, begin, end) {

    cname <- .Call("getColName", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(begin),
                    as.integer(end)
             )

    return(cplexError(cname))
}


#------------------------------------------------------------------------------#

getColIndexCPLEX <- function(env, lp, cname) {

    cindex <- .Call("getColIndex", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(cname)
             )

    return(cplexError(cindex))
}


#------------------------------------------------------------------------------#

getRowIndexCPLEX <- function(env, lp, rname) {

    rindex <- .Call("getRowIndex", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(rname)
             )

    return(cplexError(rindex))
}


#------------------------------------------------------------------------------#

chgRngValCPLEX <- function(env, lp, nrows, ind, val) {

    status <- .Call("chgRngVal", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(nrows),
                    as.integer(ind),
                    as.numeric(val)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getRngValCPLEX <- function(env, lp, begin, end) {

    rngval <- .Call("getRngVal", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(begin),
                    as.integer(end)
              )

    return(cplexError(rngval))
}


#------------------------------------------------------------------------------#

getRowsCPLEX <- function(env, lp, begin, end) {

    rows <- .Call("getRows", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp),
                   as.integer(begin),
                   as.integer(end)
            )

    return(cplexError(rows))
}


#------------------------------------------------------------------------------#

getColsCPLEX <- function(env, lp, begin, end) {

    cols <- .Call("getCols", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp),
                   as.integer(begin),
                   as.integer(end)
            )

    return(cplexError(cols))
}


#------------------------------------------------------------------------------#

completelpCPLEX <- function(env, lp) {

    status <- .Call("completelp", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(status)
}


#------------------------------------------------------------------------------#

cleanupCoefCPLEX <- function(env, lp, eps) {

    status <- .Call("cleanupCoef", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
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
                    ptr(env),
                    ptr(lp),
                    Ccstat, Crstat,
                    Ccprim, Crprim,
                    Ccdual, Crdual
              )

    return(status)
}


#------------------------------------------------------------------------------#

copyBaseCPLEX <- function(env, lp, cstat, rstat) {

    status <- .Call("copyBase", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(cstat),
                    as.integer(rstat)
              )

    return(status)
}


#------------------------------------------------------------------------------#

copyPartBaseCPLEX <- function(env, lp, ncind, cind, cstat,
                                       nrind, rind, rstat) {

    status <- .Call("copyPartBase", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
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
                  ptr(env),
                  ptr(lp)
              )

    return(cplexError(base))
}


#------------------------------------------------------------------------------#

baseWriteCPLEX <- function(env, lp, fname) {

    status <- .Call("baseWrite", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(fname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

readCopyBaseCPLEX <- function(env, lp, fname) {

    status <- .Call("readCopyBase", PACKAGE = "cplexAPI",
                  ptr(env),
                  ptr(lp),
                  as.character(fname)
            )

    return(status)
}


#------------------------------------------------------------------------------#

lpoptCPLEX <- function(env, lp) {

    status <- .Call("lpopt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(status)
}


#------------------------------------------------------------------------------#

primoptCPLEX <- function(env, lp) {

    status <- .Call("primopt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(status)
}


#------------------------------------------------------------------------------#

dualoptCPLEX <- function(env, lp) {

    status <- .Call("dualopt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(status)
}


#------------------------------------------------------------------------------#

baroptCPLEX <- function(env, lp) {

    status <- .Call("baropt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(status)
}


#------------------------------------------------------------------------------#

hybbaroptCPLEX <- function(env, lp, method) {

    status <- .Call("hybbaropt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(method)
              )

    return(status)
}


#------------------------------------------------------------------------------#

hybnetoptCPLEX <- function(env, lp, method) {

    status <- .Call("hybnetopt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(method)
              )

    return(status)
}


#------------------------------------------------------------------------------#

siftoptCPLEX <- function(env, lp) {

    status <- .Call("siftopt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(status)
}


#------------------------------------------------------------------------------#

mipoptCPLEX <- function(env, lp) {

    status <- .Call("mipopt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(status)
}


#------------------------------------------------------------------------------#

qpoptCPLEX <- function(env, lp) {

    status <- .Call("qpopt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getCutoffCPLEX <- function(env, lp) {

    coff <- .Call("getCutoff", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp)
            )

    return(cplexError(coff))
}


#------------------------------------------------------------------------------#

getGradCPLEX <- function(env, lp, j) {

    grad <- .Call("getGrad", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp),
                   as.integer(j)
            )

    return(cplexError(grad))
}


#------------------------------------------------------------------------------#

getItCntCPLEX <- function(env, lp) {

    itcnt <- .Call("getItCnt", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp)
             )

    return(itcnt)
}


#------------------------------------------------------------------------------#

getPhase1CntCPLEX <- function(env, lp) {

    pcnt <- .Call("getPhase1Cnt", PACKAGE = "cplexAPI",
                  ptr(env),
                  ptr(lp)
            )

    return(pcnt)
}



#------------------------------------------------------------------------------#

getSiftItCntCPLEX <- function(env, lp) {

    scnt <- .Call("getSiftItCnt", PACKAGE = "cplexAPI",
                  ptr(env),
                  ptr(lp)
            )

    return(scnt)
}


#------------------------------------------------------------------------------#

getSiftPase1CntCPLEX <- function(env, lp) {

    spcnt <- .Call("getSiftPase1Cnt", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp)
             )

    return(spcnt)
}


#------------------------------------------------------------------------------#

getDbsCntCPLEX <- function(env, lp) {

    dcnt <- .Call("getDbsCnt", PACKAGE = "cplexAPI",
                  ptr(env),
                  ptr(lp)
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
                    ptr(env),
                    ptr(lp),
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
                       ptr(env),
                       ptr(lp),
                       Csol,
                       as.integer(begin),
                       as.integer(end)
                 )

    return(cplexError(colinfeas))
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
                       ptr(env),
                       ptr(lp),
                       Csol,
                       as.integer(begin),
                       as.integer(end)
                 )

    return(cplexError(rowinfeas))
}


#------------------------------------------------------------------------------#

refineConflictCPLEX <- function(env, lp) {

    rcconf <- .Call("refineConflict", PACKAGE = "cplexAPI",
                     ptr(env),
                     ptr(lp)
              )

    return(cplexError(rcconf))
}


#------------------------------------------------------------------------------#

refineConflictExtCPLEX <- function(env, lp, grpcnt, concnt,
                                   grppref, grpbeg, grpind, grptype) {

    status <- .Call("refineConflictExt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(grpcnt),
                    as.integer(concnt),
                    as.numeric(grppref),
                    as.integer(grpbeg),
                    as.integer(grpind),
                    as.character(paste(grptype, collapse = ""))
              )

    return(status)
}


#------------------------------------------------------------------------------#

getConflictCPLEX <- function(env, lp) {

    confl <- .Call("getConflict", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
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

    return(cplexError(confl))
}


#------------------------------------------------------------------------------#

getConflictExtCPLEX <- function(env, lp, begin, end) {

    confle <- .Call("getConflictExt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(begin),
                    as.integer(end)
             )

    return(cplexError(confle))
}


#------------------------------------------------------------------------------#

cLpWriteCPLEX <- function(env, lp, fname) {

    status <- .Call("cLpWrite", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(fname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

freePresolveCPLEX <- function(env, lp) {

    status <- .Call("freePresolve", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getMethodCPLEX <- function(env, lp) {

    method <- .Call("getMethod", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp)
              )

    return(method)
}


#------------------------------------------------------------------------------#

getSubMethodCPLEX <- function(env, lp) {

    submethod <- .Call("getSubMethod", PACKAGE = "cplexAPI",
                        ptr(env),
                        ptr(lp)
              )

    return(submethod)
}


#------------------------------------------------------------------------------#

getDblQualCPLEX <- function(env, lp, w) {

    dqual <- .Call("getDblQual", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(w)
             )

    return(cplexError(dqual))
}


#------------------------------------------------------------------------------#

getIntQualCPLEX <- function(env, lp, w) {

    iqual <- .Call("getIntQual", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(w)
              )

    return(cplexError(iqual))
}


#------------------------------------------------------------------------------#

solnInfoCPLEX <- function(env, lp) {

    solinf <- .Call("solnInfo", PACKAGE = "cplexAPI",
                     ptr(env),
                     ptr(lp)
              )

    return(cplexError(solinf))
}


#------------------------------------------------------------------------------#

solutionCPLEX <- function(env, lp) {

    sol <- .Call("solution", PACKAGE = "cplexAPI",
                  ptr(env),
                  ptr(lp)
            )

    return(cplexError(sol))
}


#------------------------------------------------------------------------------#

solWriteCPLEX <- function(env, lp, fname) {

    status <- .Call("solWrite", PACKAGE = "cplexAPI",
                  ptr(env),
                  ptr(lp),
                  as.character(fname)
            )

    return(status)
}


#------------------------------------------------------------------------------#

readCopySolCPLEX <- function(env, lp, fname) {

    status <- .Call("readCopySol", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(fname)
            )

    return(status)
}


#------------------------------------------------------------------------------#

getStatCPLEX <- function(env, lp) {

    stat <- .Call("getStat", PACKAGE = "cplexAPI",
                  ptr(env),
                  ptr(lp)
            )

    return(stat)
}


#------------------------------------------------------------------------------#

getSubStatCPLEX <- function(env, lp) {

    substat <- .Call("getSubStat", PACKAGE = "cplexAPI",
                      ptr(env),
                      ptr(lp)
            )

    return(substat)
}


#------------------------------------------------------------------------------#

getObjValCPLEX <- function(env, lp) {

    obj <- .Call("getObjVal", PACKAGE = "cplexAPI",
                 ptr(env),
                 ptr(lp)
            )

    return(cplexError(obj))
}


#------------------------------------------------------------------------------#

getProbVarCPLEX <- function(env, lp, begin, end) {

    xval <- .Call("getProbVar", PACKAGE = "cplexAPI",
                  ptr(env),
                  ptr(lp),
                  as.integer(begin),
                  as.integer(end)
            )

    return(cplexError(xval))
}


#------------------------------------------------------------------------------#

getSlackCPLEX <- function(env, lp, begin, end) {

    slack <- .Call("getSlack", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp),
                   as.integer(begin),
                   as.integer(end)
             )

    return(cplexError(slack))
}


#------------------------------------------------------------------------------#

getPiCPLEX <- function(env, lp, begin, end) {

    pi <- .Call("getPi", PACKAGE = "cplexAPI",
                ptr(env),
                ptr(lp),
                as.integer(begin),
                as.integer(end)
          )

    return(cplexError(pi))
}


#------------------------------------------------------------------------------#

getDjCPLEX <- function(env, lp, begin, end) {

    dj <- .Call("getDj", PACKAGE = "cplexAPI",
                ptr(env),
                ptr(lp),
                as.integer(begin),
                as.integer(end)
          )

    return(cplexError(dj))
}


#------------------------------------------------------------------------------#

boundSaCPLEX <- function(env, lp, begin, end) {

    bndsa <- .Call("boundSa", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp),
                   as.integer(begin),
                   as.integer(end)
             )

    return(cplexError(bndsa))
}


#------------------------------------------------------------------------------#

objSaCPLEX <- function(env, lp, begin, end) {

    osa <- .Call("objSa", PACKAGE = "cplexAPI",
                 ptr(env),
                 ptr(lp),
                 as.integer(begin),
                 as.integer(end)
           )

    return(cplexError(osa))
}


#------------------------------------------------------------------------------#

rhsSaCPLEX <- function(env, lp, begin, end) {

    rsa <- .Call("rhsSa", PACKAGE = "cplexAPI",
                 ptr(env),
                 ptr(lp),
                 as.integer(begin),
                 as.integer(end)
           )

    return(cplexError(rsa))
}


#------------------------------------------------------------------------------#

openFileCPLEX <- function(fname, ftype = "w", ptrtype = "cplex_file") {

    cpfile <- .Call("cplexfopen", PACKAGE = "cplexAPI",
                    as.character(fname),
                    as.character(ftype),
                    as.character(ptrtype)
              )

    cpfileP <- cplex_FilePointer(cpfile)
    
    return(cpfileP)
}


#------------------------------------------------------------------------------#

closeFileCPLEX <- function(cpfile) {

    status <- .Call("cplexfclose", PACKAGE = "cplexAPI",
                    ptr(cpfile)
              )

    return(cplexError(status))
}


#------------------------------------------------------------------------------#

fileputCPLEX <- function(cpfile, stuff = "") {

    status <- .Call("fileput", PACKAGE = "cplexAPI",
                    ptr(cpfile),
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
        Ccpfile <- ptr(cpfile)
    }

    status <- .Call("setLogFile", PACKAGE = "cplexAPI",
                    ptr(env),
                    Ccpfile
              )

    return(status)
}


#------------------------------------------------------------------------------#

getLogFileCPLEX <- function(env, ptrtype = "cplex_file") {

    cpfile <- .Call("getLogFile", PACKAGE = "cplexAPI",
                    ptr(env),
                    as.character(ptrtype)
              )
    
    cpfileP <- cplex_FilePointer(cpfile)

    return(cplexError(cpfileP))

}


#------------------------------------------------------------------------------#

getChannelsCPLEX <- function(env, ptrtype = "cplex_chan") {

    channels <- .Call("getChannels", PACKAGE = "cplexAPI",
                      ptr(env),
                      as.character(ptrtype)
                )

    chanNames <- c("cpxresults", "cpxwarning", "cpxerror", "cpxlog")
    chanP <- mapply(cplex_ChannelPointer,
                    chname = chanNames,
                    MoreArgs = list(pointer = channels))

    return(cplexError(chanP))
}


#------------------------------------------------------------------------------#

flushStdChannelsCPLEX <- function(env) {

    status <- .Call("flushStdChannels", PACKAGE = "cplexAPI",
                    ptr(env)
              )

    return(status)
}


#------------------------------------------------------------------------------#

addChannelCPLEX <- function(env, ptrtype = "cplex_chan") {

    newch <- .Call("addChannel", PACKAGE = "cplexAPI",
                   ptr(env),
                   as.character(ptrtype)
              )

    newchP <- cplex_ChannelPointer(newch)

    return(newchP)
}


#------------------------------------------------------------------------------#

delChannelCPLEX <- function(env, newch) {

    invisible(
        .Call("delChannel", PACKAGE = "cplexAPI",
              ptr(env),
              ptr(newch)
        )
    )

}


#------------------------------------------------------------------------------#

disconnectChannelCPLEX <- function(env, newch) {

    invisible(
        .Call("disconnectChannel", PACKAGE = "cplexAPI",
              ptr(env),
              ptr(newch)
        )
    )

}


#------------------------------------------------------------------------------#

flushChannelCPLEX <- function(env, newch) {

    invisible(
        .Call("flushChannel", PACKAGE = "cplexAPI",
              ptr(env),
              ptr(newch)
        )
    )

}


#------------------------------------------------------------------------------#

addFpDestCPLEX <- function(env, newch, cpfile) {

    status <- .Call("addFpDest", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(newch),
                    ptr(cpfile)
              )

    return(status)
}


#------------------------------------------------------------------------------#

delFpDestCPLEX <- function(env, newch, cpfile) {

    status <- .Call("delFpDest", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(newch),
                    ptr(cpfile)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getTimeCPLEX <- function(env) {

    timest <- .Call("getTime", PACKAGE = "cplexAPI",
                    ptr(env)
              )

    return(cplexError(timest))
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
                    ptr(env),
                    ptr(lp),
                    as.integer(nIntP),
                    CintP, CintPv,
                    as.integer(nDblP),
                    CdblP, CdblPv,
                    as.integer(nStrP),
                    CstrP, CstrPv
              )

    return(cplexError(tstat))
}


#------------------------------------------------------------------------------#

setTerminateCPLEX <- function(env, ptrtype = "cplex_term") {

    term <- .Call("setTerminate", PACKAGE = "cplexAPI",
                  ptr(env),
                  as.character(ptrtype)
            )

    termP <- cplex_TermPointer(term)
    
    return(cplexError(termP))
}


#------------------------------------------------------------------------------#

delTerminateCPLEX <- function(env, tsig) {

    status <- .Call("delTerminate", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(tsig)
              )

    return(status)

}


#------------------------------------------------------------------------------#

chgTerminateCPLEX <- function(env, tval = 1) {
    invisible(
        .Call("chgTerminate", PACKAGE = "cplexAPI",
              ptr(env),
              as.integer(tval)
        )
    )
}


#------------------------------------------------------------------------------#

printTerminateCPLEX <- function(env) {

    invisible(.Call("printTerminate", ptr(env), PACKAGE = "cplexAPI"))

}


#------------------------------------------------------------------------------#

addMIPstartsCPLEX <- function(env, lp, mcnt, nzcnt, beg, varindices,
                              values, effortlevel, mipstartname = NULL) {

    if (is.null(mipstartname)) {
        Cmipstartname <- as.null(mipstartname)
    }
    else {
        Cmipstartname <- as.character(mipstartname)
    }

    status <- .Call("addMIPstarts", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(mcnt),
                    as.integer(nzcnt),
                    as.integer(beg),
                    as.integer(varindices),
                    as.numeric(values),
                    as.integer(effortlevel),
                    Cmipstartname
              )

    return(status)
}


#------------------------------------------------------------------------------#

chgMIPstartsCPLEX <- function(env, lp, mcnt, mipstartindices, nzcnt,
                              beg, varindices, values, effortlevel) {

    status <- .Call("chgMIPstarts", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(mcnt),
                    as.integer(mipstartindices),
                    as.integer(nzcnt),
                    as.integer(beg),
                    as.integer(varindices),
                    as.numeric(values),
                    as.integer(effortlevel)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getMIPstartsCPLEX <- function(env, lp, begin, end) {

    mips <- .Call("getMIPstarts", PACKAGE = "cplexAPI",
                  ptr(env),
                  ptr(lp),
                  as.integer(begin),
                  as.integer(end)
            )

    return(cplexError(mips))
}


#------------------------------------------------------------------------------#

getNumMIPstartsCPLEX <- function(env, lp) {

    nmips <- .Call("getNumMIPstarts", PACKAGE = "cplexAPI",
                  ptr(env),
                  ptr(lp)
            )

    return(nmips)
}


#------------------------------------------------------------------------------#

delMIPstartsCPLEX <- function(env, lp, begin, end) {

    status <- .Call("delMIPstarts", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(begin),
                    as.integer(end)
              )

    return(status)
}


#------------------------------------------------------------------------------#

writeMIPstartsCPLEX <- function(env, lp, fname, begin, end) {

    status <- .Call("writeMIPstarts", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(fname),
                    as.integer(begin),
                    as.integer(end)
              )

    return(status)
}


#------------------------------------------------------------------------------#

readCopyMIPstartsCPLEX <- function(env, lp, fname) {

    status <- .Call("readCopyMIPstarts", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(fname)
              )

    return(status)
}


#------------------------------------------------------------------------------#

getMIPstartNameCPLEX <- function(env, lp, begin, end) {

    rname <- .Call("getMIPstartName", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(begin),
                    as.integer(end)
             )

    return(cplexError(rname))
}


#------------------------------------------------------------------------------#

getMIPstartIndexCPLEX <- function(env, lp, iname) {

    rindex <- .Call("getMIPstartIndex", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.character(iname)
             )

    return(cplexError(rindex))
}


#------------------------------------------------------------------------------#

refineMIPstartConflictCPLEX <- function(env, lp, mipstartindex) {

    rcconf <- .Call("refineMIPstartConflict", PACKAGE = "cplexAPI",
                     ptr(env),
                     ptr(lp),
                     as.integer(mipstartindex)
              )

    return(cplexError(rcconf))
}


#------------------------------------------------------------------------------#

refineMIPstartConflictExtCPLEX <- function(env, lp, mipstartindex, grpcnt,
                                           concnt, grppref, grpbeg, grpind,
                                           grptype) {

    status <- .Call("refineMIPstartConflictExt", PACKAGE = "cplexAPI",
                    ptr(env),
                    ptr(lp),
                    as.integer(mipstartindex),
                    as.integer(grpcnt),
                    as.integer(concnt),
                    as.numeric(grppref),
                    as.integer(grpbeg),
                    as.integer(grpind),
                    as.character(paste(grptype, collapse = ""))
              )

    return(status)
}


#------------------------------------------------------------------------------#

getNumQPnzCPLEX <- function(env, lp) {

    nnz <- .Call("getNumQPnz", PACKAGE = "cplexAPI",
                 ptr(env),
                 ptr(lp)
            )

    return(nnz)
}


#------------------------------------------------------------------------------#

getNumQuadCPLEX <- function(env, lp) {

    nq <- .Call("getNumQuad", PACKAGE = "cplexAPI",
                ptr(env),
                ptr(lp)
          )

    return(nq)
}


#------------------------------------------------------------------------------#

getQPcoefCPLEX <- function(env, lp, i, j) {

    qcoef <- .Call("getQPcoef", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp),
                   as.integer(i),
                   as.integer(j)
             )

    return(cplexError(qcoef))
}


#------------------------------------------------------------------------------#

getQuadCPLEX <- function(env, lp, begin, end) {

    cols <- .Call("getQuad", PACKAGE = "cplexAPI",
                   ptr(env),
                   ptr(lp),
                   as.integer(begin),
                   as.integer(end)
            )

    return(cplexError(cols))
}
