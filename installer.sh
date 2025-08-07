#!/bin/sh
echo "Installing TVSATMAROC plugin..."
cd /tmp
wget https://github.com/sky-info1/tvsatmaroc/raw/main/TVSATMAROC_V1.70.zip -O tvsatmaroc.zip
unzip -o tvsatmaroc.zip -d /tmp/tvsatmaroc
cp -r /tmp/tvsatmaroc/TVSATMAROC /usr/lib/enigma2/python/Plugins/Extensions/
rm -rf /tmp/tvsatmaroc
rm -f /tmp/tvsatmaroc.zip
echo "Done. Restart Enigma2 to activate the plugin."
