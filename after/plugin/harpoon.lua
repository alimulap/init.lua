local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<F10>", function () mark.add_file() end)
vim.keymap.set("n", "<F9>", function () mark.rm_file() end)

vim.keymap.set("n", "<F12>", function () ui.toggle_quick_menu() end)

vim.keymap.set("n", "<F1>", function () ui.nav_file(1) end)
vim.keymap.set("n", "<F2>", function () ui.nav_file(2) end)
vim.keymap.set("n", "<F3>", function () ui.nav_file(3) end)
vim.keymap.set("n", "<F4>", function () ui.nav_file(4) end)

vim.keymap.set("n", "<A-F1>", function () mark.set_current_at(1) end)
vim.keymap.set("n", "<A-F2>", function () mark.set_current_at(2) end)
vim.keymap.set("n", "<A-F3>", function () mark.set_current_at(3) end)
vim.keymap.set("n", "<A-F4>", function () mark.set_current_at(4) end)
