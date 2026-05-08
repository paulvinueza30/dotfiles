return {
  {
    "nvim-mini/mini.move",
    keys = function()
      local MiniMove = require("mini.move")
      return {
        { "<S-Down>", function() MiniMove.move_line("down") end, mode = "n", desc = "Move line down" },
        { "<S-Up>", function() MiniMove.move_line("up") end, mode = "n", desc = "Move line up" },
        { "<S-Down>", function() MiniMove.move_selection("down") end, mode = "x", desc = "Move selection down" },
        { "<S-Up>", function() MiniMove.move_selection("up") end, mode = "x", desc = "Move selection up" },
        { "J", function() MiniMove.move_selection("down") end, mode = "x", desc = "Move selection down" },
        { "K", function() MiniMove.move_selection("up") end, mode = "x", desc = "Move selection up" },
      }
    end,
    opts = {
      mappings = {
        down = "",
        up = "",
        left = "",
        right = "",
        line_down = "",
        line_up = "",
        line_left = "",
        line_right = "",
      },
    },
  },
}
