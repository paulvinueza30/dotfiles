-- Change the default Omarchy look'n'feel.

hl.config({
  decoration = {
    -- Use round window corners.
    rounding = 4,

    -- Set default window opacity (1.0 = fully opaque, 0.0 = fully transparent).
    active_opacity = 1.0,
    inactive_opacity = 1.0,

    -- Add very light blur effects.
    blur = {
      enabled = true,
      size = 10,
      passes = 2,
      new_optimizations = true,
    },

    -- Keep dim inactive disabled for now.
    dim_inactive = false,
  },
})

-- Subtle bezier curves ("linear" already exists from Omarchy defaults).
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- Gentle animations.
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "linear" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 6, bezier = "linear" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "linear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4, bezier = "myBezier", style = "slidevert" })

-- Prevent apps from stealing focus (Omarchy defaults this to true).
hl.config({
  misc = {
    focus_on_activate = false,
  },
})