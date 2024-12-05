# GitNinja - Automate Your Git Workflow with Ease

GitNinja is a powerful tool designed to automate and streamline your Git tasks. It makes managing your repositories faster and more fun with interactive prompts and animations.

## Features
- Automate Git commits, staging, and pushes.
- Interactive prompts for untracked and unstaged files.
- Fun animations while executing tasks.
- Easy to install via APT or Homebrew.

---

## Installation

GitNinja can be installed in two ways: via **APT** or **Homebrew**. Choose the method that best suits your system.

---

### Install with APT (Debian-based systems)

Follow these steps to install GitNinja on Debian-based systems (e.g., Ubuntu, Linux Mint):

1. **Add the GitNinja repository:**

   Open a terminal and run the following command to add the GitNinja APT repository to your sources list:

   ```bash
   echo "deb [trusted=yes] https://github.com/StivenUrresti/GitNinja/raw/master/apt-repo/ ./" | sudo tee -a /etc/apt/sources.list.d/git-ninja.list
