
function Cset(color)
	color = "tokyonight-moon"
	vim.cmd.colorscheme(color)

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.g.tokyonight_transparent = vim.g.transparent_enabled
end

Cset()
