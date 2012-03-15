#------------------------------------------------------------------------------#
#                     R Interface to C API of IBM ILOG CPLEX                   #
#------------------------------------------------------------------------------#

#  cplexConst.R
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
#              global variables (from cpxconst.h [12.4.0.0])                   #
#------------------------------------------------------------------------------#

# CPX_INFBOUND:  Any bound bigger than this is treated as infinity
CPX_INFBOUND      <- 1.0E+20

CPX_STR_PARAM_MAX <- 512


# Types of parameters
CPX_PARAMTYPE_NONE   <- as.integer(0)
CPX_PARAMTYPE_INT    <- as.integer(1)
CPX_PARAMTYPE_DOUBLE <- as.integer(2)
CPX_PARAMTYPE_STRING <- as.integer(3)
CPX_PARAMTYPE_LONG   <- as.integer(4)


#------------------------------------------------------------------------------#
# Values returned for 'stat' by solution
CPX_STAT_OPTIMAL                <- as.integer(1)
CPX_STAT_UNBOUNDED              <- as.integer(2)
CPX_STAT_INFEASIBLE             <- as.integer(3)
CPX_STAT_INForUNBD              <- as.integer(4)
CPX_STAT_OPTIMAL_INFEAS         <- as.integer(5)
CPX_STAT_NUM_BEST               <- as.integer(6)
CPX_STAT_ABORT_IT_LIM           <- as.integer(10)
CPX_STAT_ABORT_TIME_LIM         <- as.integer(11)
CPX_STAT_ABORT_OBJ_LIM          <- as.integer(12)
CPX_STAT_ABORT_USER             <- as.integer(13)
CPX_STAT_FEASIBLE_RELAXED_SUM   <- as.integer(14)
CPX_STAT_OPTIMAL_RELAXED_SUM    <- as.integer(15)
CPX_STAT_FEASIBLE_RELAXED_INF   <- as.integer(16)
CPX_STAT_OPTIMAL_RELAXED_INF    <- as.integer(17)
CPX_STAT_FEASIBLE_RELAXED_QUAD  <- as.integer(18)
CPX_STAT_OPTIMAL_RELAXED_QUAD   <- as.integer(19)
CPX_STAT_FEASIBLE               <- as.integer(23)
CPX_STAT_ABORT_DETTIME_LIM      <- as.integer(25)


#------------------------------------------------------------------------------#
# Solution type return values from CPXsolninfo
CPX_NO_SOLN       <- as.integer(0)
CPX_BASIC_SOLN    <- as.integer(1)
CPX_NONBASIC_SOLN <- as.integer(2)
CPX_PRIMAL_SOLN   <- as.integer(3)


#------------------------------------------------------------------------------#
# Values of presolve 'stats' for columns and rows
CPX_PRECOL_LOW   <- as.integer(-1) # fixed to original lb
CPX_PRECOL_UP    <- as.integer(-2) # fixed to original ub
CPX_PRECOL_FIX   <- as.integer(-3) # fixed to some other value
CPX_PRECOL_AGG   <- as.integer(-4) # aggregated y = a*x + b
CPX_PRECOL_OTHER <- as.integer(-5) # cannot be expressed by a linear combination
                                   # of active variables in the presolved model
                                   #  -> crushing will fail if it has to touch
                                   #  such a variable

CPX_PREROW_RED   <- as.integer(-1) # redundant row removed in presolved model
CPX_PREROW_AGG   <- as.integer(-2) # used to aggregate a variable
CPX_PREROW_OTHER <- as.integer(-3) # other, for example merge two inequalities
                                   # into a single equation

#------------------------------------------------------------------------------#
# Generic constants
CPX_ON  <- as.integer(1)
CPX_OFF <- as.integer(0)
CPX_MAX <- as.integer(-1)
CPX_MIN <- as.integer(1)


#------------------------------------------------------------------------------#
# Primal simplex pricing algorithm
CPX_PPRIIND_PARTIAL     <- as.integer(-1)
CPX_PPRIIND_AUTO        <- as.integer(0)
CPX_PPRIIND_DEVEX       <- as.integer(1)
CPX_PPRIIND_STEEP       <- as.integer(2)
CPX_PPRIIND_STEEPQSTART <- as.integer(3)
CPX_PPRIIND_FULL        <- as.integer(4)


#------------------------------------------------------------------------------#
# Dual simplex pricing algorithm
CPX_DPRIIND_AUTO        <- as.integer(0)
CPX_DPRIIND_FULL        <- as.integer(1)
CPX_DPRIIND_STEEP       <- as.integer(2)
CPX_DPRIIND_FULL_STEEP  <- as.integer(3)
CPX_DPRIIND_STEEPQSTART <- as.integer(4)
CPX_DPRIIND_DEVEX       <- as.integer(5)


