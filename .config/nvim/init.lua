-- default
require('indent')
require('maps')
require('fold')
require('plugins')

vim.cmd('filetype plugin indent on')

vim.cmd('set backspace=2')
-- vim.cmd('set nocompatible') Nvim is always "nocompatible"
vim.opt.syntax = 'enable'
vim.opt.number = true
vim.opt.wrap = false
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 1
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = 'a'
vim.opt.wildmenu = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.list = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--vim.cmd("set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%")
vim.cmd('set listchars=tab:»-,trail:-,nbsp:%')

-- requirements for colorscheme
vim.opt.termguicolors = true
vim.g.sonokai_style = 'espresso'
vim.cmd('colorscheme sonokai')

-- requirements for statusline && buftabline
vim.opt.cursorline = true
vim.opt.showtabline = 2
vim.opt.hidden = true

-- requirements for plugins
vim.opt.encoding = 'UTF-8'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Save fold settings.
vim.cmd('augroup remember_folds')
vim.cmd('autocmd!')
vim.cmd("autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif")
vim.cmd("autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif")
vim.cmd('augroup END')
-- Don't save options.
vim.cmd('set viewoptions-=options')

-- plugins
-- gina
vim.cmd([[
call gina#custom#command#option("show", "--group", "gitshow")
call gina#custom#command#option("show", "--opener", "bo vsplit")

augroup gina_init
autocmd!
  autocmd Filetype gina-log nmap <buffer> l <Plug>(gina-show)zv
  autocmd Filetype git nmap <buffer> h :q<CR>
  autocmd Filetype gina-log nmap <buffer> j j<Plug>(gina-show)zv<C-h>
  autocmd Filetype gina-log nmap <buffer> k k<Plug>(gina-show)zv<C-h>
  autocmd Filetype gina-log nmap <buffer> <C-d> j<Plug>(gina-show)zv<C-h>
  autocmd Filetype gina-log nmap <buffer> <C-u> k<Plug>(gina-show)zv<C-h>
augroup END')
]])

-- devicons
require('nvim-web-devicons').setup({
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = '',
      color = '#428850',
      cterm_color = '65',
      name = 'Zsh',
    },
  },
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
})
-- statusline
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'sonokai',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {}, -- Filetypes to disable lualine for.
    always_divide_middle = true, -- When set to true, left sections i.e. 'a','b' and 'c'
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'tabs' },
  },
  extensions = {},
})
require('nvim_comment').setup()

-- lsp
-- start up lsp
local lsp_installer_servers = require('nvim-lsp-installer.servers')
local server_available, requested_server = lsp_installer_servers.get_server('rust_analyzer')
if server_available then
  requested_server:on_ready(function()
    local opts = { 'bashls', 'html', 'rust_analyzer', 'sumneko_lua', 'tsserver', 'vimls' }
    requested_server:setup(opts)
    opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  end)
  if not requested_server:is_installed() then
    -- Queue the server to be installed
    requested_server:install()
  end
end

-- lsp client
--local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>ee', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- lsp setup (for path injection)
local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local default_opts = {
    on_attach = on_attach,
  }

  -- Now we'll create a server_opts table where we'll specify our custom LSP server configuration
  local server_opts = {
    -- Provide settings that should only apply to the "eslintls" server
    ['eslintls'] = function()
      default_opts.settings = {
        format = {
          enable = true,
        },
      }
    end,
    ['sumneko_lua'] = function()
      default_opts.settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' },
          },
        },
      }
    end,
  }

  -- Use the server's custom settings, if they exist, otherwise default to the default options
  local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  server:setup(server_options)
end)

-- complition

-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

require('formatter').setup({
  filetype = {
    javascript = {
      -- prettier
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            '--print-width 80 --tab-width 2 --use-tabs false --single-quote --quote-props as-needed --trailing-comma es5 --arrow-parens always',
          },
          stdin = true,
        }
      end,
    },
    typescriptreact = {
      -- prettier
      function()
        return {
          exe = 'prettier',
          args = {
            '--stdin-filepath',
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            '--print-width 80 --tab-width 2 --use-tabs false --single-quote --quote-props as-needed --trailing-comma es5 --arrow-parens always',
          },
          stdin = true,
        }
      end,
    },
    lua = {
      -- stylua
      function()
        return {
          exe = 'stylua',
          args = {
            '--search-parent-directories',
            '-',
          },
          stdin = true,
        }
      end,
    },
  },
})

