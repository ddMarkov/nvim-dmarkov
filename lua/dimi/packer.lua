-- bootstrap packer if needed (optional, keep if you already have it elsewhere)
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer manages itself
	use("wbthomason/packer.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Theme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Harpoon v2
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Undo tree
	use("mbbill/undotree")

	-- LSP + Mason (we’ll wire in dimi/lsp.lua)
	use("neovim/nvim-lspconfig")
	use("mason-org/mason.nvim")
	use("mason-org/mason-lspconfig.nvim")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				map_cr = true,
				map_bs = true,
				enable_afterquote = true,
				fast_wrap = {},
			})
		end,
	})

	-- ToggleTerm
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- Neo-tree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	})

	-- project.nvim
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	})

	-- which-key
	use("folke/which-key.nvim")

	-- DAP
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")

	-- *** FORMATTER: Conform (correct place, no nested startup) ***
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- chain ruff format + fixes (pycharm-like)
					python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
				},
				notify_on_error = true,

				-- Force how to run ruff via uvx so PATH/venv doesn’t matter
				formatters = {
					ruff_format = {
						command = "uvx",
						args = { "ruff", "format", "--stdin-filename", "$FILENAME", "--quiet", "-" },
						stdin = true,
					},
					ruff_fix = {
						command = "uvx",
						args = { "ruff", "check", "--fix", "--stdin-filename", "$FILENAME", "-" },
						stdin = true,
					},
					ruff_organize_imports = {
						command = "uvx",
						args = { "ruff", "check", "--select", "I", "--fix", "--stdin-filename", "$FILENAME", "-" },
						stdin = true,
					},
				},
			})
			-- On-save formatting (safe here: plugin is loaded)
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.lua", "*.py" }, -- narrow to what you want
				callback = function(args)
					require("conform").format({

						bufnr = args.buf,
						lsp_fallback = true, -- if no external formatter, use LSP
						async = false,
						timeout_ms = 3000,
					})
				end,
			})

			-- Manual “Code Reformat” like PyCharm
			vim.keymap.set("n", "<leader>cr", function()
				require("conform").format({ lsp_fallback = true })
			end, { desc = "Code Reformat" })
		end,
	})
end)