#------------------------------------------------------------------------------#
# PARALLELMODE values
CPX_PARALLEL_DETERMINISTIC <- as.integer(1)
CPX_PARALLEL_AUTO          <- as.integer(0)
CPX_PARALLEL_OPPORTUNISTIC <- as.integer(-1)


#------------------------------------------------------------------------------#
# Values for CPX_PARAM_WRITELEVEL
CPX_WRITELEVEL_AUTO                 <- as.integer(0)
CPX_WRITELEVEL_ALLVARS              <- as.integer(1)
CPX_WRITELEVEL_DISCRETEVARS         <- as.integer(2)
CPX_WRITELEVEL_NONZEROVARS          <- as.integer(3)
CPX_WRITELEVEL_NONZERODISCRETEVARS  <- as.integer(4)


#------------------------------------------------------------------------------#
# Values for CPX_PARAM_SOLUTIONTARGET
CPX_SOLUTIONTARGET_AUTO          <- as.integer(0)
CPX_SOLUTIONTARGET_OPTIMALCONVEX <- as.integer(1)
CPX_SOLUTIONTARGET_FIRSTORDER    <- as.integer(2)


#------------------------------------------------------------------------------#
# LP/QP solution algorithms, used as possible values for
# CPX_PARAM_LPMETHOD/CPX_PARAM_QPMETHOD/CPX_PARAM_BARCROSSALG/
# CPXgetmethod/...
CPX_ALG_NONE       <- as.integer(-1)
CPX_ALG_AUTOMATIC  <- as.integer(0)
CPX_ALG_PRIMAL     <- as.integer(1)
CPX_ALG_DUAL       <- as.integer(2)
CPX_ALG_NET        <- as.integer(3)
CPX_ALG_BARRIER    <- as.integer(4)
CPX_ALG_SIFTING    <- as.integer(5)
CPX_ALG_CONCURRENT <- as.integer(6)
CPX_ALG_BAROPT     <- as.integer(7)
CPX_ALG_PIVOTIN    <- as.integer(8)
CPX_ALG_PIVOTOUT   <- as.integer(9)
CPX_ALG_PIVOT      <- as.integer(10)
CPX_ALG_FEASOPT    <- as.integer(11)
CPX_ALG_MIP        <- as.integer(12)
CPX_ALG_ROBUST     <- as.integer(13)


#------------------------------------------------------------------------------#
# Basis status values
CPX_AT_LOWER   <- as.integer(0)
CPX_BASIC      <- as.integer(1)
CPX_AT_UPPER   <- as.integer(2)
CPX_FREE_SUPER <- as.integer(3)


#------------------------------------------------------------------------------#
# Variable types for ctype array
CPX_CONTINUOUS <- "C"
CPX_BINARY     <- "B"
CPX_INTEGER    <- "I"
CPX_SEMICONT   <- "S"
CPX_SEMIINT    <- "N"


#------------------------------------------------------------------------------#
# PREREDUCE settings
CPX_PREREDUCE_PRIMALANDDUAL  <- as.integer(3)
CPX_PREREDUCE_DUALONLY       <- as.integer(2)
CPX_PREREDUCE_PRIMALONLY     <- as.integer(1)
CPX_PREREDUCE_NOPRIMALORDUAL <- as.integer(0)


#------------------------------------------------------------------------------#
# Conflict statuses
CPX_STAT_CONFLICT_FEASIBLE            <- as.integer(30)
CPX_STAT_CONFLICT_MINIMAL             <- as.integer(31)
CPX_STAT_CONFLICT_ABORT_CONTRADICTION <- as.integer(32)
CPX_STAT_CONFLICT_ABORT_TIME_LIM      <- as.integer(33)
CPX_STAT_CONFLICT_ABORT_IT_LIM        <- as.integer(34)
CPX_STAT_CONFLICT_ABORT_NODE_LIM      <- as.integer(35)
CPX_STAT_CONFLICT_ABORT_OBJ_LIM       <- as.integer(36)
CPX_STAT_CONFLICT_ABORT_MEM_LIM       <- as.integer(37)
CPX_STAT_CONFLICT_ABORT_USER          <- as.integer(38)
CPX_STAT_CONFLICT_ABORT_DETTIME_LIM   <- as.integer(39)


#------------------------------------------------------------------------------#
# Conflict status values
CPX_CONFLICT_EXCLUDED        <- as.integer(-1)
CPX_CONFLICT_POSSIBLE_MEMBER <- as.integer(0)
CPX_CONFLICT_POSSIBLE_LB     <- as.integer(1)
CPX_CONFLICT_POSSIBLE_UB     <- as.integer(2)
CPX_CONFLICT_MEMBER          <- as.integer(3)
CPX_CONFLICT_LB              <- as.integer(4)
CPX_CONFLICT_UB              <- as.integer(5)


