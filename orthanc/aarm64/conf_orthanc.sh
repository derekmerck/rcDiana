#!/bin/bash

echo "Setting up access to $RESIN_DEVICE_NAME_AT_INIT in orthanc.json from environment"
sed -i 's/"RemoteAccessAllowed" : false,/"RemoteAccessAllowed" : true,/' /etc/orthanc/orthanc.json
sed -i 's/"AuthenticationEnabled" : false,/"AuthenticationEnabled" : true,/' /etc/orthanc/orthanc.json
sed -i "s$// \"alice\" : \"alicePassword\"$\"diana\" : \"$ORTHANC_PASSWORD\"$" /etc/orthanc/orthanc.json
sed -i 's/"DicomAet" : "ORTHANC",/"DicomAet" : "RCDIANA",/' /etc/orthanc/orthanc.json
sed -i "s$\"Name\" : \"Orthanc\",$\"Name\" : \"$RESIN_DEVICE_NAME_AT_INIT\",$" /etc/orthanc/orthanc.json

service orthanc start
