# LeoClipboard (iPaste-lite via Maccy)

Lightweight **text clipboard history + hotkey paste** for Leo, using [Maccy](https://maccy.app/) 2.7.1.

## Install location

| What | Path |
|------|------|
| App | `/Users/leo/Applications/Maccy.app` |
| Project / notes | `/Volumes/RESOURCE/workspace/LeoClipboard` |
| LaunchAgent | `~/Library/LaunchAgents/com.leo.maccy.plist` |

## Hotkey

**⇧⌘V** (Shift + Command + V) — opens history popup (same idea as iPaste).

- Arrow keys / click to pick an item → copies and **pastes** into the frontmost app
- Type to search the list
- Esc to dismiss

If ⇧⌘V does nothing: System Settings → Keyboard → Keyboard Shortcuts → find a conflicting service (often “Convert text to Simplified/Traditional Chinese”) → disable that shortcut → restart Maccy.

## Start / stop

```bash
/Volumes/RESOURCE/workspace/LeoClipboard/start.sh
/Volumes/RESOURCE/workspace/LeoClipboard/stop.sh
/Volumes/RESOURCE/workspace/LeoClipboard/status.sh
```

Or: open `/Users/leo/Applications/Maccy.app`, or click the clipboard icon in the menu bar.

LaunchAgent `com.leo.maccy` opens Maccy at login. Maccy’s own “Launch at login” is also enabled.

## Permissions Leo must approve (TCC)

1. **Accessibility** (required for auto-paste / simulating ⌘V)  
   System Settings → Privacy & Security → Accessibility → enable **Maccy**.  
   First paste may prompt; if paste only copies but doesn’t insert, grant Accessibility then quit & reopen Maccy.

2. **Automation / Apple Events** (sometimes)  
   If macOS asks to control System Events or other apps, allow.

3. **Input Monitoring** — usually not required for Maccy’s Carbon hotkey; only grant if prompted.

No iCloud / files / images in this setup: pasteboard types limited to text/HTML/RTF (no image UTIs).

## Config already applied

```text
historySize          = 50
pasteByDefault       = true   # select → paste
showInStatusBar      = true
KeyboardShortcuts_popup = ⇧⌘V
launchAtLogin        = true
enabledPasteboardTypes = utf8 / utf16 plain text, html, rtf
```

Change later: menu bar icon → Preferences, or:

```bash
defaults write org.p0deje.Maccy historySize -int 50
# hotkey ⇧⌘V:
defaults write org.p0deje.Maccy KeyboardShortcuts_popup -string '{"carbonModifiers":768,"carbonKeyCode":9}'
killall Maccy; open -a /Users/leo/Applications/Maccy.app
```

## Uninstall

```bash
/Volumes/RESOURCE/workspace/LeoClipboard/stop.sh
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.leo.maccy.plist 2>/dev/null
rm -f ~/Library/LaunchAgents/com.leo.maccy.plist
rm -rf /Users/leo/Applications/Maccy.app
# optional: defaults delete org.p0deje.Maccy
```

## Why Maccy

Matches “text history + hotkey paste”, menu bar, Launch at login, Accessibility paste — ready in minutes. Custom Swift/Python was skipped because GitHub/brew were slow from this network; Maccy was installed from the release zip via mirror.
