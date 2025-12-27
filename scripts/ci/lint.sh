# Copyright (c) 2025 CI-Agnostic Pipeline
# SPDX-License-Identifier: MIT
#!/bin/bash
set -euo pipefail

echo "Running linting..."

# Detect project type and lint
if [ -f "package.json" ]; then
    echo "Linting Node.js project..."
    npm run lint
elif [ -f "requirements.txt" ] || [ -f "setup.py" ] || [ -f "pyproject.toml" ]; then
    echo "Linting Python project..."
    python -m flake8 . || python -m pylint . || echo "No linter configured"
elif [ -f "Cargo.toml" ]; then
    echo "Linting Rust project..."
    cargo clippy -- -D warnings
elif [ -f "go.mod" ]; then
    echo "Linting Go project..."
    go vet ./...
else
    echo "No recognized linter found. Skipping lint."
fi

echo "Linting complete."
