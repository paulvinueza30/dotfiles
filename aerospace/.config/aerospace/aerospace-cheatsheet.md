# AeroSpace Cheat Sheet (Hyprland-style)

## Overview
- **Layout**: Tiles (bsp-style) 
- **Modifier**: `Alt` (Option key)
- **No SIP required** - works out of the box!

---

## Window Navigation

| Action | Keybind |
|--------|---------|
| Focus left | `Alt + h` |
| Focus down | `Alt + j` |
| Focus up | `Alt + k` |
| Focus right | `Alt + l` |
| Focus (arrows) | `Alt + ←/↓/↑/→` |

---

## Window Movement

| Action | Keybind |
|--------|---------|
| Move left | `Alt + Shift + h` |
| Move down | `Alt + Shift + j` |
| Move up | `Alt + Shift + k` |
| Move right | `Alt + Shift + l` |
| Move (arrows) | `Alt + Shift + ←/↓/↑/→` |

---

## Workspaces

| Action | Keybind |
|--------|---------|
| Switch to workspace 1-10 | `Alt + 1-0` |
| Move window to workspace | `Alt + Shift + 1-0` |
| Last workspace | `Alt + Tab` |
| Move workspace to monitor | `Alt + Shift + Tab` |

---

## Layout & Resize

| Action | Keybind |
|--------|---------|
| Toggle tiles/accordion | `Alt + /` |
| Toggle floating | `Alt + e` |
| Fullscreen | `Alt + f` |
| Resize smart - | `Alt + -` |
| Resize smart + | `Alt + =` |
| Resize width | `Alt + Ctrl + h/l` |
| Resize height | `Alt + Ctrl + j/k` |

---

## Window Actions

| Action | Keybind |
|--------|---------|
| Close window | `Alt + q` |
| Split horizontal | `Alt + Shift + v` |
| Split vertical | `Alt + Shift + h` |

---

## Apps

| Action | Keybind |
|--------|---------|
| Open Terminal | `Alt + Enter` |
| Open Browser | `Alt + Shift + Enter` |

---

## Service Mode

| Action | Keybind |
|--------|---------|
| Enter service mode | `Alt + Shift + ;` |
| Reload config | `Esc` (in service mode) |
| Flatten workspace | `r` (in service mode) |
| Toggle floating | `f` (in service mode) |
| Exit service mode | `Esc` |

---

## Current Settings (from config)

```
start-at-login: true
auto-reload-config: true
gaps: 10px inner, 20-40px outer
layout: tiles
persistent-workspaces: 1-9
```

---

## Comparison with Hyprland

| Hyprland | AeroSpace |
|----------|-----------|
| `SUPER + h/j/k/l` | `Alt + h/j/k/l` |
| `SUPER + 1-9` | `Alt + 1-9` |
| `SUPER + Shift + 1-9` | `Alt + Shift + 1-9` |
| `SUPER + q` | `Alt + q` |
| `SUPER + f` | `Alt + f` |

---

## Troubleshooting

```bash
# Reload config
aerospace reload-config

# Check logs
log show --predicate 'process == "AeroSpace"' --last 5m

# List workspaces
aerospace list-workspaces
```