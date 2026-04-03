# ⌨️ TMUX Keybindings

**Prefix:** `C-Space` (also `C-a`)

**Legend:** `C-` = Ctrl, `M-` = Alt (Meta), `S-` = Shift

---

## 🪟 Window Management

| Key | Action |
|-----|--------|
| `prefix c` | New window (same path) |
| `prefix k` | Kill window |
| `prefix r` | Rename window |
| `prefix 1-9` | Switch to window N |
| `M-1` to `M-9` | Switch to window N (no prefix) |
| `M-Left` | Previous window |
| `M-Right` | Next window |
| `M-S-Left` | Swap window left |
| `M-S-Right` | Swap window right |
| `prefix Tab` | Last window |
| `M-Tab` | Last window (no prefix) |
| `prefix F` | Choose window by name |

---

## 📁 Session Management

| Key | Action |
|-----|--------|
| `prefix C` | New session (same path) |
| `prefix K` | Kill session |
| `prefix R` | Rename session |
| `prefix P` | Previous session |
| `prefix N` | Next session |
| `M-Up` | Previous session (no prefix) |
| `M-Down` | Next session (no prefix) |

---

## 🧩 Pane Management

| Key | Action |
|-----|--------|
| `prefix h` | Split horizontal — top/bottom (same path) |
| `prefix v` | Split vertical — left/right (same path) |
| `prefix \|` | Split vertical — left/right (same path) |
| `prefix -` | Split horizontal — top/bottom (same path) |
| `prefix x` | Kill pane |
| `M-\` | Split vertical — left/right (no prefix) |
| `M--` | Split horizontal — top/bottom (no prefix) |

---

## 🧭 Pane Navigation

| Key | Action |
|-----|--------|
| `M-h` | Move left |
| `M-l` | Move right |
| `M-k` | Move up |
| `M-j` | Move down |

---

## ↔️ Pane Resize

| Key | Action |
|-----|--------|
| `C-M-S-Left` / `C-M-S-h` | Shrink left |
| `C-M-S-Right` / `C-M-S-l` | Expand right |
| `C-M-S-Up` / `C-M-S-k` | Expand up |
| `C-M-S-Down` / `C-M-S-j` | Shrink down |

---

## 📋 Copy Mode

| Key | Action |
|-----|--------|
| `prefix [` | Enter copy mode |
| `v` | Begin selection |
| `y` | Copy selection |

---

## 🔧 Popups & Tools

| Key | Action |
|-----|--------|
| `prefix g` | Lazygit popup |
| `prefix d` | Lazydocker popup |
| `prefix t` | Terminal popup |
| `prefix f` | FZF file finder → open in nvim |
| `prefix m` | View README.md (glow) |
| `prefix `` ` | Edit tmux.conf in nvim |
| `prefix ?` | This help menu |
| `prefix o` | Open opencode in new window |

---

## 🎛️ Toggles

| Key | Action |
|-----|--------|
| `prefix y` | Toggle playerctl media display |
| `prefix u` | Toggle workspace usage display |

---

## ⚙️ Misc

| Key | Action |
|-----|--------|
| `prefix q` | Reload tmux config |

*Press `q` to close*
