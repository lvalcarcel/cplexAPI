#------------------------------------------------------------------------------#
#                     R Interface to C API of IBM ILOG CPLEX                   #
#------------------------------------------------------------------------------#

#  cplexConst.R
#  R Interface to C API of IBM ILOG CPLEX Version 12.1, 12.2, 12.3, 12.4, 12.5.
#
#  Copyright (C) 2011-2013 Gabriel Gelius-Dietrich, Dpt. for Bioinformatics,
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
CPX_PARAMTYPE_NONE   <- 0L
CPX_PARAMTYPE_INT    <- 1L
CPX_PARAMTYPE_DOUBLE <- 2L
CPX_PARAMTYPE_STRING <- 3L
CPX_PARAMTYPE_LONG   <- 4L


#------------------------------------------------------------------------------#
# Values returned for 'stat' by solution
CPX_STAT_OPTIMAL                <- 1L
CPX_STAT_UNBOUNDED              <- 2L
CPX_STAT_INFEASIBLE             <- 3L
CPX_STAT_INForUNBD              <- 4L
CPX_STAT_OPTIMAL_INFEAS         <- 5L
CPX_STAT_NUM_BEST               <- 6L
CPX_STAT_ABORT_IT_LIM           <- 10L
CPX_STAT_ABORT_TIME_LIM         <- 11L
CPX_STAT_ABORT_OBJ_LIM          <- 12L
CPX_STAT_ABORT_USER             <- 13L
CPX_STAT_FEASIBLE_RELAXED_SUM   <- 14L
CPX_STAT_OPTIMAL_RELAXED_SUM    <- 15L
CPX_STAT_FEASIBLE_RELAXED_INF   <- 16L
CPX_STAT_OPTIMAL_RELAXED_INF    <- 17L
CPX_STAT_FEASIBLE_RELAXED_QUAD  <- 18L
CPX_STAT_OPTIMAL_RELAXED_QUAD   <- 19L
CPX_STAT_FEASIBLE               <- 23L
CPX_STAT_ABORT_DETTIME_LIM      <- 25L


#------------------------------------------------------------------------------#
# Solution type return values from CPXsolninfo
CPX_NO_SOLN       <- 0L
CPX_BASIC_SOLN    <- 1L
CPX_NONBASIC_SOLN <- 2L
CPX_PRIMAL_SOLN   <- 3L


#------------------------------------------------------------------------------#
# Values of presolve 'stats' for columns and rows
CPX_PRECOL_LOW   <- -1L # fixed to original lb
CPX_PRECOL_UP    <- -2L # fixed to original ub
CPX_PRECOL_FIX   <- -3L # fixed to some other value
CPX_PRECOL_AGG   <- -4L # aggregated y = a*x + b
CPX_PRECOL_OTHER <- -5L # cannot be expressed by a linear combination
                                   # of active variables in the presolved model
                                   #  -> crushing will fail if it has to touch
                                   #  such a variable

CPX_PREROW_RED   <- -1L # redundant row removed in presolved model
CPX_PREROW_AGG   <- -2L # used to aggregate a variable
CPX_PREROW_OTHER <- -3L # other, for example merge two inequalities
                                   # into a single equation

#------------------------------------------------------------------------------#
# Generic constants
CPX_ON  <- 1L
CPX_OFF <- 0L
CPX_MAX <- -1L
CPX_MIN <- 1L


#------------------------------------------------------------------------------#
# Primal simplex pricing algorithm
CPX_PPRIIND_PARTIAL     <- -1L
CPX_PPRIIND_AUTO        <- 0L
CPX_PPRIIND_DEVEX       <- 1L
CPX_PPRIIND_STEEP       <- 2L
CPX_PPRIIND_STEEPQSTART <- 3L
CPX_PPRIIND_FULL        <- 4L


#------------------------------------------------------------------------------#
# Dual simplex pricing algorithm
CPX_DPRIIND_AUTO        <- 0L
CPX_DPRIIND_FULL        <- 1L
CPX_DPRIIND_STEEP       <- 2L
CPX_DPRIIND_FULL_STEEP  <- 3L
CPX_DPRIIND_STEEPQSTART <- 4L
CPX_DPRIIND_DEVEX       <- 5L


