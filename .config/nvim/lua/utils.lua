local view = require('nvim-tree.view')
local M = {}

function M.toggle_tree()
  if view.is_visible() then
    view.close()
  else
    require('nvim-tree').toggle()
  end
end

function M.toggle_vinegar()
  if view.is_visible() then
    view.close()
  else
    require('nvim-tree').open_replacing_current_buffer()
  end
end

function M.toggle_vinegar_botright()
  if view.is_visible() then
    view.close()
  else
    vim.g['nvim-tree#opened#vinegar'] = 1
    vim.cmd([[botright vsplit]])
    require('nvim-tree').open_replacing_current_buffer()
  end
end

function M.toggle_vinegar_split()
  if view.is_visible() then
    view.close()
  else
    vim.cmd([[split]])
    require('nvim-tree').open_replacing_current_buffer()
  end
end

function M.toggle_vinegar_topleft()
  if view.is_visible() then
    view.close()
  else
    vim.cmd([[topleft split]])
    require('nvim-tree').open_replacing_current_buffer()
  end
end

return M
