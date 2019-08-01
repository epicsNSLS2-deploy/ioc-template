# This file contains merlin specific environment variable sets
# That are not covered by unique.cmd. You must edit these values to match
# your Merlin detector setup.

# The name of the drvAsynIPPort for commands
epicsEnvSet("COMMAND_PORT", "$(PORT)cmd")
# The name of the drvAsynIPPort for data
epicsEnvSet("DATA_PORT", "$(PORT)data")
# The IP address of the Merlin Labview system
epicsEnvSet("MERLIN_IP", "164.54.160.214")
# The IP port for the command socket
epicsEnvSet("COMMAND_IPPORT", "6341")
# The IP port for the data socket
epicsEnvSet("DATA_IPPORT",    "6342")
# The model type for this Medipix detector
epicsEnvSet("MODEL", "3")   #0=Merlin, 1=MedipixXBPM, 2=UomXBPM, 3=MerlinQuad