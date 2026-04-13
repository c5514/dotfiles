#!/usr/bin/env fish
set TEMP_FILE (mktemp --suffix=.tex)
echo '' > $TEMP_FILE
foot --title="quick-latex" \
  -e fish -c "set -x NVIM_TEXTEXT 1; nvim '$TEMP_FILE' -c 'normal! ggA' -c 'startinsert'; and cat '$TEMP_FILE' | wl-copy; and rm '$TEMP_FILE'"
