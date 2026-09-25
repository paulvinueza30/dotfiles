-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all
-- All monitors defined statically — Hyprland ignores rules for disconnected monitors.
-- No runtime detection needed.

-- 2-monitor setup: DP-13 (left) + DP-9 (right), 2x Samsung U32J59x 4K
hl.monitor({ output = "DP-13", mode = "3840x2160@30", position = "0x0", scale = 2 })
hl.monitor({ output = "DP-9", mode = "3840x2160@60", position = "1920x0", scale = 2 })

hl.workspace_rule({ workspace = "1", monitor = "DP-13", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-13" })
hl.workspace_rule({ workspace = "3", monitor = "DP-9", default = true })
hl.workspace_rule({ workspace = "4", monitor = "DP-9" })

-- 3-monitor setup: DP-4 (left) + DP-1 (middle) + HDMI-A-1 (right, portrait)
local dp4_scale = 1.25
local dp1_scale = 1.25
local hdmi_scale = 1.25
local dp4_width = math.floor(1920 / dp4_scale)
local dp1_width = math.floor(1920 / dp1_scale)

hl.monitor({ output = "DP-4", mode = "preferred", position = "0x0", scale = dp4_scale })
hl.monitor({ output = "DP-1", mode = "preferred", position = dp4_width .. "x0", scale = dp1_scale })
hl.monitor({
  output = "HDMI-A-1",
  mode = "preferred",
  position = (dp4_width + dp1_width) .. "x0",
  scale = hdmi_scale,
  transform = 1,
})

hl.workspace_rule({ workspace = "5", monitor = "DP-4", default = true })
hl.workspace_rule({ workspace = "6", monitor = "DP-1", default = true })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", default = true })