#------------------------------------------------------------------------------#
# PARALLELMODE values
CPX_PARALLEL_DETERMINISTIC <- 1L
CPX_PARALLEL_AUTO          <- 0L
CPX_PARALLEL_OPPORTUNISTIC <- -1L


#------------------------------------------------------------------------------#
# Values for CPX_PARAM_WRITELEVEL
CPX_WRITELEVEL_AUTO                 <- 0L
CPX_WRITELEVEL_ALLVARS              <- 1L
CPX_WRITELEVEL_DISCRETEVARS         <- 2L
CPX_WRITELEVEL_NONZEROVARS          <- 3L
CPX_WRITELEVEL_NONZERODISCRETEVARS  <- 4L


#------------------------------------------------------------------------------#
# Values for CPX_PARAM_SOLUTIONTARGET
CPX_SOLUTIONTARGET_AUTO          <- 0L
CPX_SOLUTIONTARGET_OPTIMALCONVEX <- 1L
CPX_SOLUTIONTARGET_FIRSTORDER    <- 2L


#------------------------------------------------------------------------------#
# LP/QP solution algorithms, used as possible values for
# CPX_PARAM_LPMETHOD/CPX_PARAM_QPMETHOD/CPX_PARAM_BARCROSSALG/
# CPXgetmethod/...
CPX_ALG_NONE       <- -1L
CPX_ALG_AUTOMATIC  <- 0L
CPX_ALG_PRIMAL     <- 1L
CPX_ALG_DUAL       <- 2L
CPX_ALG_NET        <- 3L
CPX_ALG_BARRIER    <- 4L
CPX_ALG_SIFTING    <- 5L
CPX_ALG_CONCURRENT <- 6L
CPX_ALG_BAROPT     <- 7L
CPX_ALG_PIVOTIN    <- 8L
CPX_ALG_PIVOTOUT   <- 9L
CPX_ALG_PIVOT      <- 10L
CPX_ALG_FEASOPT    <- 11L
CPX_ALG_MIP        <- 12L
CPX_ALG_ROBUST     <- 13L


#------------------------------------------------------------------------------#
# Basis status values
CPX_AT_LOWER   <- 0L
CPX_BASIC      <- 1L
CPX_AT_UPPER   <- 2L
CPX_FREE_SUPER <- 3L


#------------------------------------------------------------------------------#
# Variable types for ctype array
CPX_CONTINUOUS <- "C"
CPX_BINARY     <- "B"
CPX_INTEGER    <- "I"
CPX_SEMICONT   <- "S"
CPX_SEMIINT    <- "N"


#------------------------------------------------------------------------------#
# PREREDUCE settings
CPX_PREREDUCE_PRIMALANDDUAL  <- 3L
CPX_PREREDUCE_DUALONLY       <- 2L
CPX_PREREDUCE_PRIMALONLY     <- 1L
CPX_PREREDUCE_NOPRIMALORDUAL <- 0L


#------------------------------------------------------------------------------#
# Conflict statuses
CPX_STAT_CONFLICT_FEASIBLE            <- 30L
CPX_STAT_CONFLICT_MINIMAL             <- 31L
CPX_STAT_CONFLICT_ABORT_CONTRADICTION <- 32L
CPX_STAT_CONFLICT_ABORT_TIME_LIM      <- 33L
CPX_STAT_CONFLICT_ABORT_IT_LIM        <- 34L
CPX_STAT_CONFLICT_ABORT_NODE_LIM      <- 35L
CPX_STAT_CONFLICT_ABORT_OBJ_LIM       <- 36L
CPX_STAT_CONFLICT_ABORT_MEM_LIM       <- 37L
CPX_STAT_CONFLICT_ABORT_USER          <- 38L
CPX_STAT_CONFLICT_ABORT_DETTIME_LIM   <- 39L


#------------------------------------------------------------------------------#
# Conflict status values
CPX_CONFLICT_EXCLUDED        <- -1L
CPX_CONFLICT_POSSIBLE_MEMBER <- 0L
CPX_CONFLICT_POSSIBLE_LB     <- 1L
CPX_CONFLICT_POSSIBLE_UB     <- 2L
CPX_CONFLICT_MEMBER          <- 3L
CPX_CONFLICT_LB              <- 4L
CPX_CONFLICT_UB              <- 5L


