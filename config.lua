lvim.colorscheme = 'onedarker'

vim.opt.relativenumber = true

-- Plugins
lvim.plugins = {
  {
    'github/copilot.vim',
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
    config = function()
      vim.keymap.set('i', '<C-a>', [[copilot#Accept("\<CR>")]], {
        silent = true,
        expr = true,
        script = true,
        replace_keycodes = false,
      })
    end,
  },
  {
    'lambdalisue/suda.vim',
  },
}

-- Fix multiple offset_encoding not supported yet
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }
local opts = { capabilities = capabilities }
require("lvim.lsp.manager").setup("clangd", opts)

-- Set tab width to 2
vim.api.nvim_command('autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2 expandtab')

-- Indentation to 2 spaces
vim.api.nvim_command('autocmd FileType c,cpp set formatprg=clang-format | set equalprg=clang-format')

-- Suda save with wq
vim.g.suda_smart_edit = 1
