vim.g.mapleader = " "

local keymap = vim.keymap

-- split navigation
keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

keymap.set("n", "<C-l>", "<C-w>l")

-- buffers
keymap.set("n", ",", vim.cmd.BuffergatorOpen) 

-- global substitution
keymap.set("n", "S",  ":%s///g<LEFT><LEFT><LEFT>")
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]]) -- sub for word I am on

-- visual mode
keymap.set("n", "<leader><leader>", "<S-v>") -- select the entire line

-- move selected lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste copied text in place of other text
keymap.set("x", "<leader>p", "\"_dP")

-- move outside of pair
keymap.set("i", "<C-\\><C-\\>", "<RIGHT><RIGHT>")
