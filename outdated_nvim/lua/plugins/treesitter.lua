return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" }, -- load when a buffer is opened or created
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                sync_install = true,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    }
}
