--
--  https://github.com/0Magenta0/dotfiles
--  Copyright 0Magenta0 2022-2024
--  MIT License
--

return {
  'williamboman/mason.nvim',
  opts = {
    ensure_installed = {
      -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2574
      'omnisharp',
      'csharpier'
    }
  }
}
