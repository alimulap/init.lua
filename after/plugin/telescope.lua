
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>bf', builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

AbyssDir = function(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "Abyss",
        --finder = finders.new_oneshot_job({"pwsh.exe", "-Command", "Get-ChildItem -Path ~/Abyss -Directory -Recurse -Depth 3 | Select-Object -ExpandProperty FullName | Format-List"}),
        finder = finders.new_oneshot_job({"powershell.exe", "-Command", "fd -t d -d 4 . $HOME\\Abyss"}),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd('cd ' .. '~\\Abyss\\' .. selection[1])
                vim.cmd('Explore ' .. '~\\Abyss\\' .. selection[1])
                vim.cmd('%bd|e#|bd#')
            end)
            return true
        end,
    }):find()
end

AbyssRef = function(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "Abyss",
        --finder = finders.new_oneshot_job({"powershell.exe", "-Command", "Get-ChildItem -Path ~/Abyss -Directory -Recurse -Depth 3 | Select-Object -ExpandProperty FullName | Format-List"}),
        finder = finders.new_oneshot_job({"powershell.exe", "-Command", "fd -t d -d 4 . $HOME\\Abyss"}),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd('vs')
                vim.cmd('wincmd l')
                vim.cmd('Explore ' .. selection[1])
            end)
            return true
        end,
    }):find()
end

vim.cmd('command! Cd lua AbyssDir()')

vim.cmd('command! Ref lua AbyssRef()')


