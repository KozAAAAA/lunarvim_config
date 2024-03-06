-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- General
lvim.colorscheme = 'onedarker'

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
}

-- Fix multiple offset_encoding not supported yet
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }
local opts = { capabilities = capabilities }
require("lvim.lsp.manager").setup("clangd", opts)

-- Treat .h files as C
vim.api.nvim_command('autocmd BufNewFile,BufRead *.h set filetype=c')

-- Set tab width to 4
vim.api.nvim_command('autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 expandtab')
