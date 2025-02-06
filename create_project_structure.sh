#!/bin/bash

# Project root directory
PROJECT_NAME="hipaa-chatbot"

# Function to create a directory if it doesn't exist
create_directory() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
    echo "Created directory: $1"
  else
    echo "Directory already exists: $1"
  fi
}

# Function to create a file if it doesn't exist
create_file() {
  if [ ! -f "$1" ]; then
    touch "$1"
    echo "Created file: $1"
  else
    echo "File already exists: $1"
  fi
}

# Create project structure
create_directory "$PROJECT_NAME"

# Backend structure
create_directory "$PROJECT_NAME/backend/src/utils"
create_directory "$PROJECT_NAME/backend/tests"

create_file "$PROJECT_NAME/backend/src/app.py"
create_file "$PROJECT_NAME/backend/src/phi_detection.py"
create_file "$PROJECT_NAME/backend/src/response_generator.py"
create_file "$PROJECT_NAME/backend/src/utils/logger.py"
create_file "$PROJECT_NAME/backend/src/utils/encryption.py"
create_file "$PROJECT_NAME/backend/tests/test_phi_detection.py"
create_file "$PROJECT_NAME/backend/tests/test_app.py"

if [ ! -f "$PROJECT_NAME/backend/requirements.txt" ]; then
  echo "boto3\nFlask\npytest" > "$PROJECT_NAME/backend/requirements.txt"
  echo "Created file with content: $PROJECT_NAME/backend/requirements.txt"
else
  echo "File already exists: $PROJECT_NAME/backend/requirements.txt"
fi

if [ ! -f "$PROJECT_NAME/backend/.env.example" ]; then
  echo "AWS_REGION=us-east-1\nAWS_ACCESS_KEY_ID=your-access-key\nAWS_SECRET_ACCESS_KEY=your-secret-key" > "$PROJECT_NAME/backend/.env.example"
  echo "Created file with content: $PROJECT_NAME/backend/.env.example"
else
  echo "File already exists: $PROJECT_NAME/backend/.env.example"
fi

# Frontend structure
create_directory "$PROJECT_NAME/frontend/public"
create_directory "$PROJECT_NAME/frontend/src"

create_file "$PROJECT_NAME/frontend/public/index.html"
create_file "$PROJECT_NAME/frontend/src/App.js"
create_file "$PROJECT_NAME/frontend/src/api.js"
create_file "$PROJECT_NAME/frontend/src/styles.css"

if [ ! -f "$PROJECT_NAME/frontend/package.json" ]; then
  echo "{\n  \"name\": \"hipaa-chatbot-frontend\",\n  \"version\": \"1.0.0\",\n  \"dependencies\": {\n    \"axios\": \"^1.0.0\"\n  }\n}" > "$PROJECT_NAME/frontend/package.json"
  echo "Created file with content: $PROJECT_NAME/frontend/package.json"
else
  echo "File already exists: $PROJECT_NAME/frontend/package.json"
fi

# Infrastructure structure
create_directory "$PROJECT_NAME/infrastructure/terraform"
create_directory "$PROJECT_NAME/infrastructure/ci-cd"

create_file "$PROJECT_NAME/infrastructure/terraform/main.tf"
create_file "$PROJECT_NAME/infrastructure/terraform/variables.tf"
create_file "$PROJECT_NAME/infrastructure/ci-cd/github-actions.yaml"

# Documentation structure
create_directory "$PROJECT_NAME/docs"

create_file "$PROJECT_NAME/docs/README.md"
create_file "$PROJECT_NAME/docs/COMPLIANCE.md"

# Root-level files
if [ ! -f "$PROJECT_NAME/.gitignore" ]; then
  echo "*.env" > "$PROJECT_NAME/.gitignore"
  echo "Created file with content: $PROJECT_NAME/.gitignore"
else
  echo "File already exists: $PROJECT_NAME/.gitignore"
fi

create_file "$PROJECT_NAME/LICENSE"

if [ ! -f "$PROJECT_NAME/SECURITY.md" ]; then
cat <<EOL > $PROJECT_NAME/SECURITY.md
# Security Policies

This document outlines security policies and best practices for the HIPAA-compliant chatbot project.
EOL
  echo "Created file with content: $PROJECT_NAME/SECURITY.md"
else
  echo "File already exists: $PROJECT_NAME/SECURITY.md"
fi

# Success message
echo "Project structure for '$PROJECT_NAME' created successfully!"
