-- default
require('plugins')
require('indent')
require('utils')
require('maps')
require('fold')

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

-- swap file
vim.cmd([[
let &dir=expand("$HOME/.swap")
]])
-- terminal
vim.cmd([[
autocmd TermOpen * startinsert
]])

-- plugins
-- emmet
vim.cmd([[
let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}
]])

-- gina
vim.cmd([[
call gina#custom#command#option("show", "--group", "gitshow")
call gina#custom#command#option("show", "--opener", "bo vsplit")

augroup gina_init
autocmd!
  autocmd Filetype gina-log nmap <buffer> l <Plug>(gina-show)zv
  autocmd Filetype git nmap <buffer> h :q<CR>
  autocmd Filetype gina-log nmap <buffer> <C-n> j<Plug>(gina-show)zv<C-h>
  autocmd Filetype gina-log nmap <buffer> <C-p> k<Plug>(gina-show)zv<C-h>
  autocmd Filetype gina-log nmap <buffer> <C-d> j<Plug>(gina-show)zv<C-h>
  autocmd Filetype gina-log nmap <buffer> <C-u> k<Plug>(gina-show)zv<C-h>
augroup END')
]])

-- startify
vim.cmd([[
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_custom_header = [
          \ '           ______                          _          _    ___         ',
          \ '    __  __/ ____/________  ____ ___  ____ ( )_____   | |  / (_)___ ___ ',
          \ '   / / / / /   / ___/ __ \/ __ `__ \/ __ `|// ___/   | | / / / __ `__ \',
          \ '  / /_/ / /___/ /  / /_/ / / / / / / /_/ / (__  )    | |/ / / / / / / /',
          \ '  \__, /\____/_/   \____/_/ /_/ /_/\__,_/ /____/     |___/_/_/ /_/ /_/ ',
          \ ' /____/                                                                ',
          \ ]

let g:startify_files_number = 5
let g:startify_bookmarks = [
  \ $HOME."/dotfiles" ,
  \ $HOME."/dotfiles/.config/nvim" ,
  \ $HOME."/.local/share/nvim/site/pack/packer/start"
  \ ]

let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'files', 'header': ['   MRU']      },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
  \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
]])

-- vimagit
vim.g['magit_default_show_all_files'] = 2
vim.g['magit_default_fold_level'] = 1
vim.g['magit_auto_foldopen'] = 0

vim.g['magit_folding_open_mapping'] = { 'l', 'zo', 'zO' }
vim.g['magit_folding_close_mapping'] = { 'h', 'zc', 'zC' }

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
-- local devicons = require('nvim-web-devicons')
-- local icons = devicons.get_icons()
-- print(devicons.get_icon('test.tsx'))

-- for t, val in pairs(icons) do
--   for k, v in pairs(val) do
--     print(k, v)
--   end
-- end
require('nvim_comment').setup()

-- tab line
vim.g.bufferline = {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = 'no name',
}
vim.cmd([[
hi BufferTabpagesFill ctermfg=246 ctermbg=236 guifg=#90817b guibg=#413937
augroup tabline_highlight
autocmd!
  highlight BufferTabpagesFill ctermfg=246 ctermbg=236 guifg=#90817b guibg=#413937
augroup END')
]])

-- lsp
-- start up lsp
local lsp_installer_servers = require('nvim-lsp-installer.servers')
local server_available, requested_server = lsp_installer_servers.get_server('rust_analyzer')
if server_available then
  requested_server:on_ready(function()
    local opts = { 'bashls', 'html', 'ocamllsp', 'rust_analyzer', 'sumneko_lua', 'tsserver', 'vimls' }
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
  local opts = {}
  opts.on_attach = on_attach

  if server.name == 'clangd' then
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.offsetEncoding = { 'utf-16' }
    opts.capabilities = capabilities
  end
  if server.name == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'use' },
        },
      },
    }
  end
  -- This setup() function will take the provided server configuration and decorate it with the necessary properties
  -- before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
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
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
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
vim.g['indent_blankline_filetype_exclude'] = {
  'gina-status',
  'git',
  'lsp-installer',
  'markdown',
  'help',
  'NvimTree',
  'quickrun',
  'packer',
  'lir',
  'startify',
  'dart',
  'flutterToolsOutline',
}
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
    'lsp-installer',
    'Outline',
    'git',
    'diff',
    'gina-status',
    'gina-commit',
    'startify',
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
  width = 55,
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
