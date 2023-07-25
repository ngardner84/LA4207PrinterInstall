#!/bin/bash

# Variables
printerLocation="LA4207"
printerDescription="Pharos Printer"
printerModel="HP LaserJet Series PCL 4/5"

# Path to the PPD file in CUPS directory
ppdFilePath="drv:///sample.drv/laserjet.ppd"

# Path to check
pharosPath="/Library/Application Support/Pharos"

# Check if Pharos directory exists
if [ ! -d "$pharosPath" ]; then
    echo "Directory $pharosPath not found. Please make sure the Pharos software is properly installed."
    exit 1
else
    echo "Pharos software found. Continuing with printer installation..."
fi

# Check the input parameter
if [ "$1" == "1" ]; then
    printerName="LA4207Printer"
    printerAddress="10.32.180.109"
elif [ "$1" == "2" ]; then
    printerName="LA4208Printer"
    printerAddress="10.32.180.110"
elif [ "$1" == "3" ]; then
    printerName="LA4209Printer"
    printerAddress="10.32.180.111"
else
    echo "Invalid printer selection. Please use 1, 2, or 3."
    exit 1
fi

# Add Printer
lpadmin -p "$printerName" -E -v popup://"$printerAddress"/"$printerName" -m "$ppdFilePath" -D "$printerDescription" -L "$printerLocation"

# Set as Default
lpoptions -d "$printerName"

echo "Printer $printerName has been added and set as default."
