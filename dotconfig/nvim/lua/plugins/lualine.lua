local colors = {
    blue   = '#a8a9eb',
    cyan   = '#85dacc',
    black  = '#2c2525',
    green  = '#adda78',
    yellow = '#f9cc6c',
    white  = '#fff1f3',
    red    = '#fd6883',
    violet = '#f38d70',
    grey   = '#403838',
}
local miao = {
    normal = { a = { fg = colors.black, bg = colors.cyan }, c = { fg = colors.white, bg = colors.black }},
    insert = { a = { fg = colors.black, bg = colors.blue }, c = { fg = colors.white, bg = colors.black }},
    visual = { a = { fg = colors.black, bg = colors.violet }, c = { fg = colors.white, bg = colors.black }},
    command = { a = { fg = colors.black, bg = colors.yellow }, c = { fg = colors.white, bg = colors.black }},
    replace = { a = { fg = colors.black, bg = colors.blue }, c = { fg = colors.white, bg = colors.black }},
    inactive = { a = { fg = colors.white, bg = colors.black }}
}

return {
    "nvim-lualine/lualine.nvim",
    config = function()
require('lualine').setup {
    options = {
        theme = miao,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {{'buffers',
                        buffers_color = {
                            active = { bg = colors.white, fg = colors.black },
                            inactive = { bg = colors.black, fg = colors.white },
                        }
                    }},
        lualine_c = {'branch', 'diagnostics'},
        lualine_x = {},
        lualine_y = {'filesize'},
        lualine_z = {'location'},
    },
    inactive_sections = {
        lualine_a = {{'filename',
                    symbols = {
                        modified = '●'
                    }
                    }},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
}
    end,
}
