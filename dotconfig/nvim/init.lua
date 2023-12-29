-- SET
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- autosave
vim.cmd [[autocmd BufLeave,FocusLost * silent! wall]]
vim.cmd [[set matchpairs+=<:>]]
vim.cmd [[set noshowmode]]

-- remap space as leader key
vim.g.mapleader = " "

-- from insert to normal mode
vim.keymap.set("i", "jk", "<Esc>")

-- move lines up and down in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- staying in the center of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste in visual mode without losing the clipboard contents
vim.keymap.set("v", "p", [["_dP]])
vim.keymap.set("x", "p", [["_dP]])

-- yank to system clipboard for external use
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete without yanking
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- substitute word under cursor
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- stay in indent mode
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- import from library
vim.keymap.set("n", "<C-l>", ":r /home/alls/CompetitiveProgramming/Library/")

vim.keymap.set('n', '<C-;>', ':lua require("copilot.suggestion").toggle_auto_trigger()<CR>', { noremap = true, silent = true })

-- PLUGINS
require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }
    use 'numToStr/Comment.nvim'
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    }
    use 'norcalli/nvim-colorizer.lua'
    use 'tanvirtin/monokai.nvim'
    use {
	    'nvim-lualine/lualine.nvim',
	    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
end)

require('monokai').setup { palette = require('monokai').ristretto }

-- lualine
-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#a8a9eb',
  cyan   = '#85dacc',
  black  = '#2c2525',
  white  = '#fff1f3',
  red    = '#fd6883',
  violet = '#f38d70',
  grey   = '#403838',
}

local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.cyan },
        b = { fg = colors.cyan, bg = colors.grey },
    },
    insert = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.blue, bg = colors.grey },
    },
    visual = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.violet, bg = colors.grey },
    },
    replace = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.blue, bg = colors.grey },
    },
    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}

require('lualine').setup {
    options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch', 'diagnostics' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
}

require('colorizer').setup()
-- Attach Colorizer to every buffer
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.cmd('ColorizerAttachToBuffer')
    end,
})

require('Comment').setup()
  vim.keymap.set('n', '<C-/>', "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>")
  vim.keymap.set('v', '<C-/>', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
  vim.keymap.set('x', '<C-/>', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "python", "vim", "cpp" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
}
require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.clangd.setup{}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  end,
})
