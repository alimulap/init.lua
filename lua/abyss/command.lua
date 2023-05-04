function DeleteBuffer()
  if vim.bo.buftype == "terminal" then
    vim.cmd('bd!')
  else
    vim.cmd('bd')
  end
end

vim.keymap.set("n", "<leader>db", ":lua DeleteBuffer()<cr>")

vim.cmd('command! W w')

vim.cmd('command! Vimrc new ~/AppData/Local/nvim/')

vim.cmd('command! Alc edit ~/AppData/Roaming/alacritty/alacritty.yml')

