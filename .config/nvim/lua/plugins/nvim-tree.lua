-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require('nvim-tree').setup({
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_netrw = false,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
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
    mappings = {
      custom_only = false,
      list = {
        { key = { 'o', '<CR>' }, action = 'edit_in_place' },
        { key = { 'l', '<2-LeftMouse>' }, action = 'edit' },
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
    change_dir = {
      enable = false,
    },
    open_file = {
      quit_on_open = false,
    },
  },
})