-- stylua: ignore
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.rs,*.lua FormatWrite
augroup END
]],true)
-- stylua: ignore <end>

-- fzf
require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      '^%.git/*',
    },
    sorting_strategy = 'ascending',
    layout_storategy = 'flex',
    layout_config = {
      height = 0.9,
      width = 0.95,
      preview_cutoff = 20,
      prompt_position = 'top',
      mirror = false,
      -- flex = {
      --   flip_columns = 65,
      -- },
    },
    mappings = {
      n = {
        ['<C-s>'] = require('telescope.actions.layout').toggle_preview,
      },
      i = {
        ['<C-s>'] = require('telescope.actions.layout').toggle_preview,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    file_browser = {
      hidden = true,
    },
  },
})

-- indent guide
-- exclude filetype
vim.cmd(
  "let g:indent_blankline_filetype_exclude = ['gina-status','git','lsp-installer','markdown','help','NvimTree', 'quickrun', 'packer', 'lir']"
)
-- color for indent
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
-- indent_blankline
require('indent_blankline').setup({
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = {
    'IndentBlanklineIndent1',
    'IndentBlanklineIndent2',
    'IndentBlanklineIndent3',
    'IndentBlanklineIndent4',
    'IndentBlanklineIndent5',
    'IndentBlanklineIndent6',
  },
})

-- scroll bar
local sonokai_configuration = vim.fn['sonokai#get_configuration']()
local colors = vim.fn['sonokai#get_palette'](sonokai_configuration.style)
require('scrollbar').setup({
  handle = {
    color = colors.fg[1],
  },
  marks = {
    Search = { color = colors.orange[1] },
    Error = { color = colors.red[1] },
    Warn = { color = colors.yellow[1] },
    Info = { color = colors.blue[1] },
    Hint = { color = colors.green[1] },
    Misc = { color = colors.purple[1] },
  },
  handlers = {
    diagnostic = true,
    search = true,
  },
  excluded_filetypes = {
    'NvimTree',
    'lir',
    'packer',
    'Outline',
    'git',
  },
})
-- hlslens
require('scrollbar.handlers.search').setup({
  calm_down = true,
  nearest_only = true,
  nearest_float_when = 'always',
})

-- preview markdown
vim.cmd("let g:bufpreview_server_host = '0.0.0.0'")
vim.cmd('let g:bufpreview_server_port = 9999')

-- for outliner
vim.g.symbols_outline = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = true,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = { '<Esc>', 'q' },
    goto_location = '<Cr>',
    focus_location = 'o',
    hover_symbol = '<C-space>',
    toggle_preview = 'K',
    rename_symbol = 'r',
    code_actions = 'a',
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = '', hl = 'TSURI' },
    Module = { icon = '', hl = 'TSNamespace' },
    Namespace = { icon = '', hl = 'TSNamespace' },
    Package = { icon = '', hl = 'TSNamespace' },
    Class = { icon = '𝓒', hl = 'TSType' },
    Method = { icon = 'ƒ', hl = 'TSMethod' },
    Property = { icon = '', hl = 'TSMethod' },
    Field = { icon = '', hl = 'TSField' },
    Constructor = { icon = '', hl = 'TSConstructor' },
    Enum = { icon = 'ℰ', hl = 'TSType' },
    Interface = { icon = 'ﰮ', hl = 'TSType' },
    Function = { icon = '', hl = 'TSFunction' },
    Variable = { icon = '', hl = 'TSConstant' },
    Constant = { icon = '', hl = 'TSConstant' },
    String = { icon = '𝓐', hl = 'TSString' },
    Number = { icon = '#', hl = 'TSNumber' },
    Boolean = { icon = '⊨', hl = 'TSBoolean' },
    Array = { icon = '', hl = 'TSConstant' },
    Object = { icon = '⦿', hl = 'TSType' },
    Key = { icon = '🔐', hl = 'TSType' },
    Null = { icon = 'NULL', hl = 'TSType' },
    EnumMember = { icon = '', hl = 'TSField' },
    Struct = { icon = '𝓢', hl = 'TSType' },
    Event = { icon = '🗲', hl = 'TSType' },
    Operator = { icon = '+', hl = 'TSOperator' },
    TypeParameter = { icon = '𝙏', hl = 'TSParameter' },
  },
}
