$env.config.buffer_editor = '/opt/homebrew/bin/nvim'
$env.PROMPT_COMMAND_RIGHT = ""
$env.config.edit_mode = 'vi'
$env.config.show_banner = false

alias nu-open = open
alias open = ^open
alias python = python3
alias pip = pip3

# Navigation
alias dev = cd ~/dev
alias c = clear
alias l = ls -a
alias x = exit

# Neovim / Lazygit
alias "." = nvim
alias "," = lazygit

# Bun
alias b = bun
alias bi = bun install
alias br = bun run
alias ba = bun add
alias bu = bun update
alias brm = bun remove
alias bx = bunx

# Git
alias g = git
alias gcl = git clone
alias gs = git status
alias ga = git add
alias gc = git commit -m
alias gco = git checkout
alias gb = git branch
alias gd = git diff
alias gf = git fetch
alias gl = git log
alias gp = git push
alias gm = git merge

# fnm (Node version manager)
fnm env --json | from json | load-env
