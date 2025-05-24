-- In ~/.config/nvim/lua/plugins/theme-catppuccin.lua
return {
  "catppuccin/nvim",
  lazy = false, -- Load the theme early
  name = "catppuccin", -- Optional, for organization
  priority = 1000, -- Ensure it's loaded before other plugins that might set colors
  opts = {
    flavour = "macchiato", -- Choose your flavour: latte, frappe, macchiato, mocha
    transparent_background = true, -- This enables transparency!
    term_colors = true, -- Update terminal colors as well
    integrations = {
      -- Enable integrations for plugins you use to make them match the theme
      aerial = true,
      cmp = true,
      dap = true,
      dap_ui = true,
      dashboard = true, -- if you use ui.dashboard-nvim extra
      flash = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      markdown = true, -- if you use lang.markdown extra
      mason = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      navic = true,
      neotest = true, -- if you use test.core extra
      neo_tree = false, -- if you use editor.neo-tree extra
      noice = true, -- if you use ui.noice extra
      notify = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      which_key = true,
      -- Add other integrations based on your enabled LazyVim extras
    },
    -- You can add custom highlight overrides here if needed
    -- custom_highlights = function(colors)
    --   return {
    --     NormalFloat = { bg = "none" }, -- Example
    --   }
    -- end,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-" .. opts.flavour) -- Important: apply the theme
  end,
}
