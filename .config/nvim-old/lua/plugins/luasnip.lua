return {
  "L3MON4D3/LuaSnip",
  opts = {
    history = true,
    region_check_events = "InsertEnter",
    delete_check_events = "TextChanged,InsertLeave",
  },
  config = function()
    -- Lazy load custom snippets from your folder
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "" } })
  end,
}