#------------------------------------------------------------------------------#
# Problem Types
# Types 4, 9, and 12 are internal, the others are for users
CPXPROB_LP                    <- 0L
CPXPROB_MILP                  <- 1L
CPXPROB_FIXEDMILP             <- 3L
CPXPROB_NODELP                <- 4L
CPXPROB_QP                    <- 5L
CPXPROB_MIQP                  <- 7L
CPXPROB_FIXEDMIQP             <- 8L
CPXPROB_NODEQP                <- 9L
CPXPROB_QCP                   <- 10L
CPXPROB_MIQCP                 <- 11L
CPXPROB_NODEQCP               <- 12L


#------------------------------------------------------------------------------#
# CPLEX Parameter numbers
CPX_PARAM_ADVIND              <- 1001L
CPX_PARAM_AGGFILL             <- 1002L
CPX_PARAM_AGGIND              <- 1003L
CPX_PARAM_BASINTERVAL         <- 1004L
CPX_PARAM_CFILEMUL            <- 1005L
CPX_PARAM_CLOCKTYPE           <- 1006L
CPX_PARAM_CRAIND              <- 1007L
CPX_PARAM_DEPIND              <- 1008L
CPX_PARAM_DPRIIND             <- 1009L
CPX_PARAM_PRICELIM            <- 1010L
CPX_PARAM_EPMRK               <- 1013L
CPX_PARAM_EPOPT               <- 1014L
CPX_PARAM_EPPER               <- 1015L
CPX_PARAM_EPRHS               <- 1016L
CPX_PARAM_FASTMIP             <- 1017L
CPX_PARAM_SIMDISPLAY          <- 1019L
CPX_PARAM_ITLIM               <- 1020L
CPX_PARAM_ROWREADLIM          <- 1021L
CPX_PARAM_NETFIND             <- 1022L
CPX_PARAM_COLREADLIM          <- 1023L
CPX_PARAM_NZREADLIM           <- 1024L
CPX_PARAM_OBJLLIM             <- 1025L
CPX_PARAM_OBJULIM             <- 1026L
CPX_PARAM_PERIND              <- 1027L
CPX_PARAM_PERLIM              <- 1028L
CPX_PARAM_PPRIIND             <- 1029L
CPX_PARAM_PREIND              <- 1030L
CPX_PARAM_REINV               <- 1031L
CPX_PARAM_REVERSEIND          <- 1032L
CPX_PARAM_RFILEMUL            <- 1033L
CPX_PARAM_SCAIND              <- 1034L
CPX_PARAM_SCRIND              <- 1035L
CPX_PARAM_SINGLIM             <- 1037L
CPX_PARAM_SINGTOL             <- 1038L
CPX_PARAM_TILIM               <- 1039L
CPX_PARAM_XXXIND              <- 1041L
CPX_PARAM_PREDUAL             <- 1044L
CPX_PARAM_EPOPT_H             <- 1049L
CPX_PARAM_EPRHS_H             <- 1050L
CPX_PARAM_PREPASS             <- 1052L
CPX_PARAM_DATACHECK           <- 1056L
CPX_PARAM_REDUCE              <- 1057L
CPX_PARAM_PRELINEAR           <- 1058L
CPX_PARAM_LPMETHOD            <- 1062L
CPX_PARAM_QPMETHOD            <- 1063L
CPX_PARAM_WORKDIR             <- 1064L
CPX_PARAM_WORKMEM             <- 1065L
CPX_PARAM_THREADS             <- 1067L
CPX_PARAM_CONFLICTDISPLAY     <- 1074L
CPX_PARAM_SIFTDISPLAY         <- 1076L
CPX_PARAM_SIFTALG             <- 1077L
CPX_PARAM_SIFTITLIM           <- 1078L
CPX_PARAM_MPSLONGNUM          <- 1081L
CPX_PARAM_MEMORYEMPHASIS      <- 1082L
CPX_PARAM_NUMERICALEMPHASIS   <- 1083L
CPX_PARAM_FEASOPTMODE         <- 1084L
CPX_PARAM_PARALLELMODE        <- 1109L
CPX_PARAM_TUNINGMEASURE       <- 1110L
CPX_PARAM_TUNINGREPEAT        <- 1111L
CPX_PARAM_TUNINGTILIM         <- 1112L
CPX_PARAM_TUNINGDISPLAY       <- 1113L
CPX_PARAM_WRITELEVEL          <- 1114L
CPX_PARAM_RANDOMSEED          <- 1124L
CPX_PARAM_DETTILIM            <- 1127L
CPX_PARAM_FILEENCODING        <- 1129L
CPX_PARAM_APIENCODING         <- 1130L
CPX_PARAM_SOLUTIONTARGET      <- 1131L
CPX_PARAM_CLONELOG            <- 1132L
CPX_PARAM_TUNINGDETTILIM      <- 1139L

