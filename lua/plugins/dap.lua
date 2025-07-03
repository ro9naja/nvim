return {
  -- DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "suketa/nvim-dap-ruby",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require("dap-python").setup("python3")
      require('dap-ruby').setup()
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
  },
}
