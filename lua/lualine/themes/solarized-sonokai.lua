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

-- Powerline needs each section to carry its own background: the  separator
-- is a filled glyph whose fg is the section it leaves and whose bg is the one
-- it enters, so adjacent sections must differ or the arrow is invisible.
--
--   a  accent fill      -- mode
--   b  base02           -- branch, diff, diagnostics
--   c  transparent      -- filename, lets the terminal through mid-bar
--   x  base02           -- lsp, encoding, filetype
--   y/z accent fill     -- progress, location
local b_bg = c.border -- #063540, solarized base02
local base = c.bg_highlight -- #002c38, text colour on the accent fills
local dim = c.fg_gutter
local NONE = "NONE"

local function mode(accent)
	return {
		a = { fg = base, bg = accent, gui = "bold" },
		b = { fg = accent, bg = b_bg },
		c = { fg = c.fg_dark, bg = NONE },
		x = { fg = dim, bg = b_bg },
		y = { fg = c.fg, bg = b_bg },
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
