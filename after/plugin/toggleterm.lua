local Terminal = require("toggleterm.terminal").Terminal

local horizontalTerminal = Terminal:new({
  size = 15,
  dir = vim.fn.getcwd(),     -- use current working directory
  direction = "horizontal",
})

local verticalTerminal = Terminal:new({
    size = 10,
    dir = vim.fn.getcwd(),
    direction = "vertical",
})
function callTerminal(shortcut, terminal)
    vim.keymap.set("n", shortcut, function()
        terminal:toggle()
    end, { desc = "Toggle terminal in cwd" })
end

callTerminal("<leader>th", horizontalTerminal)
callTerminal("<leader>tv", verticalTerminal)
