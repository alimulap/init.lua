function Cset(color)
	color = "tokyonight-night"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.g.tokyonight_transparent = vim.g.transparent_enabled

    vim.g.nvim_transparency = 0.7

    vim.cmd('hi Normal guibg=#2c374600')
end

--Cset()

require("tokyonight").setup({
  style = "night",
  on_highlights = function(hl, c)
    --local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = "",
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = "",
      fg = "#4cc099",
    }
    hl.NormalFloat = {
      bg = "",
      fg = "#c0caf5",
    }
    hl.FloatBorder = {
      bg = "",
      fg = "#4cc099",
    }
    hl.LspInlayHint = {
      bg = "",
      fg = "#747c8e",
    }
    hl.Type = {
        bg = "",
        fg = "#0cdfd9",
    }
    hl.String = {
        bg = "",
        fg = "#6ede6a",
    }
    hl.Comment = {
        bg = "",
        fg = "#666666",
    }
    hl.Pmenu = {
        bg = "",
        fg = "#c0caf5"
    }
    --hl.TelescopePromptNormal = {
    --  bg = prompt,
    --}
    --hl.TelescopePromptBorder = {
    --  bg = prompt,
    --  fg = prompt,
    --}
    --hl.TelescopePromptTitle = {
    --  bg = prompt,
    --  fg = prompt,
    --}
    --hl.TelescopePreviewTitle = {
    --  bg = c.bg_dark,
    --  fg = c.bg_dark,
    --}
    --hl.TelescopeResultsTitle = {
    --  bg = c.bg_dark,
    --  fg = c.bg_dark,
    --}
  end,
})

vim.cmd.colorscheme("tokyonight-night")
--vim.cmd('hi NormalFloat guibg=#2c374600')
--vim.cmd('hi FloatBorder guibg=#2c374600')
--vim.cmd('hi Type guifg=#0cdfd9')
--vim.cmd('hi String guifg=#6ede6a')
--vim.cmd('hi Comment guifg=#666666')
