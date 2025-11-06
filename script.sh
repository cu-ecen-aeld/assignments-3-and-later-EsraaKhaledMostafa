#!/bin/bash

cd /esd/bata_esd2/esrmosp7/EmbeddedLinuxCourse/assignment-3-EsraaKhaledMostafa

echo "=== Step 1: Initialize Git Repository ==="
git init
git branch -M main

echo -e "\n=== Step 2: Add Remote Origin ==="
echo "Enter your GitHub Classroom Assignment 3 repository URL:"
echo "Example: git@github.com:cu-ecen-aeld/assignment-3-EsraaKhaledMostafa.git"
read -p "URL: " REPO_URL

git remote add origin "$REPO_URL"

echo -e "\n=== Step 3: Add Base Repository ==="
git remote add assignments-base git@github.com:cu-ecen-aeld/aesd-assignments.git

echo -e "\n=== Verify Remotes ==="
git remote -v

echo -e "\n=== Step 4: Fetch Base Repository ==="
git fetch assignments-base

echo -e "\n=== Step 5: Merge Assignment 3 Starter Code ==="
git merge assignments-base/assignment3-part-1 --allow-unrelated-histories -m "Merge assignment 3 starter code"

echo -e "\n=== Step 6: Add Submodule ==="
git submodule add https://github.com/cu-ecen-aeld/assignment-autotest.git assignment-autotest

echo -e "\n=== Step 7: Initialize Submodule ==="
git submodule update --init --recursive

echo -e "\n=== Verify Submodule ==="
git submodule status
ls -la assignment-autotest/

echo -e "\n=== Step 8: Stage All Changes ==="
git add .

echo -e "\n=== Step 9: Commit ==="
git commit -m "Initial commit: Add assignment 3 starter code and autotest submodule"

echo -e "\n=== Step 10: Push to GitHub ==="
echo "Ready to push! Run:"
echo "git push -u origin main"
