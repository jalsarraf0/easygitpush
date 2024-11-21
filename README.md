# Easypush: Simplified Git Workflow Manager

A user-friendly Bash script to automate Git operations such as pulling, staging, committing, and pushing to a branch.

---

## 🚀 Features

- **Pull Updates**: Automatically fetch the latest changes from the remote repository.
- **Stage Changes**: Adds all modifications in the working directory to the staging area.
- **Custom Commit Messages**: Commit your changes with a meaningful message of your choice.
- **Push to Branch**: Push commits to the specified branch (default: `main`).
- **All-in-One Command**: Use a single option to perform pull, stage, commit, and push.

---

## 📋 Prerequisites

- A system with `git` installed and configured.
- An existing GitHub repository cloned locally.
- Commit access to the target branch (default: `main`).

---

## 🔧 Installation

1. Clone this repository or download the script directly:
   git clone https://github.com/your-username/easypush.git

   Alternatively, you can download the script:
   wget https://github.com/your-username/easypush/raw/main/easypush.sh

2. Make the script executable:
   chmod +x easypush.sh

3. (Optional) Add it to your system's `PATH` for easier access:
   mv easypush.sh /usr/local/bin/easypush

---

## 🖥️ Usage

Run the script using the following syntax:

./easypush [OPTIONS] [COMMIT_MESSAGE] [BRANCH_NAME]

### **Options**
- `-h`: Display help information.
- `-p`: Pull the latest changes from the remote repository.
- `-s`: Stage all changes in the working directory.
- `-c`: Commit staged changes (requires a commit message).
- `-u`: Push committed changes to a specified branch (default: `main`).
- `-a`: Perform all operations (pull, stage, commit, and push). Requires a commit message.

---

## 💡 Examples

1. Display Help:
   ./easypush -h

2. Pull the Latest Changes:
   ./easypush -p

3. Stage Changes and Commit:
   ./easypush -s -c "Updated documentation"

4. Push Changes to a Specific Branch:
   ./easypush -u dev

5. Perform All Operations:
   ./easypush -a "Initial commit" main

---

## 📜 License

This project is licensed under the MIT License.

---

## 📞 Support

For any issues or feature requests, feel free to open an issue in the GitHub repository: https://github.com/your-username/easypush.

---

*Happy Coding!*