# Barrier is in bardefs.h, MIP is in mipdefs.h, QP is in qpdefs.h
CPX_PARAM_ALL_MIN             <- 1000L
CPX_PARAM_ALL_MAX             <- 6000L


#------------------------------------------------------------------------------#
# Values for CPX_PARAM_TUNINGMEASURE
CPX_TUNE_AVERAGE <- 1L
CPX_TUNE_MINMAX  <- 2L


#------------------------------------------------------------------------------#
# Values for incomplete tuning
CPX_TUNE_ABORT     <- 1L
CPX_TUNE_TILIM     <- 2L
CPX_TUNE_DETTILIM  <- 3L


#------------------------------------------------------------------------------#
# Quality query identifiers
CPX_MAX_PRIMAL_INFEAS          <- 1L
CPX_MAX_SCALED_PRIMAL_INFEAS   <- 2L
CPX_SUM_PRIMAL_INFEAS          <- 3L
CPX_SUM_SCALED_PRIMAL_INFEAS   <- 4L
CPX_MAX_DUAL_INFEAS            <- 5L
CPX_MAX_SCALED_DUAL_INFEAS     <- 6L
CPX_SUM_DUAL_INFEAS            <- 7L
CPX_SUM_SCALED_DUAL_INFEAS     <- 8L
CPX_MAX_INT_INFEAS             <- 9L
CPX_SUM_INT_INFEAS             <- 10L
CPX_MAX_PRIMAL_RESIDUAL        <- 11L
CPX_MAX_SCALED_PRIMAL_RESIDUAL <- 12L
CPX_SUM_PRIMAL_RESIDUAL        <- 13L
CPX_SUM_SCALED_PRIMAL_RESIDUAL <- 14L
CPX_MAX_DUAL_RESIDUAL          <- 15L
CPX_MAX_SCALED_DUAL_RESIDUAL   <- 16L
CPX_SUM_DUAL_RESIDUAL          <- 17L
CPX_SUM_SCALED_DUAL_RESIDUAL   <- 18L
CPX_MAX_COMP_SLACK             <- 19L
CPX_SUM_COMP_SLACK             <- 21L
CPX_MAX_X                      <- 23L
CPX_MAX_SCALED_X               <- 24L
CPX_MAX_PI                     <- 25L
CPX_MAX_SCALED_PI              <- 26L
CPX_MAX_SLACK                  <- 27L
CPX_MAX_SCALED_SLACK           <- 28L
CPX_MAX_RED_COST               <- 29L
CPX_MAX_SCALED_RED_COST        <- 30L
CPX_SUM_X                      <- 31L
CPX_SUM_SCALED_X               <- 32L
CPX_SUM_PI                     <- 33L
CPX_SUM_SCALED_PI              <- 34L
CPX_SUM_SLACK                  <- 35L
CPX_SUM_SCALED_SLACK           <- 36L
CPX_SUM_RED_COST               <- 37L
CPX_SUM_SCALED_RED_COST        <- 38L
CPX_KAPPA                      <- 39L
CPX_OBJ_GAP                    <- 40L
CPX_DUAL_OBJ                   <- 41L
CPX_PRIMAL_OBJ                 <- 42L
CPX_MAX_QCPRIMAL_RESIDUAL      <- 43L
CPX_SUM_QCPRIMAL_RESIDUAL      <- 44L
CPX_MAX_QCSLACK_INFEAS         <- 45L
CPX_SUM_QCSLACK_INFEAS         <- 46L
CPX_MAX_QCSLACK                <- 47L
CPX_SUM_QCSLACK                <- 48L
CPX_MAX_INDSLACK_INFEAS        <- 49L
CPX_SUM_INDSLACK_INFEAS        <- 50L
CPX_EXACT_KAPPA                <- 51L
CPX_KAPPA_STABLE               <- 52L
CPX_KAPPA_SUSPICIOUS           <- 53L
CPX_KAPPA_UNSTABLE             <- 54L
CPX_KAPPA_ILLPOSED             <- 55L
CPX_KAPPA_MAX                  <- 56L
CPX_KAPPA_ATTENTION            <- 57L


