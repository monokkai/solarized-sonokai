-- lualine theme for solarized-sonokai.
--
-- Placed at lua/lualine/themes/ so lualine finds it by name:
--   require("lualine").setup({ options = { theme = "solarized-sonokai" } })
--
-- Mode is carried by the section-a fill, using the same accents as the syntax
-- highlighting so the bar reads as part of the same palette:
--   normal blue · insert yellow · visual orange · replace red · command green

local ok, palette = pcall(require, "solarized-sonokai.palette")
if not ok then
	return require("lualine.themes.auto")
end

local c = palette.palette

local bar = c.bg_highlight -- #002c38, solarized base03
local dim = c.fg_gutter -- #576d74, solarized base01

--- section a is a filled block, b/c sit on the bar
local function mode(accent)
	return {
		a = { fg = bar, bg = accent, gui = "bold" },
		b = { fg = accent, bg = bar },
		c = { fg = c.fg, bg = bar },
		x = { fg = dim, bg = bar },
		y = { fg = c.fg_dark, bg = bar },
		z = { fg = bar, bg = accent, gui = "bold" },
	}
end

return {
	normal = mode(c.blue),
	insert = mode(c.yellow),
	visual = mode(c.orange),
	replace = mode(c.red),
	command = mode(c.green),
	terminal = mode(c.purple),
	inactive = {
		a = { fg = dim, bg = bar },
		b = { fg = dim, bg = bar },
		c = { fg = dim, bg = bar },
	},
}
