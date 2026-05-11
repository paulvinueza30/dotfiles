#!/bin/bash

app_name="$1"
window_title_substring="$2"

if [ -z "$app_name" ]; then
  exit 1
fi

osascript -l JavaScript <<'JXA' "$app_name" "$window_title_substring"
function run(argv) {
  ObjC.import('AppKit')

  const appName = argv[0]
  const titleSubstring = argv[1] ? argv[1].toLowerCase() : ''
  const systemEvents = Application('System Events')
  systemEvents.includeStandardAdditions = true

  function targetWindow(proc) {
    const windows = proc.windows()

    if (!titleSubstring) {
      return windows[0]
    }

    for (const win of windows) {
      try {
        const title = String(win.name() || '').toLowerCase()
        if (title.includes(titleSubstring)) {
          return win
        }
      } catch (error) {
        // Ignore transient window title lookup failures.
      }
    }

    return windows[0]
  }

  function visibleFrames() {
    const screens = $.NSScreen.screens
    const frames = []
    for (let i = 0; i < screens.count; i++) {
      const frame = screens.objectAtIndex(i).visibleFrame
      frames.push({
        x: frame.origin.x,
        y: frame.origin.y,
        w: frame.size.width,
        h: frame.size.height,
      })
    }
    return frames
  }

  function containingFrame(centerX, centerY, frames) {
    for (const frame of frames) {
      if (
        centerX >= frame.x &&
        centerX <= frame.x + frame.w &&
        centerY >= frame.y &&
        centerY <= frame.y + frame.h
      ) {
        return frame
      }
    }
    return frames[0]
  }

  for (let attempt = 0; attempt < 10; attempt++) {
    delay(0.2)

    try {
      const proc = systemEvents.processes.byName(appName)
      const win = targetWindow(proc)
      const position = win.position()
      const size = win.size()
      const frames = visibleFrames()

      const centerX = position[0] + size[0] / 2
      const centerY = position[1] + size[1] / 2
      const frame = containingFrame(centerX, centerY, frames)

      const targetX = Math.round(frame.x + (frame.w - size[0]) / 2)
      const targetY = Math.round(frame.y + (frame.h - size[1]) / 2)

      win.position = [targetX, targetY]
      return
    } catch (error) {
      // The window often isn't scriptable immediately after creation.
    }
  }
}
JXA
