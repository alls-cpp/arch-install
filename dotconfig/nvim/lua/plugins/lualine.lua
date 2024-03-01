local black = '#1C1C1C'
local white = '#AFAFAF'
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
        require('lualine').setup {
            options = {
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {{'buffers',
                    buffers_color = {
                        active = { bg = black, fg = white },
                        inactive = { bg = white, fg = black },
                    }
                }},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {'diagnostics', 'filesize'},
                lualine_z = {'location'},
            },
            inactive_sections = {
                lualine_a = {'filename'},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        }
    end,
}
