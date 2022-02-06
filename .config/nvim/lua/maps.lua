-- default
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'j', 'gjzz', opts)
vim.api.nvim_set_keymap('n', 'k', 'gkzz', opts)
vim.api.nvim_set_keymap('n', '{', '{zz', opts)
vim.api.nvim_set_keymap('n', '}', '}zz', opts)
vim.api.nvim_set_keymap('n', 'za', 'zazz', opts)
vim.api.nvim_set_keymap('n', 'N', 'Nzz', opts)
vim.api.nvim_set_keymap('n', 'H', 'Hzz', opts)
vim.api.nvim_set_keymap('n', 'M', 'Mzz', opts)
vim.api.nvim_set_keymap('n', 'L', 'Lzz', opts)
vim.api.nvim_set_keymap('n', 'G', 'Gzz', opts)

vim.api.nvim_set_keymap('n', '^', '0^', opts)

-- vim.api.nvim_set_keymap('n', '-', 'ggzz', opts)
vim.api.nvim_set_keymap('n', '<C-i>', '<C-i>zz', opts)
vim.api.nvim_set_keymap('n', '<C-o>', '<C-o>zz', opts)

vim.api.nvim_set_keymap('n', '[b', ':bpre<CR>', opts)
vim.api.nvim_set_keymap('n', ']b', ':bnext<CR>', opts)

vim.api.nvim_set_keymap('n', '[t', ':tabprevious<CR>', opts)
vim.api.nvim_set_keymap('n', ']t', ':tabnext<CR>', opts)

vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', opts)
vim.api.nvim_set_keymap('n', 'Y', '<Shift-V>y', opts)

-- plugins
-- telescope
vim.api.nvim_set_keymap(
  'n',
  '<Space>fb',
  ":lua require('telescope.builtin').buffers({layout_strategy='flex'})<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Space>fB',
  ":lua require('telescope.builtin').file_browser({layout_strategy='flex'})<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Space>fd',
  ":lua require('telescope.builtin').diagnostics({layout_strategy='flex'})<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Space>ff',
  ":lua require('telescope.builtin').current_buffer_fuzzy_find({layout_strategy='flex'})<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Space>fF',
  ":lua require('telescope.builtin').git_files({layout_strategy='flex'})<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Space>fg',
  ":lua require('telescope.builtin').live_grep({layout_strategy='flex'})<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Space>fh',
  ":lua require('telescope.builtin').help_tags()<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Space>fj',
  ":lua require('telescope.builtin').jumplist({layout_strategy='flex'})<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Space>fl',
  ":lua require('telescope.builtin').git_commits({layout_strategy='flex'})<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Space>fr',
  ":lua require('telescope.builtin').lsp_references({layout_strategy='flex'})<cr>",
  { noremap = true, silent = true }
)

-- nvim-tree
vim.api.nvim_set_keymap('n', '<Space>ef', ':NvimTreeToggle<cr>', { noremap = true, silent = true })

-- gitsigns
-- stylua: ignore <start>
vim.api.nvim_set_keymap('n', '<space>hs', ':Gitsigns stage_hunk<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<space>hs', ':Gitsigns stage_hunk<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>hu', ':Gitsigns undo_stage_hunk<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<space>hr', ':Gitsigns reset_hunk<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>hR', ':Gitsigns reset_buffer<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>hp', ':Gitsigns preview_hunk<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  'n',
  '<space>gb',
  '<cmd>lua require"gitsigns".blame_line{full=true}<cr>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap('n', '<space>gd', ':Gitsigns diffthis<cr>', { noremap = true, silent = true })
-- stylua: ignore <end>

-- gina
vim.api.nvim_set_keymap('n', '<Space>gs', ':Gina status<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>gc', ':Gina commit<CR>', { noremap = true, silent = true })

-- quickrun
vim.api.nvim_set_keymap(
  'n',
  '<Space>qr',
  ':QuickRun -outputter/buffer/into "0" -outputter/buffer/opener "new"<CR>',
  opts
)
