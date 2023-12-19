#!/usr/bin/env bash
set -e

# shellcheck disable=2046,2016
layout=$(
	grep 'session_name:' $(fd .\.yaml "$HOME/.config/tmuxp") | cut -d':' -f3 |
		fzf --color=fg:#ffa500,hl:#a9a9a9,prompt:#adff2f,separator:#ffe983,info:#ffe2ec \
			--preview='bat -f $(grep -l {} $(fd .\.yaml "$HOME/.config/tmuxp"))'
)

if [ -z "$layout" ]; then
	exit 1
fi

# shellcheck disable=2046
path=$(grep -l "^session_name:$layout\$" $(fd .\.yaml "$HOME/.config/tmuxp"))

if [ ! -f "$path" ]; then
	exit 1
fi

if [ -n "$KITTY_WINDOW_ID" ]; then
	kitty @ launch --type=tab --hold --env PATH="$PATH" tmuxp load "$path"
elif [ -n "$ITERM_SESSION_ID" ]; then
	osascript -e 'tell application "iTerm"' -e 'tell current window' -e 'create tab with default profile' -e 'tell current session' -e "write text \"tmuxp load $path\"" -e 'end tell' -e 'end tell' -e 'end tell'
else
	tmuxp load "$path"
fi
