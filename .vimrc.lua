-- virtualenv config (handled by pyenv)
vim.g.python3_host_prog = "/Users/vishal/.pyenv/versions/pypom/bin/python"

-- LSP setup
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
require("lvim.lsp.manager").setup("ruff_lsp")

-- Linter setup
require("lvim.lsp.null-ls.linters").setup {
  {
    command = "mypy",
    extra_args = { "--strict" },
    filetypes = { "python" },
  }
}

-- DAP setup
local dap = require('dap')
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
  },
}

dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}
