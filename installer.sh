#!/bin/sh

# ------------------------------
# ⚙ TVSATMAROC Plugin Installer (Fixed Info)
# ------------------------------

PLUGIN_NAME="TVSATMAROC"
PLUGIN_VERSION="1.81"

clear
echo ""
echo "┌────────────────────────────────────────────────────┐"
echo "│           ⚙ TVSATMAROC Plugin Installer ⚙         │"
echo "├────────────────────────────────────────────────────┤"
echo "│ This script will install the TVSATMAROC plugin     │"
echo "│ on your Enigma2-based receiver.                     │"
echo "│                                                    │"
echo "│ Version   : 1.81                                    │"
echo "│ Developer : Youness Safi                            │"
echo "└────────────────────────────────────────────────────┘"
echo ""

# === Configuration ===
ZIP_PATH="/tmp/TVSATMAROC.zip"
EXTRACT_DIR="/tmp/TVSATMAROC"
INSTALL_DIR="/usr/lib/enigma2/python/Plugins/Extensions"

PLUGIN_URL="https://raw.githubusercontent.com/sky-info1/tvsatmaroc/main/TVSATMAROC_V1.81.zip"

# === Step 1: Download ===
echo "[1/6] 🔽 Downloading plugin package from:"
echo "    https://raw.githubusercontent.com/sky-info1/tvsatmaroc/main/TVSATMAROC_V1.81.zip"
cd /tmp || { echo "❌ Cannot change directory to /tmp. Aborting."; exit 1; }
wget "$PLUGIN_URL" -O "$ZIP_PATH"
if [ $? -ne 0 ]; then
    echo "❌ Failed to download the plugin. Please check your connection or URL."
    exit 1
fi

# === Step 2: Extract ===
echo "[2/6] 📦 Extracting files..."
unzip -o "$ZIP_PATH" -d "$EXTRACT_DIR" >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Extraction failed. The ZIP file may be corrupted."
    exit 1
fi

# === Step 3: Remove old version if exists ===
echo "[3/6] 🧼 Removing any previous version..."
rm -rf "$INSTALL_DIR/TVSATMAROC"

# === Step 4: Install ===
echo "[4/6] 🚚 Installing plugin..."
cp -r "$EXTRACT_DIR/TVSATMAROC" "$INSTALL_DIR"
if [ $? -ne 0 ]; then
    echo "❌ Failed to copy plugin to Enigma2 plugins directory."
    exit 1
fi

# === Step 5: Cleanup ===
echo "[5/6] 🧹 Cleaning up..."
rm -rf "$EXTRACT_DIR"
rm -f "$ZIP_PATH"

# === Step 6: Restart Enigma2 ===
echo "[6/6] ✅ Installation complete!"
echo ""
echo "🎉 The plugin \"TVSATMAROC\" (v1.81) has been installed successfully."
echo "🔁 Enigma2 will restart in 5 seconds to activate the plugin..."
sleep 5
echo "♻️ Restarting Enigma2 now..."
init 4 && sleep 2 && init 3

# === Subscription info ===
echo ""
echo "📞 للإشتراك المرجو التواصل معنا عبر الواتس آب أو رقم الهاتف:"
echo "    0648374758"
echo ""
