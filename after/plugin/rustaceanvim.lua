local cfg = {
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  max_height = 12, -- max height of signature floating_window
  max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
                  -- the value need >= 40
  wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = 1, -- adjust float windows x position.
                             -- can be either a number or function
  floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
                              -- can be either number or function, see examples

  close_timeout = 4000, -- close floating window after ms when laster parameter is entered
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
  hint_scheme = "String",
  hint_inline = function() return false end,  -- should the hint be inline(nvim 0.10 only)?  default false
  -- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
  -- return 'right_align' to display hint right aligned in the current line
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none, or a table of borders
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = "<C-k>", -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
  toggle_key_flip_floatwin_setting = true, -- true: toggle floating_windows: true|false setting after toggle key pressed
     -- false: floating_windows setup will not change, toggle_key will pop up signature helper, but signature
     -- may not popup when typing depends on floating_window setting

  select_signature_key = "<C-h>", -- cycle to next signature, e.g. '<M-n>' function overloading
  move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
}

vim.g.rustaceanvim =  {
    -- Plugin configuration
    inlay_hints = {
        highlight = "LspInlayHint",
    },
    tools = {
        hover_actions = {
            auto_focus = false,
        },
    },
    -- LSP configuration
    server = {
        standalone = true,
        on_attach = function(client, bufnr)
            --vim.lsp.inlay_hint(bufnr, true)
            require("lsp-inlayhints").on_attach(client, bufnr)
            local opts = { buffer = bufnr, remap = false }
            --- Guard against servers without the signatureHelper capability
            if client.server_capabilities.signatureHelpProvider then
                require('lsp-overloads').setup(client, {
                    -- UI options are mostly the same as those passed to vim.lsp.util.open_floating_preview
                    ui = {
                        border = "single", -- The border to use for the signature popup window. Accepts same border values as |nvim_open_win()|.
                        height = nil,      -- Height of the signature popup window (nil allows dynamic sizing based on content of the help)
                        width = nil,       -- Width of the signature popup window (nil allows dynamic sizing based on content of the help)
                        wrap = true,       -- Wrap long lines
                        wrap_at = nil,     -- Character to wrap at for computing height when wrap enabled
                        max_width = nil,   -- Maximum signature popup width
                        max_height = nil,  -- Maximum signature popup height
                        -- Events that will close the signature popup window: use {"CursorMoved", "CursorMovedI", "InsertCharPre"} to hide the window when typing
                        close_events = { "CursorMoved", "BufHidden", "InsertLeave" },
                        focusable = true,                       -- Make the popup float focusable
                        focus = false,                          -- If focusable is also true, and this is set to true, navigating through overloads will focus into the popup window (probably not what you want)
                        offset_x = 0,                           -- Horizontal offset of the floating window relative to the cursor position
                        offset_y = 0,                           -- Vertical offset of the floating window relative to the cursor position
                        floating_window_above_cur_line = false, -- Attempt to float the popup above the cursor position
                        -- (note, if the height of the float would be greater than the space left above the cursor, it will default
                        -- to placing the float below the cursor. The max_height option allows for finer tuning of this)
                    },
                    keymaps = {
                        next_signature = "<C-j>",
                        previous_signature = "<C-k>",
                        next_parameter = "<C-l>",
                        previous_parameter = "<C-h>",
                        close_signature = "<A-s>"
                    },
                    display_automatically = false
                })
            end
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            --vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", "<C-f>", function() vim.lsp.buf.format() end, opts)

            require "lsp_signature".on_attach(cfg, bufnr)
        end,
        settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
            },
        },
    },
    -- DAP configuration
    dap = {
        adapter = require('rustaceanvim.config').get_codelldb_adapter(
            vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/adapter/codelldb',
            vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/lldb/bin/liblldb.dll'
        ),
    },
}
