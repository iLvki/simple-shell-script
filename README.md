# simple-shell-script

A simple script to spice up your terminal with a better look and some handy shortcuts.

## Features

- **Custom Terminal Prompt:** Adds colors and structural clarity to your PS1.
- **Aliases:** Adds `update` (full system upgrade) and `reboot` shortcuts.
- **App Installer:** Automatically installs your favorite utilities.

> **Note:** This script relies on `apt` and is designed for Debian-based systems

## Usage

1. **Clone or download** this repository.

2. **Make the script executable:**

   ```bash
   chmod +x config.sh
   ```

3. **Run the script**

   ```
   ./config.sh
   ```

4. **Restart your terminal** to see changes

##

### Optional: adding your own apps

Open `config.sh` in any text editor, look for a variable named `APPS` and add package names you want to install (separated by spaces)

```
APPS='vim htop fastfetch ...'
```