#------------------------------------------------------------------------------#
# Problem Types
# Types 4, 9, and 12 are internal, the others are for users
CPXPROB_LP                    <- as.integer(0)
CPXPROB_MILP                  <- as.integer(1)
CPXPROB_FIXEDMILP             <- as.integer(3)
CPXPROB_NODELP                <- as.integer(4)
CPXPROB_QP                    <- as.integer(5)
CPXPROB_MIQP                  <- as.integer(7)
CPXPROB_FIXEDMIQP             <- as.integer(8)
CPXPROB_NODEQP                <- as.integer(9)
CPXPROB_QCP                   <- as.integer(10)
CPXPROB_MIQCP                 <- as.integer(11)
CPXPROB_NODEQCP               <- as.integer(12)


#------------------------------------------------------------------------------#
# CPLEX Parameter numbers
CPX_PARAM_ADVIND              <- as.integer(1001)
CPX_PARAM_AGGFILL             <- as.integer(1002)
CPX_PARAM_AGGIND              <- as.integer(1003)
CPX_PARAM_BASINTERVAL         <- as.integer(1004)
CPX_PARAM_CFILEMUL            <- as.integer(1005)
CPX_PARAM_CLOCKTYPE           <- as.integer(1006)
CPX_PARAM_CRAIND              <- as.integer(1007)
CPX_PARAM_DEPIND              <- as.integer(1008)
CPX_PARAM_DPRIIND             <- as.integer(1009)
CPX_PARAM_PRICELIM            <- as.integer(1010)
CPX_PARAM_EPMRK               <- as.integer(1013)
CPX_PARAM_EPOPT               <- as.integer(1014)
CPX_PARAM_EPPER               <- as.integer(1015)
CPX_PARAM_EPRHS               <- as.integer(1016)
CPX_PARAM_FASTMIP             <- as.integer(1017)
CPX_PARAM_SIMDISPLAY          <- as.integer(1019)
CPX_PARAM_ITLIM               <- as.integer(1020)
CPX_PARAM_ROWREADLIM          <- as.integer(1021)
CPX_PARAM_NETFIND             <- as.integer(1022)
CPX_PARAM_COLREADLIM          <- as.integer(1023)
CPX_PARAM_NZREADLIM           <- as.integer(1024)
CPX_PARAM_OBJLLIM             <- as.integer(1025)
CPX_PARAM_OBJULIM             <- as.integer(1026)
CPX_PARAM_PERIND              <- as.integer(1027)
CPX_PARAM_PERLIM              <- as.integer(1028)
CPX_PARAM_PPRIIND             <- as.integer(1029)
CPX_PARAM_PREIND              <- as.integer(1030)
CPX_PARAM_REINV               <- as.integer(1031)
CPX_PARAM_REVERSEIND          <- as.integer(1032)
CPX_PARAM_RFILEMUL            <- as.integer(1033)
CPX_PARAM_SCAIND              <- as.integer(1034)
CPX_PARAM_SCRIND              <- as.integer(1035)
CPX_PARAM_SINGLIM             <- as.integer(1037)
CPX_PARAM_SINGTOL             <- as.integer(1038)
CPX_PARAM_TILIM               <- as.integer(1039)
CPX_PARAM_XXXIND              <- as.integer(1041)
CPX_PARAM_PREDUAL             <- as.integer(1044)
CPX_PARAM_EPOPT_H             <- as.integer(1049)
CPX_PARAM_EPRHS_H             <- as.integer(1050)
CPX_PARAM_PREPASS             <- as.integer(1052)
CPX_PARAM_DATACHECK           <- as.integer(1056)
CPX_PARAM_REDUCE              <- as.integer(1057)
CPX_PARAM_PRELINEAR           <- as.integer(1058)
CPX_PARAM_LPMETHOD            <- as.integer(1062)
CPX_PARAM_QPMETHOD            <- as.integer(1063)
CPX_PARAM_WORKDIR             <- as.integer(1064)
CPX_PARAM_WORKMEM             <- as.integer(1065)
CPX_PARAM_THREADS             <- as.integer(1067)
CPX_PARAM_CONFLICTDISPLAY     <- as.integer(1074)
CPX_PARAM_SIFTDISPLAY         <- as.integer(1076)
CPX_PARAM_SIFTALG             <- as.integer(1077)
CPX_PARAM_SIFTITLIM           <- as.integer(1078)
CPX_PARAM_MPSLONGNUM          <- as.integer(1081)
CPX_PARAM_MEMORYEMPHASIS      <- as.integer(1082)
CPX_PARAM_NUMERICALEMPHASIS   <- as.integer(1083)
CPX_PARAM_FEASOPTMODE         <- as.integer(1084)
CPX_PARAM_PARALLELMODE        <- as.integer(1109)
CPX_PARAM_TUNINGMEASURE       <- as.integer(1110)
CPX_PARAM_TUNINGREPEAT        <- as.integer(1111)
CPX_PARAM_TUNINGTILIM         <- as.integer(1112)
CPX_PARAM_TUNINGDISPLAY       <- as.integer(1113)
CPX_PARAM_WRITELEVEL          <- as.integer(1114)
CPX_PARAM_DETTILIM            <- as.integer(1127)
CPX_PARAM_FILEENCODING        <- as.integer(1129)
CPX_PARAM_APIENCODING         <- as.integer(1130)
CPX_PARAM_SOLUTIONTARGET      <- as.integer(1131)
CPX_PARAM_CLONELOG            <- as.integer(1132)

