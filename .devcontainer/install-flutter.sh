#!/usr/bin/env bash
set -e

echo "Installing Flutter SDK (stable channel)..."
git clone --depth 1 https://github.com/flutter/flutter.git -b stable /opt/flutter
echo 'export PATH="$PATH:/opt/flutter/bin"' >> /home/vscode/.bashrc

export PATH="$PATH:/opt/flutter/bin"

flutter precache
flutter config --no-analytics

echo "Flutter SDK installed. Run 'flutter doctor' to verify."
