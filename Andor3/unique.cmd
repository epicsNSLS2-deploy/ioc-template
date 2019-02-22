# ###############################
# Specific to camera		#
# Date:   2018-08-22		#
# Author: K. Gofron		#	
# ###############################

# ######################################################################################
# NELEMENTS = 3*(X x Y)=1360x1024x3=4177920, which is the number of pixels in RGB images from the GC-1380C color camera. 
#
# CAMERA		  (X x Y)     =	NELMT;	 3*NELMT;     MAX_ARRAY_16b;  MAX_ARRAY_24b
#Prosilica GC1290/GT1290: 1280 * 960  = 1228800; 3686400      2457600 Bytes   3686400
#Prosilica Mako G-125B:   1292 * 964  = 1245488; 3736464      2490976 Bytes   3736464
#Prosilica GX1920:        1936 * 1456 = 2818816; 8456448      5637632 Bytes   8456448
#Prosilica GC-1380:       1360 * 1024 = 1392640; 4177920      2785280 Bytes   4177920
# #######################################################################################

#10.10.1.23: 00-0f-31-4c-9f-3b 	50-0503338399 - Manta_G-125B - 	  Unique ID = 5021499	1292x964=1245488   Mono16=2490976 Bytes WBS
# Andor Neo uses Camera Link with fiber extender

epicsEnvSet("ENGINEER",                 "K. Gofron X5283")
epicsEnvSet("LOCATION",                 "18IDB")
epicsEnvSet("PORT",                     "ANDOR")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",  "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",       "10.18.0.255")
epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES", "60000000")

#epicsEnvSet("CAM-IP",                   "10.18.1.41")
#epicsEnvSet("UID-NUM",                 "5021499")
epicsEnvSet("PREFIX",                   "XF:18IDB-BI{Det:Neo}")
epicsEnvSet("CTPREFIX",                 "XF:18IDB-BI{Det:Neo}")
epicsEnvSet("HOSTNAME",                 "xf18idb-ioc1")
epicsEnvSet("IOCNAME",                  "camb1")

epicsEnvSet("QSIZE",                    "21")
epicsEnvSet("NCHANS",                   "2048")
epicsEnvSet("HIST_SIZE",                "4096")
epicsEnvSet("XSIZE",                    "2560")
epicsEnvSet("YSIZE",                    "2160")
epicsEnvSet("NELMT",                    "5529600")
epicsEnvSet("NDTYPE",                   "Int16")  #'Int8' (8bit B/W, Color) | 'Int16' (16bit B/W)
epicsEnvSet("NDFTVL",                   "SHORT") #'UCHAR' (8bit B/W, Color) | 'SHORT' (16bit B/W)
epicsEnvSet("CBUFFS",                   "500")

# The ANDOR camera number in the system
epicsEnvSet("CAMERA", "0")
