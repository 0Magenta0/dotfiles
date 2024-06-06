local hl = vim.api.nvim_set_hl -- Short alias.

local M = {}

M.palette = {
  global_bg = '#191929',
  status_bg = '#2A2C54',
  b_item_bg = '#484C9C',
  e_item_bg = '#5E64E8',
  select_fg = '#E88657',

  white = '#FFFFFF',
}

function M.style()
  vim.api.nvim_exec2('hi clear', {})
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_exec2('syntax reset', {})
  end

  hl(0, 'StatusEdge',       { bg = M.palette.e_item_bg, fg = M.palette.white,     bold = 1 })
  hl(0, 'StatusBorder',     { bg = M.palette.b_item_bg, fg = M.palette.e_item_bg           })
  hl(0, 'StatusDarkH',      { bg = M.palette.b_item_bg, fg = M.palette.select_fg, bold = 1 })
  hl(0, 'StatusDark',       { bg = M.palette.b_item_bg, fg = M.palette.white,     bold = 1 })
  hl(0, 'StatusDarkBorder', { bg = M.palette.status_bg, fg = M.palette.b_item_bg           })
  hl(0, 'StatusLineBg',     { bg = M.palette.status_bg, fg = M.palette.white               })

  hl(0, 'Normal', { bg = M.palette.global_bg, fg = M.palette.white })
end

function M.setup()
  M.style()
end

return M
