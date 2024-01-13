local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- vim Ex mode
keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- delete without yanking
-- keymap.set('n', 'x', '"_x')

-- yank to clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])
-- delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Increment/decrement
keymap.set('n', '-', '<C-x>')
keymap.set('n', '+', '<C-a>')

keymap.set('n', '<C-a>', 'gg<S-v>G')
keymap.set('n', '<leader>sx', ':split<Return><C-w>w', opts)
keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w', opts)

-- Move window
keymap.set('n', 'sn', '<C-w>w')
keymap.set('', '<leader>h', '<C-w>h')
keymap.set('', '<leader>k', '<C-w>k')
keymap.set('', '<leader>j', '<C-w>j')
keymap.set('', '<leader>l', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Move selected line / block of text in visual mode
keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')
keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')

keymap.set('n', 'J', 'mzJ`z')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

keymap.set('n', '<C-n>', ':nohlsearch<CR>', opts)

keymap.set('n', '<leader>f', vim.lsp.buf.format)

-- keep cursor centered
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- paste without overwriting the default register
keymap.set('x', '<leader>p', [['_dP]])

keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })
keymap.set('n', '<leader>vp', '<cmd>e ~/.config/nvim/lua/mx-in/plugins.lua<CR>');
keymap.set('n', '<leader>vrmp', '<cmd>e ~/.config/nvim/lua/mx-in/remap.lua<CR>');
keymap.set('n', '<leader>vlsp', '<cmd>e ~/.config/nvim/after/plugin/lsp.lua<CR>');
keymap.set('n', '<leader>vtl', '<cmd>e ~/.config/nvim/after/plugin/telescope.lua<CR>');
keymap.set('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>');
keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<CR>');

-- reolad current file on normal mode
keymap.set('n', '<leader><leader>', function()
  vim.cmd('so')
end)

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Jumplist
keymap.set('n', '<C-m>', '<C-i>', opts)
