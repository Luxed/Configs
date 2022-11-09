if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Bun
set -Ux BUN_INSTALL "/home/cbrunel/.bun"
set -px --path PATH "/home/cbrunel/.bun/bin"

# Bobthefish theme configuration
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