#------------------------------------------------------------------------------#
# feasopt options
CPX_FEASOPT_MIN_SUM  <- 0L
CPX_FEASOPT_OPT_SUM  <- 1L
CPX_FEASOPT_MIN_INF  <- 2L
CPX_FEASOPT_OPT_INF  <- 3L
CPX_FEASOPT_MIN_QUAD <- 4L
CPX_FEASOPT_OPT_QUAD <- 5L


#------------------------------------------------------------------------------#
# File: barconst.h
# Version 12.3

CPX_STAT_OPTIMAL_FACE_UNBOUNDED <- 20L
CPX_STAT_ABORT_PRIM_OBJ_LIM     <- 21L
CPX_STAT_ABORT_DUAL_OBJ_LIM     <- 22L
CPX_STAT_FIRSTORDER             <- 24L

# Barrier parameters
CPX_PARAM_BARDSTART           <- 3001L
CPX_PARAM_BAREPCOMP           <- 3002L
CPX_PARAM_BARGROWTH           <- 3003L
CPX_PARAM_BAROBJRNG           <- 3004L
CPX_PARAM_BARPSTART           <- 3005L
CPX_PARAM_BARALG              <- 3007L
CPX_PARAM_BARCOLNZ            <- 3009L
CPX_PARAM_BARDISPLAY          <- 3010L
CPX_PARAM_BARITLIM            <- 3012L
CPX_PARAM_BARMAXCOR           <- 3013L
CPX_PARAM_BARORDER            <- 3014L
CPX_PARAM_BARSTARTALG         <- 3017L
CPX_PARAM_BARCROSSALG         <- 3018L
CPX_PARAM_BARQCPEPCOMP        <- 3020L

# Optimizing Problems
CPX_BARORDER_AUTO <- 0L
CPX_BARORDER_AMD  <- 1L
CPX_BARORDER_AMF  <- 2L
CPX_BARORDER_ND   <- 3L


#------------------------------------------------------------------------------#
# File: mipconst.h
# Version 12.3

# MIP emphasis settings
CPX_MIPEMPHASIS_BALANCED     <- 0L
CPX_MIPEMPHASIS_FEASIBILITY  <- 1L
CPX_MIPEMPHASIS_OPTIMALITY   <- 2L
CPX_MIPEMPHASIS_BESTBOUND    <- 3L
CPX_MIPEMPHASIS_HIDDENFEAS   <- 4L

# Values for sostype and branch type
CPX_TYPE_VAR                 <- "0"
CPX_TYPE_SOS1                <- "1"
CPX_TYPE_SOS2                <- "2"
CPX_TYPE_USER                <- "X"
CPX_TYPE_ANY                 <- "A"

# Variable selection values
CPX_VARSEL_MININFEAS      <- -1L
CPX_VARSEL_DEFAULT        <- 0L
CPX_VARSEL_MAXINFEAS      <- 1L
CPX_VARSEL_PSEUDO         <- 2L
CPX_VARSEL_STRONG         <- 3L
CPX_VARSEL_PSEUDOREDUCED  <- 4L

# Node selection values
CPX_NODESEL_DFS           <- 0L
CPX_NODESEL_BESTBOUND     <- 1L
CPX_NODESEL_BESTEST       <- 2L
CPX_NODESEL_BESTEST_ALT   <- 3L

