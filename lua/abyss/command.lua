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

function RsyncCWD()
    vim.cmd('w')
    local cwd = vim.fn.getcwd()
    local directory_name = vim.fn.fnamemodify(cwd, ":p:h:t")
    local remote_username = os.getenv("REMOTE_USERNAME")
    local remote_ip_address = os.getenv("REMOTE_IP_ADDRESS")
    local remote_ssh_key_path = os.getenv("REMOTE_SSH_KEY_PATH")
    local cmd = 'rsync -e "ssh -i \''..remote_ssh_key_path..'\'" --delete-after --exclude /dist --filter="P /target" --filter=":e- .gitignore" --filter "- .git/" -v -a ../'..directory_name..'/ '..remote_username..'@'..remote_ip_address..'~/abyss/sync/'..directory_name
    local output = vim.fn.systemlist(cmd)
    for _, line in ipairs(output) do
        print(line)
    end
end

vim.keymap.set("n", "<leader>db", ":lua DeleteBuffer()<cr>")

vim.cmd('command! W w')

vim.cmd('command! Wr lua RsyncCWD()')
vim.cmd('command! WR lua RsyncCWD()')

vim.cmd('command! Wt vs | wincmd l | edit C:/Users/user/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json')

vim.cmd('command! Vimrc vs | wincmd l | Explore $USERPROFILE/AppData/Local/nvim/')

vim.cmd('command! Alc edit ~/AppData/Roaming/alacritty/alacritty.yml')

vim.cmd('command! Alcn vs | wincmd l | edit ~/AppData/Roaming/alacritty/alacritty.yml')

vim.cmd('command! BD %bd|e#|bd#')

vim.cmd('command! Myvimrc cd $MYVIMRC | e $MYVIMRC')

vim.cmd('command! Openthis !pwsh -command "open \'%:p\'"')

vim.cmd('command! HTML TOhtml | w | bd')

