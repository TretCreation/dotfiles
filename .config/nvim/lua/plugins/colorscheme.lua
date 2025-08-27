return {
  "catppuccin/nvim",
  name = "catppuccin",
  -- version = "*",
  commit = "cb5665990a797b102715188e73c44c3931b3b42e",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      float = {
        transparent = true,
        solid = true,
      },
      auto_integrations = true,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