# Barrier is in bardefs.h, MIP is in mipdefs.h, QP is in qpdefs.h
CPX_PARAM_ALL_MIN             <- as.integer(1000)
CPX_PARAM_ALL_MAX             <- as.integer(6000)


#------------------------------------------------------------------------------#
# Values for CPX_PARAM_TUNINGMEASURE
CPX_TUNE_AVERAGE <- as.integer(1)
CPX_TUNE_MINMAX  <- as.integer(2)


#------------------------------------------------------------------------------#
# Values for incomplete tuning
CPX_TUNE_ABORT     <- as.integer(1)
CPX_TUNE_TILIM     <- as.integer(2)
CPX_TUNE_DETTILIM  <- as.integer(3)


#------------------------------------------------------------------------------#
# Quality query identifiers
CPX_MAX_PRIMAL_INFEAS          <- as.integer(1)
CPX_MAX_SCALED_PRIMAL_INFEAS   <- as.integer(2)
CPX_SUM_PRIMAL_INFEAS          <- as.integer(3)
CPX_SUM_SCALED_PRIMAL_INFEAS   <- as.integer(4)
CPX_MAX_DUAL_INFEAS            <- as.integer(5)
CPX_MAX_SCALED_DUAL_INFEAS     <- as.integer(6)
CPX_SUM_DUAL_INFEAS            <- as.integer(7)
CPX_SUM_SCALED_DUAL_INFEAS     <- as.integer(8)
CPX_MAX_INT_INFEAS             <- as.integer(9)
CPX_SUM_INT_INFEAS             <- as.integer(10)
CPX_MAX_PRIMAL_RESIDUAL        <- as.integer(11)
CPX_MAX_SCALED_PRIMAL_RESIDUAL <- as.integer(12)
CPX_SUM_PRIMAL_RESIDUAL        <- as.integer(13)
CPX_SUM_SCALED_PRIMAL_RESIDUAL <- as.integer(14)
CPX_MAX_DUAL_RESIDUAL          <- as.integer(15)
CPX_MAX_SCALED_DUAL_RESIDUAL   <- as.integer(16)
CPX_SUM_DUAL_RESIDUAL          <- as.integer(17)
CPX_SUM_SCALED_DUAL_RESIDUAL   <- as.integer(18)
CPX_MAX_COMP_SLACK             <- as.integer(19)
CPX_SUM_COMP_SLACK             <- as.integer(21)
CPX_MAX_X                      <- as.integer(23)
CPX_MAX_SCALED_X               <- as.integer(24)
CPX_MAX_PI                     <- as.integer(25)
CPX_MAX_SCALED_PI              <- as.integer(26)
CPX_MAX_SLACK                  <- as.integer(27)
CPX_MAX_SCALED_SLACK           <- as.integer(28)
CPX_MAX_RED_COST               <- as.integer(29)
CPX_MAX_SCALED_RED_COST        <- as.integer(30)
CPX_SUM_X                      <- as.integer(31)
CPX_SUM_SCALED_X               <- as.integer(32)
CPX_SUM_PI                     <- as.integer(33)
CPX_SUM_SCALED_PI              <- as.integer(34)
CPX_SUM_SLACK                  <- as.integer(35)
CPX_SUM_SCALED_SLACK           <- as.integer(36)
CPX_SUM_RED_COST               <- as.integer(37)
CPX_SUM_SCALED_RED_COST        <- as.integer(38)
CPX_KAPPA                      <- as.integer(39)
CPX_OBJ_GAP                    <- as.integer(40)
CPX_DUAL_OBJ                   <- as.integer(41)
CPX_PRIMAL_OBJ                 <- as.integer(42)
CPX_MAX_QCPRIMAL_RESIDUAL      <- as.integer(43)
CPX_SUM_QCPRIMAL_RESIDUAL      <- as.integer(44)
CPX_MAX_QCSLACK_INFEAS         <- as.integer(45)
CPX_SUM_QCSLACK_INFEAS         <- as.integer(46)
CPX_MAX_QCSLACK                <- as.integer(47)
CPX_SUM_QCSLACK                <- as.integer(48)
CPX_MAX_INDSLACK_INFEAS        <- as.integer(49)
CPX_SUM_INDSLACK_INFEAS        <- as.integer(50)
CPX_EXACT_KAPPA                <- as.integer(51)
CPX_KAPPA_STABLE               <- as.integer(52)
CPX_KAPPA_SUSPICIOUS           <- as.integer(53)
CPX_KAPPA_UNSTABLE             <- as.integer(54)
CPX_KAPPA_ILLPOSED             <- as.integer(55)
CPX_KAPPA_MAX                  <- as.integer(56)
CPX_KAPPA_ATTENTION            <- as.integer(57)


