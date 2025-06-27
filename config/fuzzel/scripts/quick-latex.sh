#!/bin/bash
TEMP_FILE=$(mktemp --suffix=.tex)
echo '$$' > "$TEMP_FILE"

foot --title="quick-latex" \
  -e bash -c "NVIM_TEXTEXT=1 nvim '$TEMP_FILE' -c 'normal! ggA' -c 'startinsert' && cat '$TEMP_FILE' | wl-copy && rm '$TEMP_FILE'"
