require("telescope").setup({
	defaults = {
		file_ignore_patterns = {}, -- optional
		hidden = true,
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		git_files = {
			hidden = true,
		},
	},
})

require("telescope").load_extension("projects")
local tb = require("telescope.builtin")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>op", function()
	require("telescope").extensions.projects.projects({})
end)
vim.keymap.set("n", "<leader>pf", tb.find_files, { desc = "Find files" })
vim.keymap.set("n", "<C-p>", tb.git_files, { desc = "Git files" })
vim.keymap.set("n", "<leader>ps", function()
	tb.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep string" })
vim.keymap.set("n", "<leader>op", function()
	require("telescope").extensions.projects.projects({})
end, { desc = "Projects picker" })
