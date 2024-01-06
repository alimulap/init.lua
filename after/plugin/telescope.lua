local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function()
    local opts = {};
    builtin.find_files(opts)
end, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>bf', function ()
    builtin.buffers({ cwd_only = false })
end, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, {})

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
                vim.cmd('cd '..selection[1])
                vim.cmd('e '..selection[1])
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


function SelectDirectory(starting_dir)
    local opts = {}
    starting_dir = starting_dir or "abyss"
    local preset_dir = {
        ["abyss"] = "~/abyss",
        ["home"]  = "~"
    }

    if not starting_dir:startswith("/") then
        starting_dir = preset_dir[starting_dir]
    end

    print(starting_dir)

    pickers.new(opts, {
        prompt_title = starting_dir,
        finder = finders.new_oneshot_job({"zsh", "-c", "fd -t d -d 4 -H . " .. starting_dir}),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd('cd '..selection[1])
                vim.cmd('e '..selection[1])
            end)
            return true
        end,
    }):find()
end

vim.cmd('command! Abyss lua AbyssDir()')

vim.cmd('command! Ref lua AbyssRef()')

vim.cmd('command! -nargs=1 Sdir lua SelectDirectory(<f-args>)')


--require('telescope').setup{
--    defaults = {
--        winblend = 30,
--        --mappings = {
--        --    i = {
--        --        ["<esc>"] = actions.close,
--        --        ["<C-j>"] = actions.move_selection_next,
--        --        ["<C-k>"] = actions.move_selection_previous,
--        --    },
--        --},
--    },
--    pickers = {
--        find_files = {
--            theme = "dropdown",
--            previewer = false,
--        },
--        live_grep = {
--            theme = "dropdown",
--            previewer = false,
--        },
--        buffers = {
--            theme = "dropdown",
--            previewer = false,
--        },
--        git_files = {
--            theme = "dropdown",
--            previewer = false,
--        },
--    },
--}
