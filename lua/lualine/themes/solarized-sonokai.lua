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

-- Bubbles: only a and z are filled -- those are the pills the round caps close
-- off. Everything between them is transparent so the terminal shows through,
-- which is what makes the two ends read as separate bubbles rather than as the
-- ends of one continuous bar.
local base = c.bg_highlight -- #002c38, text colour on the accent fills
local dim = c.fg_gutter
local NONE = "NONE"

local function mode(accent)
	return {
		a = { fg = base, bg = accent, gui = "bold" },
		b = { fg = accent, bg = NONE },
		c = { fg = c.fg_dark, bg = NONE },
		x = { fg = dim, bg = NONE },
		y = { fg = c.fg, bg = NONE },
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
