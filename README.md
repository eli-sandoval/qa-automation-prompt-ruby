# QA Automation Prompt (Ruby)

This project provides the QA automation prompt challenge implemented in Ruby with a focus on scalability,
maintainability, and clean structure.

## Prerequisites

Before running the project, ensure the following are installed:

- **Ruby** (latest stable version recommended)
- **Bundler** (Ruby dependency manager)
- **Make** (to run the Makefile commands)
- **SQLite3** (to view the db)

## Installation

### Windows

1. Install [RubyInstaller for Windows](https://rubyinstaller.org/).
2. During installation, ensure the option to install MSYS2 is selected.
3. Open a terminal (PowerShell or Command Prompt).
4. Install Bundler:
   ```bash
   gem install bundler
   ```
5. Verify Ruby and Bundler installation:
   ```bash
   ruby -v
   bundler -v
   ```
6. Install make.
    1. Install MSYS2: https://www.msys2.org/
    2. Open the MSYS2 terminal and install make:

```bash
  pacman -S make
```

7. Verify installation:

```bash
  make --version
```

Alternatively, Git Bash can also provide `make`.

8. Install SQLite3. Download SQLite3 precompiled binaries
   from [https://www.sqlite.org/download.html](https://www.sqlite.org/download.html).


9. Add the folder containing `sqlite3.exe` to your system PATH.


10. Verify installation:
   ```powershell
   sqlite3 --version
   ```

### macOS

1. Install Homebrew if not already installed:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. Install Ruby:
   ```bash
   brew install ruby
   ```
3. Add Ruby to your PATH (if required):
   ```bash
   echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc
   source ~/.zshrc
   ```
4. Install Bundler:
   ```bash
   gem install bundler
   ```
5. Install make. Make is included with Xcode Command Line Tools. If it is not installed:
   ```bash
   xcode-select --install
   make --version
   ```

6. Install SQLite3
   ```bash
   brew install sqlite3
   sqlite3 --version
   ```

## Project Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/eli-sandoval/qa-automation-prompt-ruby.git
   cd qa-automation-prompt-ruby
   ```
2. Install dependencies:
   ```bash
   bundle install
   ```

## Running the Project

The project includes a `Makefile` to simplify execution.

- To start the monitoring script with the values from app_config.rb:
  ```bash
  make monitor
  ```

- To start the monitoring script with custom values:
  ```bash
  make monitor DURATION=<seconds> INTERVAL=<seconds>
  ```

- To start the calculate uptime script:
  ```bash
  make uptime
  ```

- To start the monitoring script with the values from app_config.rb and calculate uptime all together:
  ```bash
  make monitor_and_uptime
  ```

- To start the monitoring script with custom values and calculate uptime all together:
  ```bash
  make monitor_and_uptime DURATION=<seconds> INTERVAL=<seconds>
  ```

- To start the script that reproduces the name formatting issue:
  ```bash
  make format_issue_test
  ```

- To delete the DB (request_logs.db):
  ```bash
  make clean
  ```

## Notes

- Ensure you are in the root folder of the project before running `make` commands.