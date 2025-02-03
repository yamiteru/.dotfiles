$env.config.buffer_editor = '/opt/homebrew/bin/nvim'
$env.PROMPT_COMMAND_RIGHT = ""
$env.config.edit_mode = 'vi'
$env.config.show_banner = false

alias nu-open = open
alias open = ^open
alias python = python3
alias pip = pip3

if ('ZELLIJ' in $env) { ignore } else { zellij }
