-- Window and workspace rules.

-- Auto-maximize tmux sessions (launched via the tmux session picker).
o.window({ class = "^ghostty$", title = "^\\[tmux\\]" }, { maximize = true })

-- Zero gaps on app special workspaces.
hl.workspace_rule({ workspace = "3", gaps_in = 0, gaps_out = 0 })
hl.workspace_rule({ workspace = "special:Messaging", gaps_in = 0, gaps_out = 0 })
hl.workspace_rule({ workspace = "special:AI", gaps_in = 0, gaps_out = 0 })
hl.workspace_rule({ workspace = "special:ChatGPT", gaps_in = 0, gaps_out = 0 })
hl.workspace_rule({ workspace = "special:forge", gaps_in = 0, gaps_out = 0 })

-- Messaging workspace (Vesktop + Slack).
o.window("vesktop", { workspace = "special:Messaging silent", no_initial_focus = true, suppress_event = "activate activatefocus" })
o.window("Slack", { workspace = "special:Messaging silent", no_initial_focus = true, suppress_event = "activate activatefocus" })

-- AI workspace (Claude + Gemini).
o.window("Claude", { workspace = "special:AI silent", no_initial_focus = true, suppress_event = "activate activatefocus" })
o.window(".*gemini\\.google\\.com.*", { workspace = "special:AI silent", no_initial_focus = true, suppress_event = "activate activatefocus" })
o.window("(?i)chatgpt", { workspace = "special:ChatGPT silent" })

-- Special workspaces (individual apps).
o.window("spotify", { workspace = "special:Spotify silent", no_initial_focus = true })
o.window("obsidian", { workspace = "special:Obsidian silent", no_initial_focus = true })
o.window("deskthing", { workspace = "special:DeskThing silent", no_initial_focus = true })
o.window(".*instagram\\.com.*", { workspace = "special:Instagram silent", no_initial_focus = true })

-- Special workspaces (webapps).
o.window(".*x\\.com.*", { workspace = "special:X silent", no_initial_focus = true })
o.window(".*linkedin\\.com.*", { workspace = "special:LinkedIn silent", no_initial_focus = true })
o.window(".*youtube\\.com.*", { workspace = "special:YouTube silent", no_initial_focus = true })
o.window(".*github\\.com.*", { workspace = "special:GitHub silent", no_initial_focus = true })
o.window(".*reddit\\.com.*", { workspace = "special:Reddit silent", no_initial_focus = true })
o.window(".*twitch\\.com.*", { workspace = "special:Twitch silent", no_initial_focus = true })
o.window(".*neetcode\\.com.*", { workspace = "special:NeetCode silent", no_initial_focus = true })
o.window(".*n8n.*", { workspace = "special:N8N silent", no_initial_focus = true })
o.window("chrome-app.hey.com__calendar_weeks_-Default", { workspace = "special:Calendar silent", no_initial_focus = true })
o.window({ initial_title = ".*todoist.*" }, { workspace = "special:Todoist silent", no_initial_focus = true })
