if vim.g.neovide then
    vim.g.neovide_scale_factor = 0.8
    vim.g.neovide_transparency = 0.7
    vim.g.neovide_remember_window_size = true

    vim.keymap.set("n", "<leader>-", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", {noremap = true, silent = true})
    vim.keymap.set("n", "<leader>=", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", {noremap = true, silent = true})
    vim.keymap.set("n", "<A-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>", {noremap = true, silent = true})
    vim.keymap.set("n", "<A-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>", {noremap = true, silent = true})
end
