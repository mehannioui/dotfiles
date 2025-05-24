return {
  "Vigemus/iron.nvim",
  -- Lazy-load on a command or keymap for efficiency
  -- cmd = "IronRepl",
  -- keys = { { "<leader>sx", "<cmd>IronRepl<cr>", desc = "Iron REPL" } },
  config = function()
    require("iron.core").setup({
      config = {
        -- Preferred REPL for Python (ipython is great for data science)
        preferred_repl = "ipython",
        -- How to open the REPL window (e.g., in a vertical split at the bottom right)
        repl_open_cmd = require("iron.view").split.vertical.botright(0.3), -- 30% height
      },
      -- Add some keymaps (these are just examples, customize them)
      keymaps = {
        send_motion = "<leader>is", -- Send motion
        visual_send = "<leader>is", -- Send visual selection
        send_file = "<leader>if",
        send_line = "<leader>il",
        send_until_cursor = "<leader>iu",
        cr = "<leader>i<space>", -- Send <cr> to repl
        interrupt = "<leader>iC",
        exit = "<leader>iQ",
        clear = "<leader>ic",
      },
    })
  end,
}
