local ok, wk = pcall(require, "which-key")
if not ok then return end

wk.setup({
  window = { border = "rounded", padding = {1,2} },
  key_labels = { ["<leader>"]="SPC", ["<cr>"]="RET", ["<tab>"]="TAB" },
})

wk.add({
  { "<leader>f", group = "find" },
  { "<leader>g", group = "git" },
  { "<leader>p", group = "project" },
  { "<leader>t", group = "terminal" },
  { "<leader>e", desc  = "Explorer: toggle" },
  { "<leader>u", desc  = "Undotree" },
})
