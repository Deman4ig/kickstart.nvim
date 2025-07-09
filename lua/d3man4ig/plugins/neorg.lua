return {
  'nvim-neorg/neorg',
  lazy = false,
  version = '*',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.keybinds'] = {
          config = {
            hook = function(keybinds)
              vim.g.maplocalleader = ','
            end,
          },
        },
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/projects/notes',
            },
            default_workspace = 'notes',
          },
        },
      },
    }
  end,
}
