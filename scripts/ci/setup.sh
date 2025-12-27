# Copyright (c) 2025 CI-Agnostic Pipeline
# SPDX-License-Identifier: MIT
#!/bin/bash
set -euo pipefail

echo "Setting up environment..."

# Detect project type and install dependencies
if [ -f "package.json" ]; then
    echo "Node.js project detected. Installing dependencies..."
    npm install
elif [ -f "requirements.txt" ]; then
    echo "Python project detected. Installing dependencies..."
    pip install -r requirements.txt
elif [ -f "Cargo.toml" ]; then
    echo "Rust project detected. Installing dependencies..."
    cargo fetch
elif [ -f "go.mod" ]; then
    echo "Go project detected. Installing dependencies..."
    go mod download
else
    echo "No recognized project file found. Skipping dependency installation."
fi

echo "Setup complete."
