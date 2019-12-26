# ioc-template simple

A simple template used for installing areaDetector IOCs with NSLS2 prebuilt binary bundles.

### Included components

Component   |       Description    |  Location
------------|----------------------|----
unique.cmd | The IOC specific variables | /epics/iocs/cam-bpm1
envPaths | Relative paths to EPICS components | /epics/iocs/cam-bpm1 (but prefer central location)
config | A config file for procServer | /epics/iocs/cam-bpm1
st.cmd | The ioc starutp | /epics/iocs/cam-bpm1

### Usage - manual

* Edit `st.cmd` and confirm that it is pointing to the correct binary, in the first line of the `st.cmd`.
* Edit the `unique.cmd` file, setting relevant environment variables to match with your IOC.
* Edit envPaths to point to correct binaries, libraries, etc.
* Start the IOC by running `./st.cmd`, or `start_epics`.
