--
--  https://github.com/0Magenta0/dotfiles
--  Copyright 0Magenta0 2022-2024
--  MIT License
--

return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<Leader>ff', builtin.find_files,      { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>fg', builtin.live_grep,       { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>fb', builtin.buffers,         { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>fh', builtin.help_tags,       { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>fk', builtin.keymaps,         { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>fd', builtin.lsp_definitions, { noremap = true, silent = true })
  end
}
