-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end,
  },

  {
    'm4xshen/autoclose.nvim',
    version = '*',
    lazy = false,
    dependencies = {},
    config = function()
      require('autoclose').setup {}
    end,
  },

  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {}
    end,
  },

  {
    'bluz71/vim-nightfly-colors',
    version = false,
    name = 'nightfly',
    lazy = false,
    priority = 1000,
  },
}
