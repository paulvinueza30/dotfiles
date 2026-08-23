-- Extra autostart processes.
-- o.launch_on_start("my-service")

hl.on("hyprland.start", function()
  -- Spotify opens straight into its special workspace.
  hl.exec_cmd("spotify", { workspace = "special:Spotify silent" })

  -- Forge: persistent tmux session in a special workspace.
  hl.exec_cmd("ghostty -e tmux new-session -A -s forge", { workspace = "special:forge silent" })

  local home = os.getenv("HOME")
  hl.exec_cmd(home .. "/.config/hypr/group-workspaces.sh")
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Class 24")

  -- Alienware fan control max speed.
  hl.exec_cmd("awcc g")
end)