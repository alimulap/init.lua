--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
--local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
--
--local config = {
--    cmd = {
--        'java',
--        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--        '-Dosgi.bundles.defaultStartLevel=4 ',
--        '-Declipse.product=org.eclipse.jdt.ls.core.product ',
--        '-Dlog.level=ALL ',
--        --'-Xmx1G ',
--        '-jar', 'C:/Abyss/ProgramFiles/Library/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--        '-configuration', 'C:/Abyss/ProgramFiles/Library/jdt-language-server-1.9.0-202203031534/config_win',
--        '-data', vim.fn.expand('C:/Users/user/.cache/jdtls-workspace') .. workspace_dir,
--    },
--    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', '.idea'}, { upward = true })[1]),
--    capabilities = capabilities
--}
--require('jdtls').start_or_attach(config)

local home = os.getenv("USERPROFILE")
local jdtls = require('jdtls')

local root_marker = { 'gradlew', 'mvnw', '.git' }
local root_dir = require('jdtls.setup').find_root(root_marker)

local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local on_attach = function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    if client.server_capabilities.signatureHelpProvider then
        require('lsp-overloads').setup(client, {
            ui = {
                border = "single",
                height = nil,
                width = nil,
                wrap = true,
                wrap_at = nil,
                max_width = nil,
                max_height = nil,
                close_events = { "CursorMoved", "BufHidden", "InsertLeave" },
                focusable = true,
                focus = false,
                offset_x = 0,
                offset_y = 0,
                floating_window_above_cur_line = false,
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
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

local config = {
  flags = {
    debounce_text_changes = 80,
  },
  on_attach = on_attach,
  root_dir = root_dir,
  settings = {
    java = {
      format = {
        settings = {
          url = "/.local/share/eclipse/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
      signatureHelp = { enabled = false },
      contentProvider = { preferred = 'fernflower' },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*"
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999;
          staticStarThreshold = 9999;
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = "C:/Program Files/Eclipse Adoptium/jdk-17.0.4.101-hotspot",
          },
          {
            name = "JavaSE-11",
            path = "C:/Program Files/Eclipse Adoptium/jdk-11.0.19.7-hotspot",
          },
          {
            name = "JavaSE-1.8",
            path = "C:/Program Files/Eclipse Adoptium/jdk-8.0.372.7-hotspot",
          },
        }
      }
    }
  },
  cmd = {
    "C:/Program Files/Eclipse Adoptium/jdk-17.0.4.101-hotspot/bin/java.exe",
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx4g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. home .. '/.local/share/eclipse/lombok.jar',

    '-jar', vim.fn.glob(home .. '/scoop/apps/jdtls/current/plugins/org.eclipse.equinox.launcher_*.jar'),

    '-configuration', home .. '/scoop/apps/jdtls/current/config_win',

    '-data', workspace_folder,
  },
}

jdtls.start_or_attach(config)


