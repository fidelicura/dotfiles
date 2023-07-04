vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.linebreak = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.mouse = "a"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.scrolloff = 7
vim.opt.encoding = "utf-8"
vim.opt.fileformat = "unix"

vim.keymap.set('n', '<S-K>', vim.lsp.buf.hover, {})
