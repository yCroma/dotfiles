require('formatter').setup({
  filetype = {
    html = {
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
          },
          stdin = true,
        }
      end,
    },
    json = {
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            '--double-quote',
          },
          stdin = true,
        }
      end,
    },
    lua = {
      function()
        return {
          exe = 'stylua',
          args = {
            '--column-width 120 '
              .. '--line-endings Unix '
              .. '--indent-type Spaces '
              .. '--indent-width 2 '
              .. '--quote-style AutoPreferSingle '
              .. '--call-parentheses Always ',
            '-',
          },
          stdin = true,
        }
      end,
    },
    typescriptreact = {
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
          },
          stdin = true,
        }
      end,
    },
  },
})
