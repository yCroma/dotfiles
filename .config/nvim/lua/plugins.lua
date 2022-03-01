-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function()
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- colorscheme
  use({ 'yCroma/vim-colorschemes', opt = true })
  use({ 'sainnhe/sonokai' })

  -- auto pair
  use('mattn/vim-lexiv')

  -- sandwitch
  use('machakann/vim-sandwich')

  -- comment out
  use('terrortylor/nvim-comment')

  -- emmet
  use('mattn/emmet-vim')

  -- lsp
  use({
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  })
  -- complition
  use({
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    requires = { 'neovim/nvim-lspconfig' },
  })

  -- outliner
  use({ 'simrat39/symbols-outline.nvim', config = function() end })

  -- formatter
  use({
    'lukas-reineke/format.nvim',
    config = function()
      require('format').setup({
        ['*'] = {},
        lua = {
          {
            cmd = {
              'stylua --search-parent-directories',
            },
          },
        },
        html = {
          {
            cmd = {
              { 'prettier -w --parser html' },
            },
          },
        },
        javascript = {
          { cmd = { 'prettier -w', './node_modules/.bin/eslint --fix' } },
        },
        json = {
          { cmd = { 'prettier -w --parser json' } },
        },
      })
    end,
  })

  -- Post-install/update hook with neovim command
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  -- indent guide
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function() end,
  })

  -- scroll bar
  use({
    'petertriho/nvim-scrollbar',
    requires = { 'kevinhwang91/nvim-hlslens' },
  })

  -- fzf
  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' }, 'nvim-treesitter/nvim-treesitter' },
  })

  -- for markdown
  -- editor
  use('SidOfc/mkdx')

  -- previewer
  -- use({
  --   'kat0h/bufpreview.vim',
  --   requires = { 'vim-denops/denops.vim' },
  -- })

  -- nvim-web-devicons
  use('kyazdani42/nvim-web-devicons')

  -- status line
  use({
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
    },
  })
  -- startup
  use('mhinz/vim-startify')


  -- tree filer
  use({
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      -- following options are the default
      -- each of these are documented in `:help nvim-tree.OPTION_NAME`
      require('nvim-tree').setup({
        disable_netrw = false,
        hijack_netrw = false,
        open_on_setup = false,
        ignore_ft_on_setup = {},
        auto_close = true,
        open_on_tab = false,
        hijack_cursor = false,
        update_cwd = false,
        update_to_buf_dir = {
          enable = true,
          auto_open = true,
        },
        diagnostics = {
          enable = false,
          icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
          },
        },
        update_focused_file = {
          enable = false,
          update_cwd = false,
          ignore_list = {},
        },
        system_open = {
          cmd = nil,
          args = {},
        },
        filters = {
          dotfiles = false,
          custom = {},
        },
        git = {
          enable = true,
          ignore = true,
          timeout = 500,
        },
        view = {
          width = 30,
          height = 30,
          hide_root_folder = false,
          side = 'left',
          auto_resize = false,
          mappings = {
            custom_only = false,
            list = {
              { key = { 'l' }, action = 'edit', mode = 'n' },
              { key = { 'h' }, action = 'close_node', mode = 'n' },
              { key = { '@' }, action = 'cd', mode = 'n' },
            },
          },
          number = false,
          relativenumber = false,
          signcolumn = 'yes',
        },
        trash = {
          cmd = 'trash',
          require_confirm = true,
        },
        actions = {
          open_file = {
            quit_on_open = false,
          },
        },
      })
    end,
  })
  use({
    'tamago324/lir.nvim',
    requires = {
      'tamago324/lir-git-status.nvim',
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      local actions = require('lir.actions')
      local mark_actions = require('lir.mark.actions')
      local clipboard_actions = require('lir.clipboard.actions')

      require('lir').setup({
        show_hidden_files = true,
        devicons_enable = true,
        hide_cursor = true,
        mappings = {
          ['l'] = actions.edit,
          ['<CR>'] = actions.edit,
          ['<C-s>'] = actions.split,
          ['<C-v>'] = actions.vsplit,
          ['<C-t>'] = actions.tabedit,

          ['h'] = actions.up,
          ['-'] = actions.up,
          ['q'] = actions.quit,

          ['K'] = actions.mkdir,
          ['N'] = actions.newfile,
          ['R'] = actions.rename,
          ['@'] = actions.cd,
          ['Y'] = actions.yank_path,
          ['.'] = actions.toggle_show_hidden,
          ['D'] = actions.delete,

          ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
          end,
          ['C'] = clipboard_actions.copy,
          ['X'] = clipboard_actions.cut,
          ['P'] = clipboard_actions.paste,
        },
        float = {
          winblend = 15,
          win_opts = nil,
          curdir_window = {
            enable = false,
            highlight_name = false,
          },
        },
        on_init = function()
          -- echo cwd
          vim.api.nvim_echo({ { vim.fn.expand('%:p'), 'Normal' } }, false, {})
        end,
      })

      require('lir.git_status').setup({
        show_ignored = false,
      })
      vim.cmd([[highlight link LirGitStatusBracket Comment]])
      vim.cmd([[highlight link LirGitStatusIndex Special]])
      vim.cmd([[highlight link LirGitStatusWorktree WarningMsg]])
      vim.cmd([[highlight link LirGitStatusUnmerged ErrorMsg]])
      vim.cmd([[highlight link LirGitStatusUntracked Comment]])
      vim.cmd([[highlight link LirGitStatusIgnored Comment]])

      require('nvim-web-devicons').set_icon({
        lir_folder_icon = {
          icon = '',
          color = '#7ebae4',
          name = 'LirFolderNode',
        },
      })
    end,
  })

  -- git client
  use({
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  })

  use({
    'lambdalisue/gina.vim',
  })

  -- nvim-tmux-navigation
  use({
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup({
        disable_when_zoomed = true, -- defaults to false
      })

      vim.api.nvim_set_keymap(
        'n',
        '<C-h>',
        ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        '<C-j>',
        ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        '<C-k>',
        ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        '<C-l>',
        ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        '<C-\\>',
        ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        'n',
        '<C-Space>',
        ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>",
        { noremap = true, silent = true }
      )
    end,
  })

  -- winresizer
  use('simeji/winresizer')

  -- colorizer
  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        '*',
      })
    end,
  })

  -- task runner
  use('thinca/vim-quickrun')
  use({
    'skanehira/command.vim',
    requires = { 'vim-denops/denops.vim' },
  })
end)
