# Copyright (c) 2025 CI-Agnostic Pipeline
# SPDX-License-Identifier: MIT

.PHONY: ci setup test build lint clean

ci: setup test build lint

setup:
	./scripts/ci/setup.sh

test:
	./scripts/ci/test.sh

build:
	./scripts/ci/build.sh

lint:
	./scripts/ci/lint.sh

clean:
	rm -rf node_modules dist build
