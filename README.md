
# CocoaPods and Flutter Environment Setup for Apple Silicon Mx Mac

This script automates the installation and setup of **CocoaPods**, **Flutter**, and **Ruby 3.2** on a Mac M1. It ensures the correct configuration of these tools and adds the necessary paths to the system for a smooth development experience.

## Prerequisites

- A Mac with an M1-M4 processor.
- Zsh as the default shell (this script modifies the `.zshrc` file).

## Features

- Installs **Homebrew** if not already installed.
- Installs **rbenv** and **ruby-build** to manage Ruby versions.
- Installs **Ruby 3.2** (compatible with CocoaPods).
- Configures **Flutter** to work with CocoaPods.
- Ensures the correct paths for **Ruby Gems** and **Flutter** are set in the system's PATH.
- Installs and configures **CocoaPods**.
- Verifies the installation using `flutter doctor`.

## How to Use

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/your-username/your-repo.git
