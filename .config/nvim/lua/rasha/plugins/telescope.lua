return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        file_browser = {
          hidden = true
        }
      }
    })

    -- set keymaps
    local keymap = vim.keymap
    local builtin = require('telescope.builtin')

    keymap.set("n", "<leader>r", builtin.resume, { noremap = true, silent = true })
    keymap.set( "n", "<leader>fb", [[<Cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>]], { noremap = true, silent = true })
    keymap.set('n', '<leader>o', builtin.find_files, {})
    keymap.set('n', ',', builtin.buffers, {})
    keymap.set('n', '<leader>rg', builtin.live_grep, {})
    keymap.set('n', '<leader>gc', builtin.git_commits, {})

    -- extensions
    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")

  end
}
