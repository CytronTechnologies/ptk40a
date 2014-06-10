#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-18F4550.mk)" "nbproject/Makefile-local-18F4550.mk"
include nbproject/Makefile-local-18F4550.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=18F4550
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PTK40A_18F_Exam_3.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PTK40A_18F_Exam_3.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/adc.p1 ${OBJECTDIR}/src/18F_Main_E_3.p1 ${OBJECTDIR}/src/seg7.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/src/adc.p1.d ${OBJECTDIR}/src/18F_Main_E_3.p1.d ${OBJECTDIR}/src/seg7.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/adc.p1 ${OBJECTDIR}/src/18F_Main_E_3.p1 ${OBJECTDIR}/src/seg7.p1


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-18F4550.mk dist/${CND_CONF}/${IMAGE_TYPE}/PTK40A_18F_Exam_3.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F4550
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/adc.p1: src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/adc.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=pickit2  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug,9 --addrqual=ignore -P -N255 --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/src/adc.p1  src/adc.c 
	@-${MV} ${OBJECTDIR}/src/adc.d ${OBJECTDIR}/src/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/18F_Main_E_3.p1: src/18F_Main_E_3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/18F_Main_E_3.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=pickit2  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug,9 --addrqual=ignore -P -N255 --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/src/18F_Main_E_3.p1  src/18F_Main_E_3.c 
	@-${MV} ${OBJECTDIR}/src/18F_Main_E_3.d ${OBJECTDIR}/src/18F_Main_E_3.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/18F_Main_E_3.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/seg7.p1: src/seg7.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/seg7.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  -D__DEBUG=1 --debugger=pickit2  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug,9 --addrqual=ignore -P -N255 --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/src/seg7.p1  src/seg7.c 
	@-${MV} ${OBJECTDIR}/src/seg7.d ${OBJECTDIR}/src/seg7.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/seg7.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/src/adc.p1: src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/adc.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug,9 --addrqual=ignore -P -N255 --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/src/adc.p1  src/adc.c 
	@-${MV} ${OBJECTDIR}/src/adc.d ${OBJECTDIR}/src/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/18F_Main_E_3.p1: src/18F_Main_E_3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/18F_Main_E_3.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug,9 --addrqual=ignore -P -N255 --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/src/18F_Main_E_3.p1  src/18F_Main_E_3.c 
	@-${MV} ${OBJECTDIR}/src/18F_Main_E_3.d ${OBJECTDIR}/src/18F_Main_E_3.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/18F_Main_E_3.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/seg7.p1: src/seg7.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	@${RM} ${OBJECTDIR}/src/seg7.p1.d 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G --asmlist  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug,9 --addrqual=ignore -P -N255 --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"  -o${OBJECTDIR}/src/seg7.p1  src/seg7.c 
	@-${MV} ${OBJECTDIR}/src/seg7.d ${OBJECTDIR}/src/seg7.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/seg7.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PTK40A_18F_Exam_3.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G --asmlist -mdist/${CND_CONF}/${IMAGE_TYPE}/PTK40A_18F_Exam_3.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=pickit2  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug,9 --addrqual=ignore -P -N255 --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"   --rom=default,-7dc0-7fff --ram=default,-3f4-3ff,-fdb-fdf,-fe3-fe7,-feb-fef,-fd4-fd4,-ffd-fff  -odist/${CND_CONF}/${IMAGE_TYPE}/PTK40A_18F_Exam_3.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/PTK40A_18F_Exam_3.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PTK40A_18F_Exam_3.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G --asmlist -mdist/${CND_CONF}/${IMAGE_TYPE}/PTK40A_18F_Exam_3.${IMAGE_TYPE}.map  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,-asmfile,+speed,-space,-debug,9 --addrqual=ignore -P -N255 --warn=0 --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,+plib "--errformat=%%f:%%l: error: %%s" "--warnformat=%%f:%%l: warning: %%s" "--msgformat=%%f:%%l: advisory: %%s"   -odist/${CND_CONF}/${IMAGE_TYPE}/PTK40A_18F_Exam_3.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/18F4550
	${RM} -r dist/18F4550

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
