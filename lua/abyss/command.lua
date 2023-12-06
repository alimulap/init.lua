function DeleteBuffer()
  if vim.bo.buftype == "terminal" then
    vim.cmd('bd!')
  else
    vim.cmd('bd')
  end
end

function ChangeDirectory(dir)
    vim.cmd('cd '..dir)
    vim.cmd('e '..dir)
end

vim.keymap.set("n", "<leader>db", ":lua DeleteBuffer()<cr>")

vim.cmd('command! W w')

vim.cmd('command! Wt vs | wincmd l | edit C:/Users/user/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json')

vim.cmd('command! Vimrc vs | wincmd l | Explore $USERPROFILE/AppData/Local/nvim/')

vim.cmd('command! Alc edit ~/AppData/Roaming/alacritty/alacritty.yml')

vim.cmd('command! Alcn vs | wincmd l | edit ~/AppData/Roaming/alacritty/alacritty.yml')

vim.cmd('command! BD %bd|e#|bd#')

vim.cmd('command! Myvimrc cd $MYVIMRC | e $MYVIMRC')

vim.cmd('command! Openthis !pwsh -command "open \'%:p\'"')

vim.cmd('command! HTML TOhtml | w | bd')

