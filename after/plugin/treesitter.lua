require'nvim-treesitter.configs'.setup {
	ensure_installed = { "javascript", "python", "typescript", "c", "lua", "rust", "json", "html", "css", "scss" },
	sync_install = false,
	auto_install = true,
	
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
