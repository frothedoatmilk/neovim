-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.shell = "fish"
vim.o.guicursor = "a-c-ci:ver15,n-v:block,r-cr:hor15"

-- LazyVim's noice.nvim plugin uses some silly business to render the cursor, so this will reset on exit
vim.api.nvim_create_autocmd("ExitPre", {
  group = vim.api.nvim_create_augroup("Exit", { clear = true }),
  command = "set guicursor=a:ver90",
  desc = "Set cursor back to beam when leaving Neovim.",
})
