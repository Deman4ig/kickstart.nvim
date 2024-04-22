-- my fav keymaps
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open netrw' })
vim.keymap.set('n', '<leader>zz', vim.cmd.ZenMode, { desc = 'Start ZenMode' })
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>ll', function()
  vim.cmd '%!eslint_d --stdin --fix-to-stdout'
  vim.cmd 'w'
end)
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])

-- some random settings
vim.g.undotree_SetFocusWhenToggle = true

-- keep undotree history for ever
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'NVIM_HOME' .. 'undodir'
vim.opt.undofile = true

-- print(os.getenv 'NVIM_HOME' .. 'undodir')
-- some fav plugins
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {}
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', '<C-h>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-t>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-n>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<C-s>', function()
        harpoon:list():select(4)
      end)

      vim.keymap.set('n', '<leader>hc', function()
        harpoon:list():clear()
      end, { desc = '[H]arpoon [C]lear' })
      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
  },
  {
    'mbbill/undotree',
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle),
  },
  {
    'folke/trouble.nvim',
    opts = {},
    vim.keymap.set('n', '<leader>xx', function()
      require('trouble').toggle()
    end),
    vim.keymap.set('n', '<leader>xw', function()
      require('trouble').toggle 'workspace_diagnostics'
    end),
    vim.keymap.set('n', '<leader>xd', function()
      require('trouble').toggle 'document_diagnostics'
    end),
    vim.keymap.set('n', '<leader>xq', function()
      require('trouble').toggle 'quickfix'
    end),
    vim.keymap.set('n', '<leader>xl', function()
      require('trouble').toggle 'loclist'
    end),
  },
  {
    'folke/zen-mode.nvim',
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      --      require('mini.surround').setup()
      require('mini.pairs').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  {
    'tpope/vim-surround',
    config = function() end,
  },
  {
    'tpope/vim-fugitive',
    config = function() end,
  },
}
