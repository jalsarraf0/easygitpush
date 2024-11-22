#!/bin/bash

# Script to automate git push to a GitHub repository

# Function to display help (man page)
man_page() {
    echo "NAME
       easypush.sh - A script to automate Git operations

SYNOPSIS
       ./easypush.sh [OPTIONS] [COMMIT_MESSAGE] [BRANCH_NAME]

DESCRIPTION
       Automates common Git operations such as pulling, staging, committing, and pushing.

       OPTIONS:
         -h          Display this help message (man page)
         -p          Pull the latest changes from the remote repository
         -s          Stage all changes
         -c          Commit changes (requires a commit message)
         -u          Push changes to the specified branch (default: main)
         -a          Perform all operations (pull, stage, commit, and push)
         
       ARGUMENTS:
         COMMIT_MESSAGE: A meaningful commit message (required for -c or -a).
         BRANCH_NAME: The branch to push changes to (default: main).

EXAMPLES:
       1. Display help:
          ./easypush.sh -h

       2. Pull latest changes:
          ./easypush.sh -p

       3. Stage changes and commit with a message:
          ./easypush.sh -s -c \"Fixing a bug\"

       4. Perform all operations and push to 'dev' branch:
          ./easypush.sh -a \"Adding a new feature\" dev
"
}

# Default branch name
BRANCH_NAME="main"

# Parse options
while getopts ":hpscu:a:" opt; do
    case $opt in
        h)  # Display help
            man_page
            exit 0
            ;;
        p)  # Pull latest changes
            echo "Pulling latest changes from branch '$BRANCH_NAME'..."
            git pull origin "$BRANCH_NAME"
            ;;
        s)  # Stage changes
            echo "Staging all changes..."
            git add -A
            ;;
        c)  # Commit changes
            if [ -z "$2" ]; then
                echo "Error: Commit message is required for -c option."
                exit 1
            fi
            COMMIT_MESSAGE=$2
            echo "Committing changes with message: '$COMMIT_MESSAGE'..."
            git commit -m "$COMMIT_MESSAGE"
            shift # Skip the commit message
            ;;
        u)  # Push changes
            BRANCH_NAME=${OPTARG:-main}
            echo "Pushing changes to branch '$BRANCH_NAME'..."
            git push origin "$BRANCH_NAME"
            ;;
        a)  # Perform all operations
            COMMIT_MESSAGE=$OPTARG
            BRANCH_NAME=${!OPTIND:-main} # Use the next argument as branch name if provided
            echo "Performing all operations: Pull, Stage, Commit, Push..."
            echo "Pulling latest changes from branch '$BRANCH_NAME'..."
            git pull origin "$BRANCH_NAME"
            echo "Staging all changes..."
            git add -A
            echo "Committing changes with message: '$COMMIT_MESSAGE'..."
            git commit -m "$COMMIT_MESSAGE"
            echo "Pushing changes to branch '$BRANCH_NAME'..."
            git push origin "$BRANCH_NAME"
            ;;
        \?) # Invalid option
            echo "Error: Invalid option -$OPTARG"
            man_page
            exit 1
            ;;
    esac
done
