require('lualine').setup({
    tabline = {
        lualine_a = {{
            'tabs',
            mode = 1,
            path = 1,
            max_length = vim.o.columns
        }},
        lualine_b = {},
        -- lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
})

