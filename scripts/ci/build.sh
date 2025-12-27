# Copyright (c) 2025 CI-Agnostic Pipeline
# SPDX-License-Identifier: MIT
#!/bin/bash
set -euo pipefail

echo "Building project..."

# Detect project type and build
if [ -f "package.json" ]; then
    echo "Building Node.js project..."
    npm run build
elif [ -f "requirements.txt" ] || [ -f "setup.py" ] || [ -f "pyproject.toml" ]; then
    echo "Python project - no build step defined..."
    # Add build commands if needed
elif [ -f "Cargo.toml" ]; then
    echo "Building Rust project..."
    cargo build --release
elif [ -f "go.mod" ]; then
    echo "Building Go project..."
    go build ./...
else
    echo "No recognized build system found. Skipping build."
fi

echo "Build complete."
