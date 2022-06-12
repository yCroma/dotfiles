local null_ls = require('null-ls')

-- register any number of sources simultaneously
local sources = {
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
    end
  end,
})
