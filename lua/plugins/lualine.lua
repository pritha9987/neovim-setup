return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
                theme = 'catppuccin-mocha'
            },
            sections = {
               lualine_a = {
                  {
                     'mode',
                  }
               },
               lualine_b = {{'buffers',
                   mode = 4,
               }},
               lualine_c = {'diagnostics'},
               lualine_x = {
                  {
                     'filename',
                     file_status = true,
                     symbols = {
                        modified = '[M]',      -- Text to show when the file is modified.
                        readonly = '[RO]',      -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[No Name]', -- Text to show for unnamed buffers.
                        newfile = '[New]',     -- Text to show for newly created file before first write
                      }
                  }
               },
               lualine_y = {'progress'},
               lualine_z = {'location'}
            },
        })
    end
}
