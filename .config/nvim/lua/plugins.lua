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

  -- formatter
  use('mhartington/formatter.nvim')

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
  use({
    'kat0h/bufpreview.vim',
    requires = { 'vim-denops/denops.vim' },
  })

  -- nvim-web-devicons
  use('kyazdani42/nvim-web-devicons')

  -- status line
  use({
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
    },
  })

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
        auto_close = false,
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
            list = {},
          },
          number = false,
          relativenumber = false,
          signcolumn = 'yes',
        },
        trash = {
          cmd = 'trash',
          require_confirm = true,
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

  use({ 'lambdalisue/gina.vim' })

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
end)
