#!/bin/sh
echo "Installing TVSATMAROC plugin..."
cd /tmp
wget https://github.com/sky-info1/tvsatmaroc/raw/main/TVSATMAROC_V1.70.zip
unzip -o TVSATMAROC_V1.70.zip -d /
rm -f TVSATMAROC_V1.70.zip
echo "Done. Restart Enigma2 to activate the plugin."