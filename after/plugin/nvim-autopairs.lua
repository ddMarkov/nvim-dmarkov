-- Jump out of brackets/quotes in insert mode
vim.keymap.set("i", "<C-l>", function()
	local next_char = vim.fn.strpart(vim.fn.getline("."), vim.fn.col(".") - 1, 1)
	if next_char:match("[%]%)}%>\"']") then
		return "<Right>"
	else
		return "<C-l>"
	end
end, { expr = true, noremap = true, silent = true, desc = "Jump out of pairs" })
