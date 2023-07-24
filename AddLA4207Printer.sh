#!/bin/bash

# Variables
printerName="LA4207Printer"
printerAddress="10.32.180.109"
printerLocation="LA4207"
printerDescription="LA4207Printer"
printerModel="HP LaserJet Series PCL 4/5"

# Path to the PPD file in CUPS directory
ppdFilePath="drv:///sample.drv/laserjet.ppd"

# Path to check
pharosPath="/Library/Application Support/Pharos"

# Check if Pharos directory exists
if [ ! -d "$pharosPath" ]; then
    echo "Directory $pharosPath not found. Please make sure the Pharos software is properly installed."
    exit 1
fi

# Add Printer
lpadmin -p "$printerName" -E -v popup://"$printerAddress"/"$printerName" -m "$ppdFilePath" -D "$printerDescription" -L "$printerLocation"

# Set as Default
lpoptions -d "$printerName"

echo "Printer $printerName has been added and set as default."