#------------------------------------------------------------------------------#
# feasopt options
CPX_FEASOPT_MIN_SUM  <- as.integer(0)
CPX_FEASOPT_OPT_SUM  <- as.integer(1)
CPX_FEASOPT_MIN_INF  <- as.integer(2)
CPX_FEASOPT_OPT_INF  <- as.integer(3)
CPX_FEASOPT_MIN_QUAD <- as.integer(4)
CPX_FEASOPT_OPT_QUAD <- as.integer(5)


#------------------------------------------------------------------------------#
# File: barconst.h
# Version 12.3

CPX_STAT_OPTIMAL_FACE_UNBOUNDED <- as.integer(20)
CPX_STAT_ABORT_PRIM_OBJ_LIM     <- as.integer(21)
CPX_STAT_ABORT_DUAL_OBJ_LIM     <- as.integer(22)
CPX_STAT_FIRSTORDER             <- as.integer(24)

# Barrier parameters
CPX_PARAM_BARDSTART           <- as.integer(3001)
CPX_PARAM_BAREPCOMP           <- as.integer(3002)
CPX_PARAM_BARGROWTH           <- as.integer(3003)
CPX_PARAM_BAROBJRNG           <- as.integer(3004)
CPX_PARAM_BARPSTART           <- as.integer(3005)
CPX_PARAM_BARALG              <- as.integer(3007)
CPX_PARAM_BARCOLNZ            <- as.integer(3009)
CPX_PARAM_BARDISPLAY          <- as.integer(3010)
CPX_PARAM_BARITLIM            <- as.integer(3012)
CPX_PARAM_BARMAXCOR           <- as.integer(3013)
CPX_PARAM_BARORDER            <- as.integer(3014)
CPX_PARAM_BARSTARTALG         <- as.integer(3017)
CPX_PARAM_BARCROSSALG         <- as.integer(3018)
CPX_PARAM_BARQCPEPCOMP        <- as.integer(3020)

# Optimizing Problems
CPX_BARORDER_AUTO <- as.integer(0)
CPX_BARORDER_AMD  <- as.integer(1)
CPX_BARORDER_AMF  <- as.integer(2)
CPX_BARORDER_ND   <- as.integer(3)


#------------------------------------------------------------------------------#
# File: mipconst.h
# Version 12.3

# MIP emphasis settings
CPX_MIPEMPHASIS_BALANCED     <- as.integer(0)
CPX_MIPEMPHASIS_FEASIBILITY  <- as.integer(1)
CPX_MIPEMPHASIS_OPTIMALITY   <- as.integer(2)
CPX_MIPEMPHASIS_BESTBOUND    <- as.integer(3)
CPX_MIPEMPHASIS_HIDDENFEAS   <- as.integer(4)

# Values for sostype and branch type
CPX_TYPE_VAR                 <- "0"
CPX_TYPE_SOS1                <- "1"
CPX_TYPE_SOS2                <- "2"
CPX_TYPE_USER                <- "X"
CPX_TYPE_ANY                 <- "A"

# Variable selection values
CPX_VARSEL_MININFEAS      <- as.integer(-1)
CPX_VARSEL_DEFAULT        <- as.integer(0)
CPX_VARSEL_MAXINFEAS      <- as.integer(1)
CPX_VARSEL_PSEUDO         <- as.integer(2)
CPX_VARSEL_STRONG         <- as.integer(3)
CPX_VARSEL_PSEUDOREDUCED  <- as.integer(4)

# Node selection values
CPX_NODESEL_DFS           <- as.integer(0)
CPX_NODESEL_BESTBOUND     <- as.integer(1)
CPX_NODESEL_BESTEST       <- as.integer(2)
CPX_NODESEL_BESTEST_ALT   <- as.integer(3)

