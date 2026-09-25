-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- Open the AI usage panel from anywhere.
o.bind("SUPER + SHIFT + U", "Toggle AI usage", "omarchy-shell omarchy.agents toggle")

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

local home = os.getenv("HOME")

-- Replace Omarchy's default terminal bind with the tmux session picker.
hl.unbind("SUPER + RETURN")
o.bind("SUPER + RETURN", "Tmux", home .. "/.config/hypr/tmux-session-picker.sh")

-- Terminal with cwd tracking (replaces Omarchy's preinstalled tmux terminal).
if o.preinstalled_bindings_enabled() then
  hl.unbind("SUPER + ALT + RETURN")
end
o.bind("SUPER + ALT + RETURN", "Terminal", "uwsm app -- $TERMINAL --dir=\"$(omarchy-cmd-terminal-cwd)\"")

-- Browser binds (SUPER+SHIFT+B, SUPER+SHIFT+ALT+B, SUPER+SHIFT+RETURN),
-- Grok, X Post and Google Messages are identical to Omarchy defaults,
-- so they are not repeated here.

-- File manager: open a new window instead of Omarchy's launcher.
hl.unbind("SUPER + SHIFT + F")
o.bind("SUPER + SHIFT + F", "File manager", "uwsm app -- nautilus --new-window")

o.bind("SUPER + SHIFT + minus", "Monitor", "omarchy-launch-tui btop")
o.bind("SUPER + SHIFT + equal", "Docker", "omarchy-launch-tui lazydocker")
hl.unbind("SUPER + SHIFT + SLASH")
o.bind("SUPER + SHIFT + slash", "Passwords", "uwsm app -- 1password")

-- Webapp launchers that Omarchy does not bind by default.
o.bind("SUPER + SHIFT + ALT + D", "Discord", "omarchy-launch-webapp \"https://discord.com/channels/@me\"")
o.bind("SUPER + SHIFT + ALT + S", "Slack", "omarchy-launch-webapp \"https://app.slack.com/client/\"")
o.bind("SUPER + SHIFT + ALT + I", "Instagram", "omarchy-launch-webapp \"https://www.instagram.com/\"")

-- Switch to previous workspace with SUPER + ~
o.bind("SUPER + grave", "Former workspace", hl.dsp.focus({ workspace = "previous" }))

-- Closes whatever scratchpad you had open
o.bind("SUPER + SHIFT + grave", "Close scratchpad", hl.dsp.workspace.toggle_special("__TEMP"))

-- Workspace-app workspaces (unbind Omarchy's preinstalled webapp binds first).
local function rebind_workspace_app(mods, key, app)
  if o.preinstalled_bindings_enabled() then
    hl.unbind(mods .. " + " .. string.upper(key))
  end
  o.bind(mods .. " + " .. key, app, home .. "/.config/hypr/workspace-apps.sh " .. app)
end

rebind_workspace_app("SUPER + SHIFT", "T", "Todoist")
rebind_workspace_app("SUPER + SHIFT", "I", "Instagram")
rebind_workspace_app("SUPER + SHIFT", "X", "X")
rebind_workspace_app("SUPER + SHIFT", "L", "LinkedIn")
rebind_workspace_app("SUPER + SHIFT", "Y", "YouTube")
rebind_workspace_app("SUPER + SHIFT", "G", "GitHub")
rebind_workspace_app("SUPER + SHIFT", "C", "Calendar")
rebind_workspace_app("SUPER + SHIFT", "E", "Gmail")
rebind_workspace_app("SUPER + SHIFT", "S", "Spotify")
rebind_workspace_app("SUPER + SHIFT", "M", "Messaging")
rebind_workspace_app("SUPER + SHIFT", "O", "Obsidian")
rebind_workspace_app("SUPER + SHIFT", "Z", "NeetCode")
rebind_workspace_app("SUPER + SHIFT", "A", "ChatGPT")
rebind_workspace_app("SUPER + SHIFT", "R", "Reddit")
rebind_workspace_app("SUPER + SHIFT", "P", "ProxMox")
rebind_workspace_app("SUPER + SHIFT", "N", "N8N")

-- DeskThing lives on semicolon.
o.bind("SUPER + SHIFT + semicolon", "DeskThing", hl.dsp.workspace.toggle_special("DeskThing"))

-- Hermes desktop special workspace
rebind_workspace_app("SUPER + SHIFT", "H", "Hermes")

-- Close special workspace when switching to regular workspaces.
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.unbind("SUPER + " .. key)
  o.bind("SUPER + " .. key, "Workspace " .. workspace, home .. "/.config/hypr/workspace-apps.sh " .. workspace)
end

-- Window movement with arrow keys (replaces Omarchy's group-move binds).
hl.unbind("SUPER + ALT + LEFT")
hl.unbind("SUPER + ALT + RIGHT")
hl.unbind("SUPER + ALT + UP")
hl.unbind("SUPER + ALT + DOWN")
o.bind("SUPER + ALT + LEFT", "Move window left", hl.dsp.window.move({ direction = "l" }))
o.bind("SUPER + ALT + RIGHT", "Move window right", hl.dsp.window.move({ direction = "r" }))
o.bind("SUPER + ALT + UP", "Move window up", hl.dsp.window.move({ direction = "u" }))
o.bind("SUPER + ALT + DOWN", "Move window down", hl.dsp.window.move({ direction = "d" }))


-- Keyboard backlight via brightnessctl (replaces Omarchy's helper).
hl.unbind("XF86KbdBrightnessDown")
hl.unbind("XF86KbdBrightnessUp")
o.bind("XF86KbdBrightnessDown", "Keyboard brightness down",
  "brightnessctl --device='smc::kbd_backlight' set 10%-", { repeating = true })
o.bind("XF86KbdBrightnessUp", "Keyboard brightness up",
  "brightnessctl --device='smc::kbd_backlight' set +10%", { repeating = true })
