#!/bin/sh

# Pull the latest changes
alias npull='cd ~/.config/nvim && git pull'

# Push with timestamp as commit message
alias npush='cd ~/.config/nvim && git add . && git commit -m "$(date +"update: %F %T")" && git push"'

