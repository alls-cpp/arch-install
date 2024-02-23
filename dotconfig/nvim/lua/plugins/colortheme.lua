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
    'shaunsingh/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'solarized'
    end,
  }
}