# Values for generated priority order
CPX_MIPORDER_COST                <- as.integer(1)
CPX_MIPORDER_BOUNDS              <- as.integer(2)
CPX_MIPORDER_SCALEDCOST          <- as.integer(3)

# Values for direction array
CPX_BRANCH_GLOBAL                <- as.integer(0)
CPX_BRANCH_DOWN                  <- as.integer(-1)
CPX_BRANCH_UP                    <- as.integer(1)

# Values for CPX_PARAM_BRDIR
CPX_BRDIR_DOWN                   <- as.integer(-1)
CPX_BRDIR_AUTO                   <- as.integer(0)
CPX_BRDIR_UP                     <- as.integer(1)

# Values for CPX_PARAM_MIPSEARCH
CPX_MIPSEARCH_AUTO         <- as.integer(0)
CPX_MIPSEARCH_TRADITIONAL  <- as.integer(1)
CPX_MIPSEARCH_DYNAMIC      <- as.integer(2)

# Values for CPX_PARAM_MIPKAPPASTATS
CPX_MIPKAPPA_OFF     <- as.integer(-1)
CPX_MIPKAPPA_AUTO    <- as.integer(0)
CPX_MIPKAPPA_SAMPLE  <- as.integer(1)
CPX_MIPKAPPA_FULL    <- as.integer(2)

# Effort levels for MIP starts
CPX_MIPSTART_AUTO          <- as.integer(0)
CPX_MIPSTART_CHECKFEAS     <- as.integer(1)
CPX_MIPSTART_SOLVEFIXED    <- as.integer(2)
CPX_MIPSTART_SOLVEMIP      <- as.integer(3)
CPX_MIPSTART_REPAIR        <- as.integer(4)

# MIP Problem status codes
CPXMIP_OPTIMAL               <- as.integer(101)
CPXMIP_OPTIMAL_TOL           <- as.integer(102)
CPXMIP_INFEASIBLE            <- as.integer(103)
CPXMIP_SOL_LIM               <- as.integer(104)
CPXMIP_NODE_LIM_FEAS         <- as.integer(105)
CPXMIP_NODE_LIM_INFEAS       <- as.integer(106)
CPXMIP_TIME_LIM_FEAS         <- as.integer(107)
CPXMIP_TIME_LIM_INFEAS       <- as.integer(108)
CPXMIP_FAIL_FEAS             <- as.integer(109)
CPXMIP_FAIL_INFEAS           <- as.integer(110)
CPXMIP_MEM_LIM_FEAS          <- as.integer(111)
CPXMIP_MEM_LIM_INFEAS        <- as.integer(112)
CPXMIP_ABORT_FEAS            <- as.integer(113)
CPXMIP_ABORT_INFEAS          <- as.integer(114)
CPXMIP_OPTIMAL_INFEAS        <- as.integer(115)
CPXMIP_FAIL_FEAS_NO_TREE     <- as.integer(116)
CPXMIP_FAIL_INFEAS_NO_TREE   <- as.integer(117)
CPXMIP_UNBOUNDED             <- as.integer(118)
CPXMIP_INForUNBD             <- as.integer(119)
CPXMIP_FEASIBLE_RELAXED_SUM  <- as.integer(120)
CPXMIP_OPTIMAL_RELAXED_SUM   <- as.integer(121)
CPXMIP_FEASIBLE_RELAXED_INF  <- as.integer(122)
CPXMIP_OPTIMAL_RELAXED_INF   <- as.integer(123)
CPXMIP_FEASIBLE_RELAXED_QUAD <- as.integer(124)
CPXMIP_OPTIMAL_RELAXED_QUAD  <- as.integer(125)
CPXMIP_ABORT_RELAXED         <- as.integer(126)
CPXMIP_FEASIBLE              <- as.integer(127)
CPXMIP_POPULATESOL_LIM       <- as.integer(128)
CPXMIP_OPTIMAL_POPULATED     <- as.integer(129)
CPXMIP_OPTIMAL_POPULATED_TOL <- as.integer(130)
CPXMIP_DETTIME_LIM_FEAS      <- as.integer(131)
CPXMIP_DETTIME_LIM_INFEAS    <- as.integer(132)

# Valid purgeable values for adding usercuts and lazyconstraints
CPX_USECUT_FORCE             <- as.integer(0)
CPX_USECUT_PURGE             <- as.integer(1)
CPX_USECUT_FILTER            <- as.integer(2)

# For CPXgetnodeintfeas
CPX_INTEGER_FEASIBLE         <- as.integer(0)
CPX_INTEGER_INFEASIBLE       <- as.integer(1)
CPX_IMPLIED_INTEGER_FEASIBLE <- as.integer(2)