# Values for generated priority order
CPX_MIPORDER_COST                <- 1L
CPX_MIPORDER_BOUNDS              <- 2L
CPX_MIPORDER_SCALEDCOST          <- 3L

# Values for direction array
CPX_BRANCH_GLOBAL                <- 0L
CPX_BRANCH_DOWN                  <- -1L
CPX_BRANCH_UP                    <- 1L

# Values for CPX_PARAM_BRDIR
CPX_BRDIR_DOWN                   <- -1L
CPX_BRDIR_AUTO                   <- 0L
CPX_BRDIR_UP                     <- 1L

# Values for CPX_PARAM_MIPSEARCH
CPX_MIPSEARCH_AUTO         <- 0L
CPX_MIPSEARCH_TRADITIONAL  <- 1L
CPX_MIPSEARCH_DYNAMIC      <- 2L

# Values for CPX_PARAM_MIPKAPPASTATS
CPX_MIPKAPPA_OFF     <- -1L
CPX_MIPKAPPA_AUTO    <- 0L
CPX_MIPKAPPA_SAMPLE  <- 1L
CPX_MIPKAPPA_FULL    <- 2L

# Effort levels for MIP starts
CPX_MIPSTART_AUTO          <- 0L
CPX_MIPSTART_CHECKFEAS     <- 1L
CPX_MIPSTART_SOLVEFIXED    <- 2L
CPX_MIPSTART_SOLVEMIP      <- 3L
CPX_MIPSTART_REPAIR        <- 4L

# MIP Problem status codes
CPXMIP_OPTIMAL               <- 101L
CPXMIP_OPTIMAL_TOL           <- 102L
CPXMIP_INFEASIBLE            <- 103L
CPXMIP_SOL_LIM               <- 104L
CPXMIP_NODE_LIM_FEAS         <- 105L
CPXMIP_NODE_LIM_INFEAS       <- 106L
CPXMIP_TIME_LIM_FEAS         <- 107L
CPXMIP_TIME_LIM_INFEAS       <- 108L
CPXMIP_FAIL_FEAS             <- 109L
CPXMIP_FAIL_INFEAS           <- 110L
CPXMIP_MEM_LIM_FEAS          <- 111L
CPXMIP_MEM_LIM_INFEAS        <- 112L
CPXMIP_ABORT_FEAS            <- 113L
CPXMIP_ABORT_INFEAS          <- 114L
CPXMIP_OPTIMAL_INFEAS        <- 115L
CPXMIP_FAIL_FEAS_NO_TREE     <- 116L
CPXMIP_FAIL_INFEAS_NO_TREE   <- 117L
CPXMIP_UNBOUNDED             <- 118L
CPXMIP_INForUNBD             <- 119L
CPXMIP_FEASIBLE_RELAXED_SUM  <- 120L
CPXMIP_OPTIMAL_RELAXED_SUM   <- 121L
CPXMIP_FEASIBLE_RELAXED_INF  <- 122L
CPXMIP_OPTIMAL_RELAXED_INF   <- 123L
CPXMIP_FEASIBLE_RELAXED_QUAD <- 124L
CPXMIP_OPTIMAL_RELAXED_QUAD  <- 125L
CPXMIP_ABORT_RELAXED         <- 126L
CPXMIP_FEASIBLE              <- 127L
CPXMIP_POPULATESOL_LIM       <- 128L
CPXMIP_OPTIMAL_POPULATED     <- 129L
CPXMIP_OPTIMAL_POPULATED_TOL <- 130L
CPXMIP_DETTIME_LIM_FEAS      <- 131L
CPXMIP_DETTIME_LIM_INFEAS    <- 132L

# Valid purgeable values for adding usercuts and lazyconstraints
CPX_USECUT_FORCE             <- 0L
CPX_USECUT_PURGE             <- 1L
CPX_USECUT_FILTER            <- 2L

# For CPXgetnodeintfeas
CPX_INTEGER_FEASIBLE         <- 0L
CPX_INTEGER_INFEASIBLE       <- 1L
CPX_IMPLIED_INTEGER_FEASIBLE <- 2L

