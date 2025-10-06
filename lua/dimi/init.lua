require("dimi.set")
require("dimi.packer")
require("dimi.remap")
require("dimi.diagnostics")
require("mason").setup()
vim.lsp.config["lua_ls"] = {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace   = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
}
vim.lsp.config["basedpyright"] = {
}

vim.lsp.enable("lua_ls")
vim.lsp.enable("basedpyright")
vim.lsp.enable("typerscirpt-language-server")
vim.cmd("colorscheme catppuccin")

