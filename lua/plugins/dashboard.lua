return {

  -- Dashboard (start screen)
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      local status_ok, alpha = pcall(require, 'alpha')
      if not status_ok then
        return
      end

      local dashboard = require('alpha.themes.dashboard')

      -- Footer
      local function footer()
        local version = vim.version()
        local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
        local datetime = os.date('%Y/%m/%d %H:%M:%S')

        return print_version .. ' - ' .. datetime
      end

      -- Banner
      local banner = {
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▒░░░░░░░░░░░░░░░░█▒░░░░░░░░░▓▓░░░░▓░▓▒░░░░░░░░░░░░░░░░",
        "░░█▒░░░░░░░▓▓░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒░░░░░░▒█▒░░░░░▒░░▒▒▒▒▒▒█▓▒▒▒▒░░░░░░░▒░░░░░░░░░░░▒▓░░░░░░░░░░",
        "░░█▒░░░░░░░▓▓░░▒▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓░░░░░░░░█▒░░░░░░░▓▓▒░░░░░░▓▓░░░░▒▒█▓▒▒▒▓█░░░░",
        "░░█▒░░░░░░░▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓█▒░░░░░░░░▒█░░░░░░░░░░░░░░░▓█▒░░░░░░░▒█░░▒▓░░░░░",
        "░░█▒▒▒▒▒▒▒▒█▓░░░░░░░░░░░░░░░░▒▓▒▒▒▒▒▒▒▒▓▒░░░░░░▒▓▓▓▒░░░░░░░░░▒█░░░░░░░░░░░░░▒▓▓▒░░░░░░░░░░█▒░░░░░░░░",
        "░░▓▒▒▒▒▒▒▒▒▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▓▓▒░░░░░░░░░░░▒▓▒░░░░░░░░░░▒▓▓▒░░░░░░░░░░░░░░▒█░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ r o 9 n a j a ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
        "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      }

      dashboard.section.header.val = banner

      -- Menu
      dashboard.section.buttons.val = {
        dashboard.button('e', '  New file', ':ene <BAR> startinsert<CR>'),
        dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
        dashboard.button('s', '  Settings', ':e $MYVIMRC<CR>'),
        dashboard.button('u', '  Update plugins', ':Lazy update<CR>'),
        dashboard.button('q', '  Quit', ':qa<CR>'),
      }

      dashboard.section.footer.val = footer()

      alpha.setup(dashboard.config)
    end,
  },

}
