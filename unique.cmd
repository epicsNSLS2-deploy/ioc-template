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

#10.10.1.85: 00-0f-31-02-18-04	02-2623A-07000  GT3300C      137220	OnAxis  xf10idd-cam5

epicsEnvSet("SUPPORT_DIR", "/epics/prod/Deb7/R3-4")

epicsEnvSet("ENGINEER",                 "K. Gofron X5283")
epicsEnvSet("LOCATION",                 "10IDD")
epicsEnvSet("PORT",                     "CAM")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST",  "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST",       "10.10.0.255")
epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES", "6000000")

epicsEnvSet("CAM-IP",                   "10.10.1.91")
#epicsEnvSet("UID-NUM",                 "137220")
epicsEnvSet("PREFIX",                   "XF:10IDC-BI{GC1380-Cam:1}")
epicsEnvSet("CTPREFIX",                 "XF:10IDD-BI{GC1380-Cam:1}")
epicsEnvSet("HOSTNAME",                 "xf10idd-ioc1")
epicsEnvSet("IOCNAME",                  "cam-gc1380")

epicsEnvSet("QSIZE",                    "20")
epicsEnvSet("NCHANS",                   "2048")
epicsEnvSet("HIST_SIZE",                "4096")
epicsEnvSet("XSIZE",                    "1360")
epicsEnvSet("YSIZE",                    "1024")
epicsEnvSet("NELMT",                    "4177920")
epicsEnvSet("NDTYPE",                   "Int16")  #'Int8' (8bit B/W, Color) | 'Int16' (16bit B/W)
epicsEnvSet("NDFTVL",                   "SHORT") #'UCHAR' (8bit B/W, Color) | 'SHORT' (16bit B/W)
epicsEnvSet("CBUFFS",                   "500")