# MIP Parameter numbers
CPX_PARAM_BRDIR               <- as.integer(2001)
CPX_PARAM_BTTOL               <- as.integer(2002)
CPX_PARAM_CLIQUES             <- as.integer(2003)
CPX_PARAM_COEREDIND           <- as.integer(2004)
CPX_PARAM_COVERS              <- as.integer(2005)
CPX_PARAM_CUTLO               <- as.integer(2006)
CPX_PARAM_CUTUP               <- as.integer(2007)
CPX_PARAM_EPAGAP              <- as.integer(2008)
CPX_PARAM_EPGAP               <- as.integer(2009)
CPX_PARAM_EPINT               <- as.integer(2010)
CPX_PARAM_MIPDISPLAY          <- as.integer(2012)
CPX_PARAM_MIPINTERVAL         <- as.integer(2013)
CPX_PARAM_INTSOLLIM           <- as.integer(2015)
CPX_PARAM_NODEFILEIND         <- as.integer(2016)
CPX_PARAM_NODELIM             <- as.integer(2017)
CPX_PARAM_NODESEL             <- as.integer(2018)
CPX_PARAM_OBJDIF              <- as.integer(2019)
CPX_PARAM_MIPORDIND           <- as.integer(2020)
CPX_PARAM_RELOBJDIF           <- as.integer(2022)
CPX_PARAM_STARTALG            <- as.integer(2025)
CPX_PARAM_SUBALG              <- as.integer(2026)
CPX_PARAM_TRELIM              <- as.integer(2027)
CPX_PARAM_VARSEL              <- as.integer(2028)
CPX_PARAM_BNDSTRENIND         <- as.integer(2029)
CPX_PARAM_HEURFREQ            <- as.integer(2031)
CPX_PARAM_MIPORDTYPE          <- as.integer(2032)
CPX_PARAM_CUTSFACTOR          <- as.integer(2033)
CPX_PARAM_RELAXPREIND         <- as.integer(2034)
CPX_PARAM_PRESLVND            <- as.integer(2037)
CPX_PARAM_BBINTERVAL          <- as.integer(2039)
CPX_PARAM_FLOWCOVERS          <- as.integer(2040)
CPX_PARAM_IMPLBD              <- as.integer(2041)
CPX_PARAM_PROBE               <- as.integer(2042)
CPX_PARAM_GUBCOVERS           <- as.integer(2044)
CPX_PARAM_STRONGCANDLIM       <- as.integer(2045)
CPX_PARAM_STRONGITLIM         <- as.integer(2046)
CPX_PARAM_FRACCAND            <- as.integer(2048)
CPX_PARAM_FRACCUTS            <- as.integer(2049)
CPX_PARAM_FRACPASS            <- as.integer(2050)
CPX_PARAM_FLOWPATHS           <- as.integer(2051)
CPX_PARAM_MIRCUTS             <- as.integer(2052)
CPX_PARAM_DISJCUTS            <- as.integer(2053)
CPX_PARAM_AGGCUTLIM           <- as.integer(2054)
CPX_PARAM_MIPCBREDLP          <- as.integer(2055)
CPX_PARAM_CUTPASS             <- as.integer(2056)
CPX_PARAM_MIPEMPHASIS         <- as.integer(2058)
CPX_PARAM_SYMMETRY            <- as.integer(2059)
CPX_PARAM_DIVETYPE            <- as.integer(2060)
CPX_PARAM_RINSHEUR            <- as.integer(2061)
CPX_PARAM_SUBMIPNODELIM       <- as.integer(2062)
CPX_PARAM_LBHEUR              <- as.integer(2063)
CPX_PARAM_REPEATPRESOLVE      <- as.integer(2064)
CPX_PARAM_PROBETIME           <- as.integer(2065)
CPX_PARAM_POLISHTIME          <- as.integer(2066)
CPX_PARAM_REPAIRTRIES         <- as.integer(2067)
CPX_PARAM_EPLIN               <- as.integer(2068)
CPX_PARAM_EPRELAX             <- as.integer(2073)
CPX_PARAM_FPHEUR              <- as.integer(2098)
CPX_PARAM_EACHCUTLIM          <- as.integer(2102)
CPX_PARAM_SOLNPOOLCAPACITY    <- as.integer(2103)
CPX_PARAM_SOLNPOOLREPLACE     <- as.integer(2104)
CPX_PARAM_SOLNPOOLGAP         <- as.integer(2105)
CPX_PARAM_SOLNPOOLAGAP        <- as.integer(2106)
CPX_PARAM_SOLNPOOLINTENSITY   <- as.integer(2107)
CPX_PARAM_POPULATELIM         <- as.integer(2108)
CPX_PARAM_MIPSEARCH           <- as.integer(2109)
CPX_PARAM_MIQCPSTRAT          <- as.integer(2110)
CPX_PARAM_ZEROHALFCUTS        <- as.integer(2111)
CPX_PARAM_POLISHAFTEREPAGAP   <- as.integer(2126)
CPX_PARAM_POLISHAFTEREPGAP    <- as.integer(2127)
CPX_PARAM_POLISHAFTERNODE     <- as.integer(2128)
CPX_PARAM_POLISHAFTERINTSOL   <- as.integer(2129)
CPX_PARAM_POLISHAFTERTIME     <- as.integer(2130)
CPX_PARAM_MCFCUTS             <- as.integer(2134)
CPX_PARAM_MIPKAPPASTATS       <- as.integer(2137)
CPX_PARAM_AUXROOTTHREADS      <- as.integer(2139)
CPX_PARAM_INTSOLFILEPREFIX    <- as.integer(2143)