# MIP Parameter numbers
CPX_PARAM_BRDIR               <- 2001L
CPX_PARAM_BTTOL               <- 2002L
CPX_PARAM_CLIQUES             <- 2003L
CPX_PARAM_COEREDIND           <- 2004L
CPX_PARAM_COVERS              <- 2005L
CPX_PARAM_CUTLO               <- 2006L
CPX_PARAM_CUTUP               <- 2007L
CPX_PARAM_EPAGAP              <- 2008L
CPX_PARAM_EPGAP               <- 2009L
CPX_PARAM_EPINT               <- 2010L
CPX_PARAM_MIPDISPLAY          <- 2012L
CPX_PARAM_MIPINTERVAL         <- 2013L
CPX_PARAM_INTSOLLIM           <- 2015L
CPX_PARAM_NODEFILEIND         <- 2016L
CPX_PARAM_NODELIM             <- 2017L
CPX_PARAM_NODESEL             <- 2018L
CPX_PARAM_OBJDIF              <- 2019L
CPX_PARAM_MIPORDIND           <- 2020L
CPX_PARAM_RELOBJDIF           <- 2022L
CPX_PARAM_STARTALG            <- 2025L
CPX_PARAM_SUBALG              <- 2026L
CPX_PARAM_TRELIM              <- 2027L
CPX_PARAM_VARSEL              <- 2028L
CPX_PARAM_BNDSTRENIND         <- 2029L
CPX_PARAM_HEURFREQ            <- 2031L
CPX_PARAM_MIPORDTYPE          <- 2032L
CPX_PARAM_CUTSFACTOR          <- 2033L
CPX_PARAM_RELAXPREIND         <- 2034L
CPX_PARAM_PRESLVND            <- 2037L
CPX_PARAM_BBINTERVAL          <- 2039L
CPX_PARAM_FLOWCOVERS          <- 2040L
CPX_PARAM_IMPLBD              <- 2041L
CPX_PARAM_PROBE               <- 2042L
CPX_PARAM_GUBCOVERS           <- 2044L
CPX_PARAM_STRONGCANDLIM       <- 2045L
CPX_PARAM_STRONGITLIM         <- 2046L
CPX_PARAM_FRACCAND            <- 2048L
CPX_PARAM_FRACCUTS            <- 2049L
CPX_PARAM_FRACPASS            <- 2050L
CPX_PARAM_FLOWPATHS           <- 2051L
CPX_PARAM_MIRCUTS             <- 2052L
CPX_PARAM_DISJCUTS            <- 2053L
CPX_PARAM_AGGCUTLIM           <- 2054L
CPX_PARAM_MIPCBREDLP          <- 2055L
CPX_PARAM_CUTPASS             <- 2056L
CPX_PARAM_MIPEMPHASIS         <- 2058L
CPX_PARAM_SYMMETRY            <- 2059L
CPX_PARAM_DIVETYPE            <- 2060L
CPX_PARAM_RINSHEUR            <- 2061L
CPX_PARAM_SUBMIPNODELIM       <- 2062L
CPX_PARAM_LBHEUR              <- 2063L
CPX_PARAM_REPEATPRESOLVE      <- 2064L
CPX_PARAM_PROBETIME           <- 2065L
CPX_PARAM_POLISHTIME          <- 2066L
CPX_PARAM_REPAIRTRIES         <- 2067L
CPX_PARAM_EPLIN               <- 2068L
CPX_PARAM_EPRELAX             <- 2073L
CPX_PARAM_FPHEUR              <- 2098L
CPX_PARAM_EACHCUTLIM          <- 2102L
CPX_PARAM_SOLNPOOLCAPACITY    <- 2103L
CPX_PARAM_SOLNPOOLREPLACE     <- 2104L
CPX_PARAM_SOLNPOOLGAP         <- 2105L
CPX_PARAM_SOLNPOOLAGAP        <- 2106L
CPX_PARAM_SOLNPOOLINTENSITY   <- 2107L
CPX_PARAM_POPULATELIM         <- 2108L
CPX_PARAM_MIPSEARCH           <- 2109L
CPX_PARAM_MIQCPSTRAT          <- 2110L
CPX_PARAM_ZEROHALFCUTS        <- 2111L
CPX_PARAM_POLISHAFTEREPAGAP   <- 2126L
CPX_PARAM_POLISHAFTEREPGAP    <- 2127L
CPX_PARAM_POLISHAFTERNODE     <- 2128L
CPX_PARAM_POLISHAFTERINTSOL   <- 2129L
CPX_PARAM_POLISHAFTERTIME     <- 2130L
CPX_PARAM_MCFCUTS             <- 2134L
CPX_PARAM_MIPKAPPASTATS       <- 2137L
CPX_PARAM_AUXROOTTHREADS      <- 2139L
CPX_PARAM_INTSOLFILEPREFIX    <- 2143L
CPX_PARAM_PROBEDETTIME        <- 2150L
CPX_PARAM_POLISHAFTERDETTIME  <- 2151L

