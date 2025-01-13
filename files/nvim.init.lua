vim.cmd.colorscheme('koehler')

local o = vim.o
o.title = true
o.mouse = 'a'
o.clipboard = 'unnamedplus'
o.number = true
o.relativenumber = true
o.numberwidth = 4
o.laststatus = 2
o.cursorline = true
o.cursorlineopt = 'number'
o.wildmode = 'longest:full,full'
o.ignorecase = true
o.smartcase = true
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.textwidth = 80
o.breakindent = true
o.colorcolumn = '+1'
o.signcolumn = 'number'

local k = vim.keymap
k.set('', 'Q', 'gq', { desc = "Replace ex mode with gq" })
k.set('', '<C-h>', '<C-w>h', { desc = "switch to left window" })
k.set('', '<C-j>', '<C-w>j', { desc = "switch to window below" })
k.set('', '<C-k>', '<C-w>k', { desc = "switch to window up" })
k.set('', '<C-l>', '<C-w>l', { desc = "switch to right window" })
k.set('n', '<leader>e', '<cmd>Lexplore<cr>', { noremap = true, desc = "Toggle netrw" })

local g = vim.g
g.netrw_altv = 1
g.netrw_banner = 0
g.netrw_browse_split = 4
g.netrw_liststyle = 3
g.netrw_preview = 1
g.netrw_sizestyle = "H"
g.netrw_winsize = 20

local a = vim.api
a.nvim_create_autocmd("BufWritePost", {
  pattern = vim.fn.expand('$HOME') .. '/.config/sxhkd/sxhkdrc',
  command = '!kill -10 $(pidof sxhkd)',
})

if a.nvim_get_option_value('diff', { win = 0 }) then
  o.diffopt = 'filler,context:1000000'
end

