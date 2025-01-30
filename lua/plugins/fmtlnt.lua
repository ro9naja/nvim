return {
  {
    "nvimdev/guard.nvim",
    -- lazy load by ft
    ft = { "lua", "c", "markdown", "python", "rust" },
    -- Builtin configuration, optional
    dependencies = {
      "nvimdev/guard-collection",
    },
    config = function()
      local guard_status_ok, guard = pcall(require, "guard")
      if not guard_status_ok then
        return
      end

      guard.setup()

      local gft_status_ok, gft = pcall(require, "guard.filetype")
      if not gft_status_ok then
        return
      end

      gft("python"):fmt("ruff"):lint("ruff")
      gft("lua"):fmt("lsp"):append("stylua"):lint("selene")

      vim.g.guard_config = {
        fmt_on_save = true,
        lsp_as_default_formatter = true,
      }
    end,
  },

  --- Comment
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
}
