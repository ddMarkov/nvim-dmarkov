-- ensure mason and mason-lspconfig are loaded first
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "basedpyright", "ts_ls" }, -- ts_ls = new tsserver
})

-- optional: nvim-cmp capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- === Lua ===
vim.lsp.config["lua_ls"] = {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
}

-- === Python ===
vim.lsp.config["basedpyright"] = {
	capabilities = capabilities,
}

-- === TypeScript / JavaScript ===
vim.lsp.config["ts_ls"] = {
	capabilities = capabilities,
}

-- enable all configured servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("basedpyright")
vim.lsp.enable("ts_ls")
