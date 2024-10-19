
# CocoaPods and Flutter Environment Setup for Mac M1

This script automates the installation and setup of **CocoaPods**, **Flutter**, and **Ruby 3.2** on a Mac M1. It ensures the correct configuration of these tools and adds the necessary paths to the system for a smooth development experience.

## Prerequisites

- A Mac with the M1 processor.
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

Follow these steps to create, make executable, and run the installation script:

### Step 1: Create the `.sh` file

1. Open the terminal.
2. Navigate to the directory where you want to create the script (optional):
   ```bash
   cd path/to/your/directory
   ```

3. Create a new file named `install_cocoapods.sh` using a text editor like **nano**:
   ```bash
   nano install_cocoapods_with_flutter.sh
   ```

### Step 2: Paste the script content

1. Copy the content of the script from this repository.
2. In the terminal, paste the content into the file opened in **nano** by right-clicking or using `CTRL + SHIFT + V`.
3. After pasting, press `CTRL + O` to save the file, then press `ENTER`.
4. Press `CTRL + X` to exit **nano**.

### Step 3: Make the script executable

1. In the terminal, run the following command to make the script executable:
   ```bash
   chmod +x install_cocoapods.sh
   ```

### Step 4: Run the script

1. Run the script by executing the following command in the terminal:
   ```bash
   ./install_cocoapods.sh
   ```

2. Follow the on-screen prompts as the script installs Homebrew, rbenv, Ruby 3.2, and CocoaPods, and sets up Flutter.

### Step 5: Verify the installation

Once the script finishes running, `flutter doctor` will automatically execute to verify the installation of Flutter and CocoaPods.

## Notes

- The script modifies your `.zshrc` file to include the necessary paths for **Ruby Gems** and **Flutter**. You may review the changes if needed.
- After running the script, it's recommended to restart your terminal to ensure all path changes take effect.

