-- default
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<C-z>', '<Nop>', opts)

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

vim.api.nvim_set_keymap('n', '<Space>tn', ':tabnew<CR>', opts)
vim.api.nvim_set_keymap('n', '[t', ':tabprevious<CR>', opts)
vim.api.nvim_set_keymap('n', ']t', ':tabnext<CR>', opts)

vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', opts)
vim.api.nvim_set_keymap('n', 'Y', '<Shift-V>y', opts)

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)
vim.api.nvim_set_keymap('t', '<C-w>n', '<C-\\><C-n>', opts)
vim.api.nvim_set_keymap('t', '<C-w>[', '<C-\\><C-n>:bpre<CR>', opts)
vim.api.nvim_set_keymap('t', '<C-w>]', '<C-\\><C-n>:bnext<CR>', opts)

-- plugins
-- vimagit
vim.api.nvim_set_keymap('n', '<Space>mg', ':Magit<CR>', opts)
vim.api.nvim_set_keymap('n', '<Space>mo', ':MagitOnly<CR>', opts)
-- barbar
vim.api.nvim_set_keymap('n', '[b', ':BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', ']b', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<Space>bc', ':BufferClose<CR>', opts)
vim.api.nvim_set_keymap('n', '<Space>bd', ':BufferDelete<CR>', opts)
vim.api.nvim_set_keymap('n', '<Space>bw', ':BufferWipeout<CR>', opts)
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
  '<Space>gl',
  ":lua require('telescope.builtin').git_commits({layout_strategy='flex'})<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Space>fr',
  ":lua require('telescope.builtin').lsp_references({layout_strategy='flex'})<cr>",
  { noremap = true, silent = true }
)

-- lir.nvim
-- vim.api.nvim_set_keymap(
--   'n',
--   '<Space>ef',
--   ':lua require("nvim-tree").open_replacing_current_buffer()<CR>',
--   { noremap = true }
-- )
-- vim.api.nvim_set_keymap(
--   'n',
--   '<Space>eF',
--   ':botright vsp lua require("nvim-tree").open_replacing_current_buffer()<CR>',
--   { noremap = true }
-- )
-- vim.api.nvim_set_keymap('n', '<Space>ef', [[<Cmd>execute 'e ' .. expand('%:p:h')<CR>]], { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Space>eF', [[<Cmd>execute 'botright vsp ' .. getcwd()<CR>]], { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Space>es', [[<Cmd>execute 'sp ' .. getcwd()<CR>]], { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Space>eS', [[<Cmd>execute 'topleft sp ' .. getcwd()<CR>]], { noremap = true })

-- nvim-tree
vim.api.nvim_set_keymap('n', '<Space>ei', ':lua require("utils").toggle_tree()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>ef', ':lua require("utils").toggle_vinegar()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>eF', ':lua require("utils").toggle_vinegar_botright()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>es', ':lua require("utils").toggle_vinegar_split()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>eS', ':lua require("utils").toggle_vinegar_topleft()<CR>', { noremap = true })

-- gitsigns
-- stylua: ignore <start>
vim.api.nvim_set_keymap('n', '[c', ':Gitsigns prev_hunk<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']c', ':Gitsigns next_hunk<cr>', { noremap = true, silent = true })
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
vim.api.nvim_set_keymap('n', '<Space>gl', ':Gina log<CR>', { noremap = true, silent = true })

-- quickrun
vim.api.nvim_set_keymap(
  'n',
  '<Space>qr',
  ':QuickRun -outputter/buffer/into "0" -outputter/buffer/opener "new"<CR>',
  opts
)

-- jaq-nvim
vim.api.nvim_set_keymap('n', '<Space>jq', ':Jaq quickfix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>jt', ':Jaq term<CR>', { noremap = true, silent = true })

-- startify
vim.api.nvim_set_keymap('n', '<Space>S', ':Startify<CR>', opts)
vim.api.nvim_set_keymap('n', '<Space>ss', ':SSave ', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Space>sd', ':SDelete ', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Space>sl', ':SLoad ', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Space>sc', ':SClose<CR>', { noremap = true, silent = false })

-- command.vim
vim.api.nvim_set_keymap('n', '<Space>c', ':CommandBufferOpen<CR>', opts)

-- outliner
vim.api.nvim_set_keymap('n', '<Space>st', ':SymbolsOutline<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>so', ':SymbolsOutline<CR>', { noremap = true, silent = true })
-- for flutter
vim.api.nvim_set_keymap('n', '<Space>ft', ':FlutterOutlineToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>fo', ':FlutterOutlineToggle<CR>', { noremap = true, silent = true })
