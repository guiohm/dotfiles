#!/bin/sh

# Used to change background color of ssh connections

if [ "$TERM" = "screen"* ] && [ -n "$TMUX" ]; then
  if [ "$1" = "prod" ]; then
    tmux select-pane -P 'bg=#211212'
  elif [ "$1" = "dev" ]; then
    tmux select-pane -P 'bg=#141931'
  elif [ "$1" = "other" ]; then
    tmux select-pane -P 'bg=#192714'
  else
    tmux select-pane -P 'bg=#101010'
  fi;
else
  if [ "$1" = "prod" ]; then
    printf '\033]11;#211212\007'
  elif [ "$1" = "dev" ]; then
    printf '\033]11;#141931\007'
  elif [ "$1" = "other" ]; then
    printf '\033]11;#192714\007'
  else
    printf '\033]11;#101010\007'
  fi
fi
