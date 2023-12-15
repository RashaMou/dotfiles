return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local keymap = vim.keymap

    keymap.set("n", "<leader>a", function() harpoon:list():append() end)
    keymap.set("n", "<leader>r", function() harpoon:list():remove() end)
    keymap.set("n", "<C-y>", function() harpoon:list():clear(harpoon:list()) end)
    keymap.set("n", ",", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
    keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
    keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
    keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)
  end
}
