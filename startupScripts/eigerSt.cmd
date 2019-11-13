#!../../bin/linux-x86_64/eigerDetectorApp

< unique.cmd

< envPaths
errlogInit(20000)

dbLoadDatabase("$(ADEiger)/iocs/eigerIOC/dbd/eigerDetectorApp.dbd")
eigerDetectorApp_registerRecordDeviceDriver(pdbbase)

epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(ADCORE)/db")
eigerDetectorConfig("$(PORT)", "$(CAM-CONNECT)", 0, 0)
dbLoadRecords("$(ADEIGER)/db/eiger.template", "P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")

# Debug
#asynSetTraceMask("$(PORT)", 0, 0x11)

# Create a standard arrays plugin
NDStdArraysConfigure("Image1", 5, 0, "$(PORT)", 0, 0)
dbLoadRecords("$(ADCORE)/db/NDStdArrays.template", "P=$(PREFIX),R=image1:,PORT=Image1,ADDR=0,TIMEOUT=1,TYPE=Int32,FTVL=LONG,NELEMENTS=1096950, NDARRAY_PORT=$(PORT)")

NDStdArraysConfigure("Image2", 5, 0, "$(PORT)", 1, 0)
dbLoadRecords("$(ADCORE)/db/NDStdArrays.template", "P=$(PREFIX),R=image2:,PORT=Image2,ADDR=0,TIMEOUT=1,TYPE=Int32,FTVL=LONG,NELEMENTS=1096950, NDARRAY_PORT=$(PORT)")

# Load all other plugins using commonPlugins.cmd
< $(ADCORE)/iocBoot/commonPlugins.cmd
set_requestfile_path("$(ADEIGER)/eigerApp/Db")

iocInit()

# Avoid deluge of messages when debugging
#dbpf $(PREFIX)cam1:PoolUsedMem.SCAN Passive

# save things every thirty seconds
create_monitor_set("auto_settings.req", 30, "P=$(PREFIX)")
