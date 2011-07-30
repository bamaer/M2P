#!/bin/bash

## #####################################################################
## m2p.sh 
## #####################################################################
## This script serves as a wrapper to import a Pentaho Kettle repository 
## from an export file. 
## Parameters are: 
##   1) kettle installation directory 
##   2) repository name to import into
##   3) repository username 
##   4) repository password. Caution, this might be ugly. 
##   5) repository folder to import into. 
##   6) temporary folder to store the export file to. We may not have 
##         the rights to create files/folders in the PDI repository. 
## All parameters are mandatory here, but may be optional (= given 
## defaults) in the Kettle job that calls this script.   
##
## #####################################################################
## File History
## #####################################################################
## Author             Date        Comment 
## #####################################################################
## Bart Maertens      25/07/2011  Initial version. 
## #####################################################################


if [ $# -ne 8 ] ; then
  echo "usage: ./m2p.sh <PDI_DIR> <REPO_NAME> <REPO_USER> <REPO_PASS> <REPO_DIR> <REPO_EXPORT_FILE> <COMMENT> <RULES_FILE>"
  echo "quitting..."
  exit 1 
fi

echo "############################################################"
echo "RULES_FILE: " $8
echo "############################################################"




echo "Changing to PDI directory " $1
cd $1

echo "Performing import: " 
./import.sh -rep=$2 -user=$3 -pass=$4 -dir="$5" -file="$6"/export.xml -replace=true -comment="$7" -rules="$8"



