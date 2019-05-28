#!/bin/bash

#
# Script that cleans up IOC directory after ioc-template has been cloned
#
# Author: Jakub Wlodek
#

rm -rf dependancyScripts/
rm -rf startupScripts/
rm -rf logs/
rm README.md
mkdir autosave
rm *OLD*
rm cleanup.sh
