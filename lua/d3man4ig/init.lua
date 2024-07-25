vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open netrw' })
vim.keymap.set('i', '<C-c>', '<Esc>')

-- lsp keymaps
vim.keymap.set('n', '<leader>lef', function()
  vim.notify 'Runnin ESLint fix'
  vim.lsp.buf.format()
  vim.cmd 'write'
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>lth', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

-- yank/paste to/from system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set({ 'n', 'v' }, '<leader>p', [["+p]])
