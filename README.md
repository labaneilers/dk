# dk: Devkit command runner

## Installation

### For use with bash on Linux, Mac OSX, or Windows (via [WSL](https://docs.microsoft.com/en-us/windows/wsl/about) or [Git BASH](https://gitforwindows.org/))

Open a bash prompt and run:

```
curl -s https://raw.githubusercontent.com/labaneilers/dk/master/install.sh | bash
```

By default, dk will be installed to ~/bin. If you want to install it elsewhere, use the variable DK_DIR:

```
sudo DK_DIR=/usr/local/bin curl -s https://raw.githubusercontent.com/labaneilers/dk/master/install.sh | bash
```

### Windows PowerShell

On Windows, even if you use PowerShell as your terminal, you need a bash shell to run your command scripts. The most commonly available one is [Git BASH](https://gitforwindows.org/) (comes with Git for Windows).

Open PowerShell as administrator, and run:

```
. { iwr -useb https://raw.githubusercontent.com/labaneilers/dk/master/install.ps1 } | iex
```