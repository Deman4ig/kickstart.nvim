vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open netrw' })
vim.keymap.set('n', '<leader>zz', vim.cmd.ZenMode, { desc = 'Start ZenMode' })
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

vim.keymap.set('n', '<leader>lef', vim.lsp.buf.format, { noremap = true, silent = true, desc = 'Format with ESLint' })
vim.keymap.set('n', '<leader>lth', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
