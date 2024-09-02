vim.keymap.set('n', '<space>', '<nop>')
vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('i', 'jj', '<esc>')
vim.keymap.set('i', 'jk', '<esc>')

vim.keymap.set({ 'i', 'n' }, '<esc>', [[<cmd>noh<cr><esc>]])

vim.keymap.set('n', [[\h]], ':let v:hlsearch = 1 - v:hlsearch<cr>')
vim.keymap.set('n', [[\w]], [[<cmd>setlocal wrap!<cr>]])
vim.keymap.set('n', [[\n]], [[<cmd>setlocal number!<cr>]])
vim.keymap.set('n', [[\r]], [[<cmd>setlocal relativenumber!<cr>]])
vim.keymap.set('n', [[\c]], [[<cmd>setlocal cursorline!<cr>]])

vim.keymap.set('n', '[B', '<cmd>bfirst<cr>')
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>')
vim.keymap.set('n', ']b', '<cmd>bnext<cr>')
vim.keymap.set('n', ']B', '<cmd>blast<cr>')
vim.keymap.set('n', '<s-h>', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<s-l>', '<cmd>bnext<cr>')

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- add blank line above/below
vim.keymap.set('n', '[<space>', [[<cmd>put! =repeat(nr2char(10), v:count1)<cr>'[]])
vim.keymap.set('n', ']<space>', [[<cmd>put =repeat(nr2char(10), v:count1)<cr>]])

-- Paste before/after linewise
vim.keymap.set({ 'n', 'x' }, '[p', '<Cmd>exe "put! " . v:register<CR>')
vim.keymap.set({ 'n', 'x' }, ']p', '<Cmd>exe "put "  . v:register<CR>')

vim.keymap.set({ 'v', 'x' }, 'x', '"_x')
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', ';', ';<c-g>u')

vim.keymap.set('n', '<leader>ef', [[<cmd>lua require('mini.files').open()<cr>]])
vim.keymap.set('n', '<leader>eh', [[<cmd>lua require('mini.files').open('~')<cr>]])

vim.keymap.set('n', '<leader>f/', [[<cmd>Pick history scope="/"<cr>]])
vim.keymap.set('n', '<leader>f:', [[<cmd>Pick history scope=":"<cr>]])
vim.keymap.set('n', '<leader>fb', [[<cmd>Pick buffers<cr>]])
vim.keymap.set('n', '<leader>ff', [[<cmd>Pick files<cr>]])
vim.keymap.set('n', '<leader>fo', [[<cmd>Pick oldfiles<cr>]])
