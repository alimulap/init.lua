function DeleteBuffer()
  if vim.bo.buftype == "terminal" then
    vim.cmd('bd!')
  else
    vim.cmd('bd')
  end
end

vim.keymap.set("n", "<leader>db", ":lua DeleteBuffer()<cr>")

vim.cmd('command! W w')

vim.cmd('command! Wt vs | wincmd l | edit C:/Users/user/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json')

vim.cmd('command! Vimrc vs | wincmd l | Explore $USERPROFILE/AppData/Local/nvim/')

vim.cmd('command! Alc edit ~/AppData/Roaming/alacritty/alacritty.yml')

vim.cmd('command! Alcn vs | wincmd l | edit ~/AppData/Roaming/alacritty/alacritty.yml')

