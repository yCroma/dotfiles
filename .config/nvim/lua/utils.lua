local M = {}
local tree = require('nvim-tree')
local view = require('nvim-tree.view')

function M.toggle_tree()
  if view.is_visible() then
    view.close()
  else
    tree.toggle()
  end
end

function M.toggle_vinegar()
  if view.is_visible() then
    view.close()
  else
    tree.open_replacing_current_buffer()
  end
end

function M.toggle_vinegar_botright()
  if view.is_visible() then
    view.close()
  else
    vim.cmd([[botright vsplit]])
    tree.open_replacing_current_buffer()
  end
end

function M.toggle_vinegar_split()
  if view.is_visible() then
    view.close()
  else
    vim.cmd([[split]])
    tree.open_replacing_current_buffer()
  end
end

function M.toggle_vinegar_topleft()
  if view.is_visible() then
    view.close()
  else
    vim.cmd([[topleft split]])
    tree.open_replacing_current_buffer()
  end
end

return M