# Values for CPX_PARAM_SOLNPOOLREPLACE
CPX_SOLNPOOL_FIFO    <- 0L
CPX_SOLNPOOL_OBJ     <- 1L
CPX_SOLNPOOL_DIV     <- 2L

CPX_SOLNPOOL_FILTER_DIVERSITY   <- 1L
CPX_SOLNPOOL_FILTER_RANGE       <- 2L


#------------------------------------------------------------------------------#
# File: gcconst.h
# Version 12.3

CPX_CON_LOWER_BOUND          <- 1L
CPX_CON_UPPER_BOUND          <- 2L
CPX_CON_LINEAR               <- 3L
CPX_CON_QUADRATIC            <- 4L
CPX_CON_SOS                  <- 5L
CPX_CON_INDICATOR            <- 6L

# internal types
CPX_CON_MINEXPR              <- 7L
CPX_CON_MAXEXPR              <- 8L
CPX_CON_PWL                  <- 9L
CPX_CON_ABS                  <- 9L  # same as PWL since using it
CPX_CON_DISJCST              <- 10L
CPX_CON_INDDISJCST           <- 11L
CPX_CON_SETVAR               <- 12L
CPX_CON_SETVARMEMBER         <- 13L
CPX_CON_SETVARCARD           <- 14L
CPX_CON_SETVARSUM            <- 15L
CPX_CON_SETVARMIN            <- 16L
CPX_CON_SETVARMAX            <- 17L
CPX_CON_SETVARSUBSET         <- 18L
CPX_CON_SETVARDOMAIN         <- 19L
CPX_CON_SETVARUNION          <- 20L
CPX_CON_SETVARINTERSECTION   <- 21L
CPX_CON_SETVARNULLINTERSECT  <- 22L
CPX_CON_SETVARINTERSECT      <- 23L
CPX_CON_SETVAREQ             <- 24L
CPX_CON_SETVARNEQ            <- 25L
CPX_CON_SETVARNEQCST         <- 26L
CPX_CON_LAST_CONTYPE         <- 27L


#------------------------------------------------------------------------------#
# File: netconst.h
# Version 12.3

# Network parameters
CPX_PARAM_NETITLIM            <- 5001L
CPX_PARAM_NETEPOPT            <- 5002L
CPX_PARAM_NETEPRHS            <- 5003L
CPX_PARAM_NETPPRIIND          <- 5004L
CPX_PARAM_NETDISPLAY          <- 5005L

# NETOPT display values
CPXNET_NO_DISPLAY_OBJECTIVE <- 0L
CPXNET_TRUE_OBJECTIVE       <- 1L
CPXNET_PENALIZED_OBJECTIVE  <- 2L

# NETOPT pricing parameters
CPXNET_PRICE_AUTO           <- 0L
CPXNET_PRICE_PARTIAL        <- 1L
CPXNET_PRICE_MULT_PART      <- 2L
CPXNET_PRICE_SORT_MULT_PART <- 3L


#------------------------------------------------------------------------------#
# File: qpconst.h
# Version 12.3

# Copying data
CPX_PARAM_QPNZREADLIM         <- 4001L

# presolve
CPX_PARAM_QPMAKEPSDIND        <- 4010L


#------------------------------------------------------------------------------#
# Error codes

# Callable library miscellaneous routines
CPXERR_NEGATIVE_SURPLUS       <- 1207L
CPXERR_NO_SENSIT              <- 1260L