# Values for CPX_PARAM_SOLNPOOLREPLACE
CPX_SOLNPOOL_FIFO    <- as.integer(0)
CPX_SOLNPOOL_OBJ     <- as.integer(1)
CPX_SOLNPOOL_DIV     <- as.integer(2)

CPX_SOLNPOOL_FILTER_DIVERSITY   <- as.integer(1)
CPX_SOLNPOOL_FILTER_RANGE       <- as.integer(2)


#------------------------------------------------------------------------------#
# File: gcconst.h
# Version 12.3

CPX_CON_LOWER_BOUND          <- as.integer(1)
CPX_CON_UPPER_BOUND          <- as.integer(2)
CPX_CON_LINEAR               <- as.integer(3)
CPX_CON_QUADRATIC            <- as.integer(4)
CPX_CON_SOS                  <- as.integer(5)
CPX_CON_INDICATOR            <- as.integer(6)

# internal types
CPX_CON_MINEXPR              <- as.integer(7)
CPX_CON_MAXEXPR              <- as.integer(8)
CPX_CON_PWL                  <- as.integer(9)
CPX_CON_ABS                  <- as.integer(9)  # same as PWL since using it
CPX_CON_DISJCST              <- as.integer(10)
CPX_CON_INDDISJCST           <- as.integer(11)
CPX_CON_SETVAR               <- as.integer(12)
CPX_CON_SETVARMEMBER         <- as.integer(13)
CPX_CON_SETVARCARD           <- as.integer(14)
CPX_CON_SETVARSUM            <- as.integer(15)
CPX_CON_SETVARMIN            <- as.integer(16)
CPX_CON_SETVARMAX            <- as.integer(17)
CPX_CON_SETVARSUBSET         <- as.integer(18)
CPX_CON_SETVARDOMAIN         <- as.integer(19)
CPX_CON_SETVARUNION          <- as.integer(20)
CPX_CON_SETVARINTERSECTION   <- as.integer(21)
CPX_CON_SETVARNULLINTERSECT  <- as.integer(22)
CPX_CON_SETVARINTERSECT      <- as.integer(23)
CPX_CON_SETVAREQ             <- as.integer(24)
CPX_CON_SETVARNEQ            <- as.integer(25)
CPX_CON_SETVARNEQCST         <- as.integer(26)
CPX_CON_LAST_CONTYPE         <- as.integer(27)


#------------------------------------------------------------------------------#
# File: netconst.h
# Version 12.3

# Network parameters
CPX_PARAM_NETITLIM            <- as.integer(5001)
CPX_PARAM_NETEPOPT            <- as.integer(5002)
CPX_PARAM_NETEPRHS            <- as.integer(5003)
CPX_PARAM_NETPPRIIND          <- as.integer(5004)
CPX_PARAM_NETDISPLAY          <- as.integer(5005)

# NETOPT display values
CPXNET_NO_DISPLAY_OBJECTIVE <- as.integer(0)
CPXNET_TRUE_OBJECTIVE       <- as.integer(1)
CPXNET_PENALIZED_OBJECTIVE  <- as.integer(2)

# NETOPT pricing parameters
CPXNET_PRICE_AUTO           <- as.integer(0)
CPXNET_PRICE_PARTIAL        <- as.integer(1)
CPXNET_PRICE_MULT_PART      <- as.integer(2)
CPXNET_PRICE_SORT_MULT_PART <- as.integer(3)


#------------------------------------------------------------------------------#
# File: qpconst.h
# Version 12.3

# Copying data
CPX_PARAM_QPNZREADLIM         <- as.integer(4001)

# presolve
CPX_PARAM_QPMAKEPSDIND        <- as.integer(4010)


#------------------------------------------------------------------------------#
# Error codes

# Callable library miscellaneous routines
CPXERR_NEGATIVE_SURPLUS       <- as.integer(1207)
CPXERR_NO_SENSIT              <- as.integer(1260)

