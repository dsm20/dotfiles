#!/bin/bash
# Claude Code statusline script
# Displays: directory (git branch) | model | lines +/- | context %
#
# Configure in ~/.claude/settings.json:
#   "statusLine": { "type": "command", "command": "bash ~/.claude/statusline-command.sh" }

# ─── Parse JSON input ────────────────────────────────────────────────────────

input=$(cat)

extract() {
  echo "$input" | python3 -c "$1" 2>/dev/null
}

cwd=$(extract "import json,sys; d=json.load(sys.stdin); print(d.get('cwd',''))")
model=$(extract "import json,sys; d=json.load(sys.stdin); m=d.get('model',''); print(m.get('display_name', m.get('id', m)) if isinstance(m, dict) else m)")
pct=$(extract "import json,sys; d=json.load(sys.stdin); print(d.get('context_window',{}).get('used_percentage',0))")
tokens_used=$(extract "import json,sys; d=json.load(sys.stdin); cw=d.get('context_window',{}); print(int(cw.get('context_window_size',200000) * cw.get('used_percentage',0) / 100))")
lines_added=$(extract "import json,sys; d=json.load(sys.stdin); print(d.get('cost',{}).get('total_lines_added',0))")
lines_removed=$(extract "import json,sys; d=json.load(sys.stdin); print(d.get('cost',{}).get('total_lines_removed',0))")

# ─── Derived values ───────────────────────────────────────────────────────────

# Current directory name (not full path)
basename=$(basename "$cwd")

# Git branch (empty if not in a git repo)
branch=$(git -C "$cwd" branch --show-current 2>/dev/null)

# ─── Colored segments ─────────────────────────────────────────────────────────

# Context % color: green (0%) → yellow (50%) → red (100%), with token count
colored_pct=$(python3 -c "
p = int('${pct}' or 0)
t = int('${tokens_used}' or 0)
if p <= 50:
    r = int(p * 255 / 50)
    g = 200
else:
    r = 255
    g = int(200 * (100 - p) / 50)
t_str = f'{-(-t//1000)}k' if t >= 1000 else str(t)
print(f'\033[38;2;{r};{g};0mContext: {p}% ({t_str})\033[0m')
" 2>/dev/null)

# Lines added (green) and removed (red) — counts for the current Claude session
green='\033[38;2;0;200;0m'
red='\033[38;2;220;50;50m'
reset='\033[0m'
lines_str="${green}+${lines_added}${reset} ${red}-${lines_removed}${reset}"

# ─── Assemble output ──────────────────────────────────────────────────────────

# Include branch in parens if inside a git repo
if [ -n "$branch" ]; then
  dir_info="${basename} (${branch})"
else
  dir_info="${basename}"
fi

echo -e "${dir_info} | ${model} | ${lines_str} | ${colored_pct}"
