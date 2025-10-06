vim.diagnostic.config({
  update_in_insert = true,  -- show as you type, not just after leaving Insert
  virtual_text = true,      -- inline warnings/errors (the squiggles/messages)
  underline = true,         -- underline offending code
  signs = true,             -- W/E icons in the sign column
  severity_sort = true,     -- errors above warnings
})
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
  end,
})

