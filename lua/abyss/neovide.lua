--vim.g.neovide_scale_factor = 0.65
vim.g.neovide_transparency = 0.8
vim.g.neovide_remember_window_size = true

vim.o.guifont = "Liberation mono:h9"

vim.keymap.set("n", "<leader>-", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.025<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>=", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.025<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<A-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.025<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<A-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.025<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.025<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.025<CR>", {noremap = true, silent = true})

vim.cmd('hi Normal guibg=#40375a')

if vim.g.neovide == nil then
    vim.cmd('hi Normal guibg=#40375a00')
end

--print(vim.g.neovide)

