-- Extra keybind overrides and default-bind changes.

-- Screenshot and screen record (in addition to Omarchy's PRINT binds).
hl.bind("F3", hl.dsp.exec_cmd("omarchy-cmd-screenshot"))
hl.bind("CTRL + F3", hl.dsp.exec_cmd("omarchy-cmd-screenrecord"))

-- Middle-click copies nothing (clears primary selection).
hl.bind("mouse:274", hl.dsp.exec_cmd("wl-copy -pc"), { non_consuming = true })

-- Dictation toggle.
o.bind("SUPER + apostrophe", "Toggle Dictation", "voxtype record toggle")

-- Swap TAB workspace navigation: TAB = former, CTRL+TAB = next.
hl.unbind("SUPER + TAB")
hl.unbind("SUPER + CTRL + TAB")
o.bind("SUPER + TAB", "Former workspace", hl.dsp.focus({ workspace = "previous" }))
o.bind("SUPER + CTRL + TAB", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))

-- Remove ALT+TAB group navigation; free it for tmux window cycling.
hl.unbind("SUPER + ALT + TAB")
hl.unbind("SUPER + SHIFT + ALT + TAB")
hl.unbind("ALT + TAB")
hl.unbind("ALT + SHIFT + TAB")

-- Group navigation with bracket keys.
o.bind("SUPER + bracketleft", "Previous window in group", hl.dsp.group.prev())
o.bind("SUPER + bracketright", "Next window in group", hl.dsp.group.next())

-- Forge special workspace on SUPER+S (replaces scratchpad toggle).
hl.unbind("SUPER + S")
o.bind("SUPER + S", "Toggle forge", hl.dsp.workspace.toggle_special("forge"))