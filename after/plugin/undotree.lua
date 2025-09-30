-- ensure undo persistence
local undodir = vim.fn.stdpath('state') .. '/undo'
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, 'p')
end
vim.o.undodir = undodir
vim.o.undofile = true

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
