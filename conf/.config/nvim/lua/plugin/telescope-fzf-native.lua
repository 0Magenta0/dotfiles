--
--  https://github.com/0Magenta0/dotfiles
--  Copyright 0Magenta0 2022-2024
--  MIT License
--

return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && \
           cmake --build build --config Release && \
           cmake --install build --prefix build'
}

