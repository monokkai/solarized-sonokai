-- solarized-sonokai
--
-- Solarized Osaka's backgrounds + Sonokai's syntax accents.
--
--   require("solarized-sonokai").setup({ transparent = true })
--   vim.cmd.colorscheme("solarized-sonokai")

local M = {}

M.config = {
	transparent = false,
	italic_comments = true,
	terminal_colors = true,
}

--- @param opts table|nil
function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

local function set_terminal_colors(c)
	vim.g.terminal_color_0 = c.bg_highlight
	vim.g.terminal_color_1 = c.red
	vim.g.terminal_color_2 = c.green
	vim.g.terminal_color_3 = c.yellow
	vim.g.terminal_color_4 = c.blue
	vim.g.terminal_color_5 = c.purple
	vim.g.terminal_color_6 = c.cyan
	vim.g.terminal_color_7 = c.fg_dark
	vim.g.terminal_color_8 = c.comment
	vim.g.terminal_color_9 = c.red
	vim.g.terminal_color_10 = c.green
	vim.g.terminal_color_11 = c.yellow
	vim.g.terminal_color_12 = c.blue
	vim.g.terminal_color_13 = c.purple
	vim.g.terminal_color_14 = c.cyan
	vim.g.terminal_color_15 = c.fg
end

function M.load()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "solarized-sonokai"

	local c = require("solarized-sonokai.palette").setup({
		transparent = M.config.transparent,
	})

	local groups = require("solarized-sonokai.theme").get(c)

	if not M.config.italic_comments then
		groups.Comment.italic = nil
		groups["@comment"].italic = nil
	end

	for group, spec in pairs(groups) do
		vim.api.nvim_set_hl(0, group, spec)
	end

	if M.config.terminal_colors then
		set_terminal_colors(c)
	end
end

return M
