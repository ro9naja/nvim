return {
  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      'lewis6991/gitsigns.nvim',
    },
    config = function()
      local status_ok, lualine = pcall(require, 'lualine')
      if not status_ok then
        return
      end




      lualine.setup {
        -- Global options
        -- https://github.com/nvim-lualine/lualine.nvim#global-options
        options = {
          icons_enabled = true,
          theme = 'tokyonight',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
            'NvimTree',
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          }
        },


        -- General component options
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff',
            {
              'diagnostics',
              sources = { 'nvim_lsp' },
            }
          },
          lualine_c = {
            { 'filename', path = 3 },
          },
          lualine_x = { "require'codeium.virtual_text'.status_string()", 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { 'filename', path = 3 },
          },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {
          lualine_a = {
            { 'filename', path = 0 }
          },
        },
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end
  },
}
