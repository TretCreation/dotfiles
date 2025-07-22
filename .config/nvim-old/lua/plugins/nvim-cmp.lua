-- disable custom config
if true then
  return {}
end

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.completion.autocomplete = false
      opts.mapping["<cr>"] = nil
      opts.window = {
        completion = {
          border = {
            { "󱐋", "warningmsg" },
            { "─", "comment" },
            { "╮", "comment" },
            { "│", "comment" },
            { "╯", "comment" },
            { "─", "comment" },
            { "╰", "comment" },
            { "│", "comment" },
          },
          scrollbar = false,
          winblend = 0,
        },
        documentation = {
          border = {
            { "󰙎", "diagnostichint" },
            { "─", "comment" },
            { "╮", "comment" },
            { "│", "comment" },
            { "╯", "comment" },
            { "─", "comment" },
            { "╰", "comment" },
            { "│", "comment" },
          },
          scrollbar = false,
          winblend = 0,
        },
      }
      table.insert(opts.sources, { name = "luasnip" })
    end,
  },
}
