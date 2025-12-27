# Copyright (c) 2025 CI-Agnostic Pipeline
# SPDX-License-Identifier: MIT
#!/bin/bash
set -euo pipefail

echo "Running tests..."

# Detect project type and run tests
if [ -f "package.json" ]; then
    echo "Running Node.js tests..."
    npm test
elif [ -f "requirements.txt" ] || [ -f "setup.py" ] || [ -f "pyproject.toml" ]; then
    echo "Running Python tests..."
    python -m pytest
elif [ -f "Cargo.toml" ]; then
    echo "Running Rust tests..."
    cargo test
elif [ -f "go.mod" ]; then
    echo "Running Go tests..."
    go test ./...
else
    echo "No recognized test runner found. Skipping tests."
fi

echo "Tests complete."
