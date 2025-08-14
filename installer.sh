#!/bin/sh

# ------------------------------
# ⚙ TVSATMAROC Plugin Installer (Updated)
# ------------------------------

PLUGIN_NAME="TVSATMAROC"
PLUGIN_VERSION="1.90"

clear
echo ""
echo "┌────────────────────────────────────────────────────┐"
echo "│         ⚙ TVSATMAROC Plugin Installer ⚙            │"
echo "├────────────────────────────────────────────────────┤"
echo "│ This script will install the TVSATMAROC plugin     │"
echo "│ on your Enigma2-based receiver.                    │"
echo "│                                                    │"
echo "│ Version   : 1.90                                   │"
echo "│ Developer : Youness Safi                           │"
echo "└────────────────────────────────────────────────────┘"
echo ""

# === Configuration ===
ZIP_PATH="/tmp/TVSATMAROC.zip"
EXTRACT_DIR="/tmp/TVSATMAROC"
INSTALL_DIR="/usr/lib/enigma2/python/Plugins/Extensions"

PLUGIN_URL="https://raw.githubusercontent.com/sky-info1/tvsatmaroc/main/TVSATMAROC.zip"

# === Step 1: Download ===
echo "[1/4] 🔽 Downloading plugin package from:"
echo "    https://raw.githubusercontent.com/sky-info1/tvsatmaroc/main/TVSATMAROC.zip"
cd /tmp || { echo "❌ Cannot change directory to /tmp. Aborting."; exit 1; }
wget "$PLUGIN_URL" -O "$ZIP_PATH"
if [ $? -ne 0 ]; then
    echo "❌ Failed to download the plugin. Please check your connection or URL."
    exit 1
fi

# === Step 2: Extract & Install ===
echo "[2/4] 📦 Extracting files and installing..."
unzip -o "$ZIP_PATH" -d "$EXTRACT_DIR" >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Extraction failed. The ZIP file may be corrupted."
    exit 1
fi

rm -rf "$INSTALL_DIR/TVSATMAROC"
cp -r "$EXTRACT_DIR/TVSATMAROC" "$INSTALL_DIR"
if [ [ $? -ne 0 ]; then
    echo "❌ Failed to copy plugin to Enigma2 plugins directory."
    exit 1
fi

# === Step 3: Cleanup ===
echo "[3/4] 🧹 Cleaning up..."
rm -rf "$EXTRACT_DIR"
rm -f "$ZIP_PATH"

# === Step 4: Final Message ===
echo "[4/4] ✅ Installation complete!"
echo ""
echo "🎉 The plugin \"TVSATMAROC\" (v1.90) has been installed successfully."

# === Subscription info ===
echo ""
echo "📞 للإشتراك المرجو التواصل معنا عبر الواتس آب أو رقم الهاتف:"
echo "    +212648374758"
echo ""

exit 0
