--
--  https://github.com/0Magenta0/dotfiles
--  Copyright 0Magenta0 2022-2024
--  MIT License
--

local hl = vim.api.nvim_set_hl -- Short alias.

local M = {}

M.palette = {
  none = 'NONE',

  global_bg = '#191929',
  status_bg = '#2A2C54',
  b_item_bg = '#484C9C',
  e_item_bg = '#5E64E8',
  select_fg = '#E88657',

  comment   = '#7C7482',
  statement = '#8494F5',
  string    = '#7DB366',
  preproc   = '#8BC971',
  special   = '#D4A774',
  func      = '#8AADF4',
  constant  = '#A6DA95',
  type      = '#E88657',

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

  hl(0, 'Comment',   { bg = M.palette.global_bg, fg = M.palette.comment,   italic = 1             })
  hl(0, 'Statement', { bg = M.palette.global_bg, fg = M.palette.statement, bold = 1               })
  hl(0, 'String',    { bg = M.palette.global_bg, fg = M.palette.string,                           })
  hl(0, 'PreProc',   { bg = M.palette.global_bg, fg = M.palette.preproc,   bold = 1               })
  hl(0, 'Special',   { bg = M.palette.global_bg, fg = M.palette.special,   bold = 1               })
  hl(0, 'Function',  { bg = M.palette.global_bg, fg = M.palette.func,      bold = 1               })
  hl(0, 'Constant',  { bg = M.palette.global_bg, fg = M.palette.constant,                         })
  hl(0, 'Type',      { bg = M.palette.global_bg, fg = M.palette.type,      bold = 1               })
  hl(0, 'Operator',  { bg = M.palette.global_bg, fg = M.palette.white,     italic = 1, bold = 1   })
end

function M.setup()
  M.style()
end

return M
