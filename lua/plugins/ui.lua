return {
  -- Icons
  { 'kyazdani42/nvim-web-devicons', lazy = true },
  { 'echasnovski/mini.nvim', version = '*' },

  -- Git Labels
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('gitsigns').setup {}
    end
  },

  -- Indent line
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = "▎" },
      exclude = {
        filetypes = {
          'lspinfo',
          'packer',
          'checkhealth',
          'help',
          'man',
          'dashboard',
          'git',
          'markdown',
          'text',
          'terminal',
          'NvimTree',
        },

        buftypes = {
          'terminal',
          'nofile',
          'quickfix',
          'prompt',
        },
      },
    }
  },

  -- Tag viewer
  { 'preservim/tagbar' },

  -- Autopair
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {}
    end
  },

  -- Which key
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
  },

  -- colorizer
  { 'norcalli/nvim-colorizer.lua' },

}
