REM Installing compatible terminal.
winget install -e --id Alacritty.Alacritty

REM NeoVIM
winget install --id=Neovim.Neovim  -e

REM Installing tools for plugin installs.
winget install -e --id LLVM.LLVM

REM LazyGit, so it works with the integration.
winget install -e --id=JesseDuffield.lazygit

REM winget install SSHFS-Win.SSHFS-Win
