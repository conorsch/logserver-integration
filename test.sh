#!/bin/bash
set -e
set -u

echo "Installing latest roles..."
ansible-galaxy install --force -r requirements.yml

echo "Running molecule tests..."
molecule test --destroy never
