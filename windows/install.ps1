# powershell
iwr -useb get.scoop.sh | iex
iwr https://deno.land/install.ps1 -useb | iex

# winget
winget install --id Microsoft.Powershell --source winget
winget install -e --id Git.Git

# scoop
scoop install gcc
scoop install vim
scoop install neovim
scoop install rustup

# tools
cargo install stylua
