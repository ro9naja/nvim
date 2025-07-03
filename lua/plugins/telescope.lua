return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-dap.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local status_ok, telescope = pcall(require, "telescope")
      if not status_ok then
        return
      end
      telescope.setup()
      telescope.load_extension('dap')
      telescope.load_extension("fzf")
    end
  },
}
