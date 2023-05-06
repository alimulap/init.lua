vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pe", vim.cmd.Ex)
vim.keymap.set("n", "<leader>[", ":-tabnext<CR>")
vim.keymap.set("n", "<leader>]", ":+tabnext<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dp")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "wq", "<C-w>")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-l>", "<C-w>l")

vim.keymap.set("n", "\\,", "<C-w>10>")
vim.keymap.set("n", "\\.", "<C-w>10<")

vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<A-t>", ":term \"C:/Program Files/PowerShell/7/pwsh.exe\"<cr>")
vim.keymap.set("n", "<A-v><A-t>", ":vs|wincmd l|term \"C:/Program Files/PowerShell/7/pwsh.exe\"<cr>")
vim.keymap.set("n", "<A-p><A-t>", ":sp|wincmd j|term \"C:/Program Files/PowerShell/7/pwsh.exe\"<cr>")
vim.keymap.set("t", "kj", "<C-\\><C-n>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")

vim.keymap.set("n", "\\0", "<End>")
vim.keymap.set("n", "\\1", "<End>")

vim.keymap.set("n", "<C-B><C-D>", ":%bd|e#|bd#<CR>")


