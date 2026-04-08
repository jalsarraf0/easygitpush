# easygitpush

A Bash script that automates common Git operations — pull, stage, commit, and push — with a simple flag-based interface.

## Features

- Pull the latest changes from the remote
- Stage all working directory changes
- Commit with a custom message
- Push to any branch (default: `main`)
- All-in-one mode: pull, stage, commit, and push in a single command

## Requirements

- `git` installed and configured
- A locally cloned repository with push access to the target branch

## Installation

```bash
# Clone or download
git clone https://github.com/jalsarraf0/easygitpush.git

# Make executable
chmod +x easygitpush.sh

# Optional: make available system-wide
sudo mv easygitpush.sh /usr/local/bin/easygitpush
```

## Usage

```bash
./easygitpush.sh [OPTIONS] [COMMIT_MESSAGE] [BRANCH_NAME]
```

| Option | Description |
|--------|-------------|
| `-h` | Display help |
| `-p` | Pull latest changes from remote |
| `-s` | Stage all changes (`git add -A`) |
| `-c` | Commit staged changes (requires a commit message as the next argument) |
| `-u <branch>` | Push to the specified branch (default: `main`) |
| `-a <message> [branch]` | Run all operations: pull, stage, commit, push |

### Examples

```bash
# Pull latest changes
./easygitpush.sh -p

# Stage and commit
./easygitpush.sh -s -c "Fix authentication bug"

# Push to a specific branch
./easygitpush.sh -u dev

# All-in-one: pull, stage, commit, push to main
./easygitpush.sh -a "Add rate limiting" main

# All-in-one to a non-default branch
./easygitpush.sh -a "WIP: refactor auth" feature/auth
```

## License

MIT License — Copyright (c) 2024 Jamal Al-Sarraf
