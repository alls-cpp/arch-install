return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
        require('lualine').setup {
            options = {
                --theme='gruvbox',
                icons_enabled = true,
                component_separators = '',
                section_separators = ''
            },
            sections = {
                lualine_a = {{'filename', path = 3}},
                lualine_b = {'diagnostics'},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {'filename'},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {
                lualine_a = {{'buffers',
                    buffers_color = {
                        active = {bg = '#b8bb26', fg = '#282828'},
                        inactive = {fg = '#b8bb26', bg = '#282828'},
                    },
            }}}
        }
    end
}
