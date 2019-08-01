#!/epics/Deb8/areaDetector/ADLambda/iocs/LambdaIOC/bin/linux-x86_64/LambdaApp

< unique.cmd
errlogInit(20000)

< envPaths


dbLoadDatabase("$(ADLAMBDA)/iocs/LambdaIOC/dbd/LambdaApp.dbd")
LambdaApp_registerRecordDeviceDriver(pdbbase) 


# This is for a
#/** Configuration command for Lambda driver; creates a new ADLambda object.
# * \param[in] portName The name of the asyn port driver to be created.
# * \param[in] configPath to the config files.
# * \param[in] maxBuffers The maximum number of NDArray buffers that the
# *            NDArrayPool for this driver is
# *            allowed to allocate. Set this to -1 to allow an unlimited number
# *            of buffers.
# * \param[in] maxMemory The maximum amount of memory that the NDArrayPool for
# *            this driver is allowed to allocate. Set this to -1 to allow an
# *            unlimited amount of memory.
# * \param[in] priority The thread priority for the asyn port driver thread if
# *            ASYN_CANBLOCK is set in asynFlags.
# * \param[in] stackSize The stack size for the asyn port driver thread if
# *            ASYN_CANBLOCK is set in asynFlags.
# */
# config directory contains configuration files defined Globals.h, IP addresses, gains, and Medapix3 chip parameters
#LambdaConfig(const char *portName, const char* configPath, int maxBuffers, size_t maxMemory, int priority, int stackSize) {

#LambdaConfig("$(PORT)", "/opt/xsp/config",  0, 0, 0, 0)
LambdaConfig("$(PORT)", "$(CAM-CONNECT)",  0, 0, 0, 0)
epicsThreadSleep(2)

asynSetTraceIOMask($(PORT), 0, 2)
#asynSetTraceMask($(PORT),0,0xff)

# Load ADCore and Lambda records
dbLoadRecords("$(ADCORE)/db/ADBase.template", "P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")
dbLoadRecords("$(ADLAMBDA)/db/ADLambda.template","P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")

#
# Create a standard arrays plugin, set it to get data from Driver.
#int NDStdArraysConfigure(const char *portName, int queueSize, int blockingCallbacks, const char *NDArrayPort, int NDArrayAddr, int maxBuffers, size_t maxMemory,
#                          int priority, int stackSize, int maxThreads)
NDStdArraysConfigure("Image1", 3, 0, "$(PORT)", 0)
#dbLoadRecords("$(ADCORE)/db/NDPluginBase.template","P=$(PREFIX),R=image1:,PORT=Image1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=$(PORT),NDARRAY_ADDR=0")
#dbLoadRecords("$(ADCORE)/db/NDStdArrays.template", "P=$(PREFIX),R=image1:,PORT=Image1,ADDR=0,TIMEOUT=1,TYPE=Int16,SIZE=16,FTVL=SHORT,NELEMENTS=802896")
dbLoadRecords("$(ADCORE)/db/NDStdArrays.template", "P=$(PREFIX),R=image1:,PORT=Image1,ADDR=0,NDARRAY_PORT=$(PORT),TIMEOUT=1,TYPE=Int16,FTVL=SHORT,NELEMENTS=1000000")


# Load all other plugins using commonPlugins.cmd
< $(ADCORE)/iocBoot/commonPlugins.cmd

set_requestfile_path("$(ADLAMBDA)/LambdaApp/Db")

#asynSetTraceMask($(PORT),0,0x09)
#asynSetTraceMask($(PORT),0,0x11)
iocInit()

# save things every thirty seconds
create_monitor_set("auto_settings.req", 30, "P=$(PREFIX)")

