-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

function _G.toggle_background()
  if vim.o.background == 'dark' then
    vim.cmd 'set bg=light'
  else
    vim.cmd 'set bg=dark'
  end
end

vim.keymap.set('n', '<leader>cc', toggle_background, {})

vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, { desc = '[F]ormat [F]ile' })
vim.keymap.set('n', '<leader>tf', '<Cmd>ToggleAutoFormat<CR>', { desc = '[T]oggle Auto [F]ormat' })

vim.keymap.set('n', '<leader>gt', require('telescope.builtin').git_status, { desc = 'Search [G]it S[T]atus' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = 'Find Files' })

vim.keymap.set('n', '<C-n>', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neotree' })

vim.keymap.set('n', '<leader>w', '<cmd>close<cr>', { desc = "Close current buffer" })
vim.keymap.set('n', '<C-A-left>', '<C-w>h', { desc = "Move to left window" })
vim.keymap.set('n', '<C-A-right>', '<C-w>l', { desc = "Move to right window" })
vim.keymap.set('n', '<C-A-up>', '<C-w>k', { desc = "Move to top window" })
vim.keymap.set('n', '<C-A-down>', '<C-w>j', { desc = "Move to bottom window" })

vim.keymap.set('n', '<A-down>', '<cmd>:m .+1<cr>==', {})
vim.keymap.set('n', '<A-up>', '<cmd>:m .-2<cr>==', {})
vim.keymap.set('i', '<A-down>', '<esc><cmd>:m .+1<cr>==gi', {})
vim.keymap.set('i', '<A-up>', '<esc><cmd>:m .-2<cr>==gi', {})

vim.keymap.set('v', '<A-down>', ":m '>+1<cr>gv=gv", {})
vim.keymap.set('v', '<A-up>', ":m '<-2<cr>gv=gv", {})

vim.keymap.set('n', '<tab>', '<cmd>BufferNext<cr>', {})
vim.keymap.set('n', '<S-tab>', '<cmd>BufferPrevious<cr>', {})
vim.keymap.set('n', '<C-w>', '<cmd>BufferClose<cr>', {})

vim.keymap.set('n', '<C-_>', '<esc><cmd>lua require("Comment.api").locked("toggle.linewise.current")()<cr>', {})
vim.keymap.set('v', '<C-_>', '<esc><cmd>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())<cr>',
  {})

vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', '<cmd>update<cr>')
-- vim: ts=2 sts=2 sw=2 et
