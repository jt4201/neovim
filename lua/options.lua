local opt = vim.opt

opt.wrap = false
opt.breakat = ' ,;()'
opt.breakindent = true
opt.breakindentopt = 'shift:3'
opt.showbreak = '--> '
opt.linebreak = true

opt.clipboard:append('unnamedplus')

opt.undofile = true

opt.scrolloff = 1

opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.number = true
opt.relativenumber = true
opt.signcolumn = 'number'

opt.confirm = true
opt.showmode = false

opt.swapfile = false

opt.wildmode = 'longest:full,full'

vim.opt.fillchars = {
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┫',
  vertright = '┣',
  verthoriz = '╋',
}
vim.opt.laststatus = 3
