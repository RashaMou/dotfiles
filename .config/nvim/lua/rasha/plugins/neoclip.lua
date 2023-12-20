return {
  "AckslD/nvim-neoclip.lua",
  requires = {
    {'nvim-telescope/telescope.nvim'},
    {'ibhagwan/fzf-lua'},
  },
  config = function()
    require('neoclip').setup()
  end,
}
