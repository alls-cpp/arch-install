return {
  -- {
  --   "tanvirtin/monokai.nvim",
  --   name = "monokai",
  --   priority = 1000,
  --   config = function()
  --       vim.cmd.colorscheme "monokai_ristretto"
  --   end
  -- }
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'light' -- or 'dark'
      vim.cmd.colorscheme 'solarized'
    end,
  }
}
