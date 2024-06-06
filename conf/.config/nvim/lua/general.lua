vim.g.mapleader = ',' -- Leader key.

vim.o.number         = true  -- Enable line numbers.
vim.o.relativenumber = true  -- Relative line numbers.
vim.o.wrap           = false -- Disable line wrapping.
vim.o.showmode       = false -- Show mode only on status line.
vim.o.laststatus     = 3     -- Global status line.

vim.o.tabstop    = 2    -- Tab size.
vim.o.expandtab  = true -- Convert <Tab> to spaces.
vim.o.shiftwidth = 2    -- Auto Indent size.

vim.o.guicursor     = '' -- Default cursor.
vim.o.termguicolors = true -- Enable 24-bit RGB colors.

-- Disable providers.
vim.g.loaded_perl_provider    = 0
vim.g.loaded_ruby_provider    = 0
vim.g.loaded_node_provider    = 0
vim.g.loaded_python3_provider = 0

-- Key bindings.
local skeymap = vim.api.nvim_set_keymap -- Short alias.
local vkeymap = vim.keymap.set -- Short alias.

skeymap('n', '<Leader>h', ':set hlsearch!<CR>', { noremap = true, silent = true })
skeymap('n', '<Leader>D', ':Neotree<CR>',       { noremap = true, silent = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local function opts(desc)
      return { buffer = ev.buf, noremap = ture, desc = "LSP " .. desc }
    end

    local function format()
      vim.lsp.buf.format { async = true }
    end

    vkeymap('n', '<Leader>gD', vim.lsp.buf.declaration,    opts 'Go to declaration')
    vkeymap('n', '<Leader>gd', vim.lsp.buf.definition,     opts 'Go to definition')
    vkeymap('n', '<Leader>gi', vim.lsp.buf.implementation, opts 'Go to implementation')
    vkeymap('n', '<Leader>r',  vim.lsp.buf.references,     opts 'References')
    vkeymap('n', '<Leader>R',  vim.lsp.buf.rename,         opts 'Rename')
    vkeymap('n', '<Leader>ca', vim.lsp.buf.code_action,    opts 'Code action')
    vkeymap('n', '<Leader>fm', format,                     opts 'Format')

    -- vkeymap('i', '<Ctrl>P', vim.lsp.buf.completion, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  end,
})
