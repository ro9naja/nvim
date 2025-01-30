return {
  -- DAP
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  { "nvim-telescope/telescope-dap.nvim" },
  { "theHamsta/nvim-dap-virtual-text" },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("python3")
    end
  },
}
