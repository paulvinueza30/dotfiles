return {
  {
    "nvim-mini/mini.move",
    keys = function()
      local MiniMove = require("mini.move")
      return {
        { "<C-S-Down>", function() MiniMove.move_line("down") end, mode = { "n", "v" }, desc = "Move line down" },
        { "<C-S-Up>", function() MiniMove.move_line("up") end, mode = { "n", "v" }, desc = "Move line up" },
      }
    end,
    opts = {
      mappings = {
        down = "",
        up = "",
        left = "",
        right = "",
      },
    },
  },
}
