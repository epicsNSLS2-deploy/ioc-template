#!/epics/support/areaDetector/ADURL/iocs/urlIOC/bin/linux-x86_64/URLDriverApp

< unique.cmd
< envPaths

errlogInit(20000)

dbLoadDatabase("$(ADURL)/iocs/urlIOC/dbd/URLDriverApp.dbd")
URLDriverApp_registerRecordDeviceDriver(pdbbase) 

# The search path for database files
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(ADCORE)/db")

# Create a URL driver
# URLDriverConfig(const char *portName, int maxBuffers, size_t maxMemory, 
#                 int priority, int stackSize)
URLDriverConfig("$(PORT)", 0, 0)
dbLoadRecords("$(ADURL)/db/URLDriver.template","P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")

# Create a standard arrays plugin.
NDStdArraysConfigure("Image1", 3, 0, "$(PORT)", 0)

# This creates a waveform large enough for 2048x2048x3 (e.g. RGB color) arrays.
# This waveform only allows transporting 8-bit images
#dbLoadRecords("$(ADCORE)/db/NDStdArrays.template", "P=$(PREFIX),R=image1:,PORT=Image1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=$(PORT),TYPE=Int8,FTVL=UCHAR,NELEMENTS=12582912")
# This waveform allows transporting 16-bit images
dbLoadRecords("$(ADCORE)/db/NDStdArrays.template", "P=$(PREFIX),R=image1:,PORT=Image1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=$(PORT),TYPE=Int16,FTVL=SHORT,NELEMENTS=12582912")

# Load all other plugins using commonPlugins.cmd
< $(ADCORE)/iocBoot/commonPlugins.cmd
set_requestfile_path("$(ADURL)/urlApp/Db")

asynSetTraceIOMask("$(PORT)",0,2)
#asynSetTraceMask("$(PORT)",0,255)

iocInit()

# save things every thirty seconds
create_monitor_set("auto_settings.req", 30, "P=$(PREFIX)")
