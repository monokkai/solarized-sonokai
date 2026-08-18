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

-- Transparent bar: sections b/c/x/y carry no background so the terminal shows
-- through. Only a and z are filled, which is what the bubble caps round off --
-- an opaque bar behind them would render as a square block.
local base = c.bg_highlight -- #002c38, used as the text colour on filled caps
local dim = c.fg_gutter -- #576d74, solarized base01
local NONE = "NONE"

local function mode(accent)
	return {
		a = { fg = base, bg = accent, gui = "bold" },
		b = { fg = accent, bg = NONE },
		c = { fg = c.fg, bg = NONE },
		x = { fg = dim, bg = NONE },
		y = { fg = c.fg_dark, bg = NONE },
		z = { fg = base, bg = accent, gui = "bold" },
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
		a = { fg = dim, bg = NONE },
		b = { fg = dim, bg = NONE },
		c = { fg = dim, bg = NONE },
	},
}
