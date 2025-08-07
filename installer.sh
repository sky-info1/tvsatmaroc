#!/bin/sh

# ------------------------------
# ⚙ TVSATMAROC Plugin Installer (Dynamic Version & URL)
# ------------------------------

PLUGIN_NAME="TVSATMAROC"
PLUGIN_VERSION="1.81"

clear
echo ""
echo "┌────────────────────────────────────────────────────┐"
echo "│           ⚙ $PLUGIN_NAME Plugin Installer ⚙         │"
echo "├────────────────────────────────────────────────────┤"
echo "│ This script will install the $PLUGIN_NAME plugin     │"
echo "│ on your Enigma2-based receiver.                    │"
echo "│                                                    │"
echo "│ Version   : $PLUGIN_VERSION                         │"
echo "│ Developer : Youness Safi                            │"
echo "└────────────────────────────────────────────────────┘"
echo ""

# === Configuration ===
ZIP_PATH="/tmp/${PLUGIN_NAME}.zip"
EXTRACT_DIR="/tmp/${PLUGIN_NAME}"
INSTALL_DIR="/usr/lib/enigma2/python/Plugins/Extensions"

# رابط RAW مباشر من GitHub
PLUGIN_URL="https://raw.githubusercontent.com/sky-info1/tvsatmaroc/main/${PLUGIN_NAME}_V${PLUGIN_VERSION}.zip"

# === Step 1: Download ===
echo "[1/6] 🔽 Downloading plugin package from:"
echo "    $PLUGIN_URL"
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
rm -rf "$INSTALL_DIR/$PLUGIN_NAME"

# === Step 4: Install ===
echo "[4/6] 🚚 Installing plugin..."
cp -r "$EXTRACT_DIR/$PLUGIN_NAME" "$INSTALL_DIR"
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
echo "🎉 The plugin \"$PLUGIN_NAME\" (v$PLUGIN_VERSION) has been installed successfully."
echo "🔁 Enigma2 will restart in 5 seconds to activate the plugin..."
sleep 5
echo "♻️ Restarting Enigma2 now..."
init 4 && sleep 2 && init 3
