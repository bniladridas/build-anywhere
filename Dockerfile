# Copyright (c) 2025 CI-Agnostic Pipeline
# SPDX-License-Identifier: MIT

FROM node:20

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

CMD ["npm", "test"]
