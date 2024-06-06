local M = {}

local function format_status()
  local statusline = ''

  -- Mode.
  statusline = statusline .. '%#StatusEdge# ' .. vim.api.nvim_get_mode().mode .. ' %#StatusBorder#'

  -- File name (TODO: Check read-only, File changed).
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname == '' then
    bufname = '%#StatusDarkH#-%#StatusDark#'
  end
  statusline = statusline ..
    '%#StatusDark# ' .. bufname .. ' %#StatusDarkBorder#'

  -- LSP Diag.
  local errors = vim.tbl_count(vim.diagnostic.get(0, { severity = 'Error' }))
  local warnings = vim.tbl_count(vim.diagnostic.get(0, { severity = 'Warn' }))
  local info = vim.tbl_count(vim.diagnostic.get(0, { severity = 'Info' }))
  local hint = vim.tbl_count(vim.diagnostic.get(0, { severity = 'Hint' }))
  statusline = statusline .. '%#StatusLineBg#' ..
    (errors > 0 and ('  ' .. errors) or '') ..
    (warnings > 0 and ('  ' .. warnings) or '') ..
    (info > 0 and ('  ' .. info) or '') ..
    (hint > 0 and ('  ' .. hint) or '')

  -- Filetype.
  statusline = statusline .. '%=' .. vim.bo.filetype

  -- Encoding.
  statusline = statusline ..
    ' %#StatusDarkBorder#%#StatusDark# ' .. vim.bo.fileencoding .. ' '

  -- Cursor info.
  statusline = statusline .. '%#StatusBorder#%#StatusEdge# ' ..
  '%p%% %l/%L %v/' .. vim.api.nvim_strwidth(vim.api.nvim_get_current_line()) .. ' %b/%B '

  return statusline
end

function M.setup()
  -- Update status line.
  vim.api.nvim_create_autocmd({
    'WinEnter',
    'BufEnter',
    'BufWritePost',
    'SessionLoadPost',
    'FileChangedShellPost',
    'VimResized',
    'Filetype',
    'CursorMoved',
    'CursorMovedI',
    'ModeChanged'
  }, {
    pattern = '*',
    callback = function()
      vim.o.statusline = format_status()
    end
  })
end

return M
