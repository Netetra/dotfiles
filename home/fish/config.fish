set -x FZF_DEFAULT_OPTS "--reverse --border"
set -x FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"
set -x FZF_CTRL_T_OPTS "--preview 'head -100 {}'"
set -g theme_show_exit_status yes
set -g theme_display_git_ahead_verbose yes
set -g fish_prompt_pwd_dir_length 0
set -x RUSTC_WRAPPER $(which sccache)

# Alias
alias hx="helix"

# Add path
# fish_add_path $HOME/.local/bin
# fish_add_path $HOME/.cargo/bin

# pnpm
# set -gx PNPM_HOME "/home/netetra/.local/share/pnpm"
# if not string match -q -- $PNPM_HOME $PATH
#     set -gx PATH "$PNPM_HOME" $PATH
# end
# pnpm end
