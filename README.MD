Aquí tienes el README actualizado con el método de instalación utilizando `curl`, eliminando la sección de instalación manual con `dpkg`:

---

# GitNinja - Automate Your Git Workflow with Ease

GitNinja is a powerful tool designed to automate and streamline your Git tasks, making repository management faster and more enjoyable with interactive prompts and animations.

## Features
- **Automate Git tasks**: Simplifies commits, staging, and pushes.
- **Fun animations**: Engages users with animations during task execution.
- **Easy installation**: Installable via APT or Homebrew.

## Installation

GitNinja can be installed using two methods: **APT** for Debian-based systems and **Homebrew** for macOS. Choose the method that best suits your operating system.

### Install with APT (Debian-based systems)

To install GitNinja on Debian-based systems (e.g., Ubuntu, Linux Mint), follow these steps:

1. **Add the GitNinja repository**:
   Open a terminal and run the following command to add the GitNinja APT repository to your sources list:

   ```bash
   echo "deb [trusted=yes] https://github.com/StivenUrresti/GitNinja/raw/master/apt-repo/ ./" | sudo tee -a /etc/apt/sources.list.d/git-ninja.list
   ```

2. **Update package lists**:
   Run the following command to update your package lists:

   ```bash
   sudo apt update
   ```

3. **Install GitNinja**:
   Execute the following command to install GitNinja:

   ```bash
   sudo apt install git-ninja
   ```

### Install with `curl` (Automated Installation)

If you prefer an automated installation, you can use `curl` to download and install GitNinja directly:

1. **Run the installation script**:
   Open a terminal and execute the following command:

   ```bash
   curl -fsSL https://github.com/StivenUrresti/GitNinja/raw/master/install.sh | bash
   ```

   This will download and install GitNinja automatically.

### Install with Homebrew (macOS)

For macOS users, GitNinja can be installed using Homebrew. Run the following command in your terminal:

```bash
brew install git-ninja
```

## Usage

Once installed, you can start using GitNinja by running:

```bash
git-ninja
```

Follow the interactive prompts to manage your Git workflow efficiently.

## Contributing

Contributions are welcome! If you have suggestions or improvements, please feel free to submit a pull request or open an issue on the [GitHub repository](https://github.com/StivenUrresti/GitNinja).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Ahora, el `README.md` solo incluye las opciones de instalación usando APT y el script de instalación con `curl`, simplificando el proceso para los usuarios.