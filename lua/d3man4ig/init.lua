vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open netrw' })
vim.keymap.set('n', '<leader>zz', vim.cmd.ZenMode, { desc = 'Start ZenMode' })
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

vim.keymap.set('n', '<leader>ll', function()
  vim.cmd '%!eslint_d --stdin --fix-to-stdout'
  vim.cmd 'w'
end)

vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
