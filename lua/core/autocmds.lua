-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: :h api-autocmd, :h augroup
-- https://neovim.io/doc/user/autocmd.html

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-----------------------------------------------------------
-- General settings
-----------------------------------------------------------

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- AutoFormating on save
-- augroup('AutoFormatting', {})
-- autocmd('BufWritePre', {
--   pattern = { '*.lua', '*.py', '*.js', '*.html', '*.css', '*.json', '*.jsonc' },
--   group = 'AutoFormatting',
--   callback = function()
--     vim.lsp.buf.format({ async = true })
--   end,
-- })

autocmd('LspAttach', {
  group = augroup("lsp", { clear = true }),
  callback = function(args)
    autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({ async = false, id = args.data.client_id })
      end,
    })
  end
})

-----------------------------------------------------------
-- Settings for filetypes
-----------------------------------------------------------

-- Disable line length marker
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
    'yaml', 'lua', 'zsh'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Go.nvim
local format_sync_grp = augroup("GoFormat", {})
autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local status_ok, gf = pcall(require, 'go.format')
    if not status_ok then
      return
    end
    gf.goimports()
  end,
  group = format_sync_grp,
})
