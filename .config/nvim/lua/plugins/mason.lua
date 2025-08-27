return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "typescript-language-server",
        "eslint-lsp",
        "html-lsp",
        "stylelint",
        "json-lsp",
        "tailwindcss-language-server",
        "prisma-language-server",
        "stylua",

        -- Formatters
        "prettierd",
      },
    },
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
