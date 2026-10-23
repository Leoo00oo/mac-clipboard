#!/bin/bash
if pgrep -x Maccy >/dev/null; then
  echo "Maccy: RUNNING (pid $(pgrep -x Maccy))"
else
  echo "Maccy: not running"
fi
echo "App: /Users/leo/Applications/Maccy.app"
echo "Hotkey: Shift-Command-V (⇧⌘V)"
echo "History size: $(defaults read org.p0deje.Maccy historySize 2>/dev/null || echo '?')"
