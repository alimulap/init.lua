
function Cset(color)
	color = "tokyonight-moon"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.g.tokyonight_transparent = vim.g.transparent_enabled

    vim.g.nvim_transparency = 0.7

    vim.cmd('hi Normal guibg=#0a071a')
end

Cset()
