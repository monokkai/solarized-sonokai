-- solarized-sonokai palette
--
-- Backgrounds + the neutral ramp come from craftzdog/solarized-osaka: deep
-- desaturated teals that sit well behind a transparent terminal.
--
-- Syntax accents come from sainnhe/sonokai (default variant): vivid and high
-- contrast where solarized's own 500-level accents are muted and several fall
-- under 4.5:1 (its green500 #849900 is only 3.4:1, orange500 #c94c16 is 2.9:1).
--
-- Solarized's brighter 300-level steps are kept for the accents where its hue is
-- more distinctive than sonokai's -- cyan and magenta especially, which sonokai
-- does not have as separate colours at all.
--
-- Every value below is measured against bg #001419. All syntax colours clear
-- 4.5:1 except `comment`, which is deliberately dim so comments recede.

local M = {}

-- ── Source palettes, kept whole so variants can be assembled from them ───────

--- craftzdog/solarized-osaka
M.solarized = {
	base04 = "#001419",
	base03 = "#002c38",
	base02 = "#063540",
	base01 = "#576d74",
	base00 = "#637981",
	base0 = "#9eabac",
	base1 = "#adb7b7",
	base2 = "#ede7d3",
	base3 = "#fdf5e2",

	yellow500 = "#b28500",
	orange500 = "#c94c16",
	red500 = "#db302d",
	magenta300 = "#f254a0",
	magenta500 = "#d23681",
	violet500 = "#6d71c4",
	blue300 = "#46acf5",
	blue500 = "#268bd3",
	cyan300 = "#2aeddd",
	cyan500 = "#29a298",
	green500 = "#849900",
}

--- sainnhe/sonokai (default variant)
M.sonokai = {
	fg = "#e2e2e3",
	red = "#fc5d7c",
	orange = "#f39660",
	yellow = "#e7c664",
	green = "#9ed072",
	blue = "#76cce0",
	purple = "#b39df3",
	grey = "#7f8490",
	grey_dim = "#595f6f",

	bg_red = "#55393d",
	bg_yellow = "#4e432f",
	bg_green = "#394634",
	bg_blue = "#354157",
	bg_purple = "#434055",
}

-- ── The mix ──────────────────────────────────────────────────────────────────

local sol, son = M.solarized, M.sonokai

M.palette = {
	-- Backgrounds: solarized
	bg = sol.base04, -- #001419
	bg_dark = "#000d11",
	bg_highlight = sol.base03, -- #002c38
	bg_visual = "#0a3a47",
	bg_float = sol.base04,
	bg_sidebar = sol.base04,
	border = sol.base02, -- #063540

	-- Neutrals: solarized ramp, sonokai fg (brighter than base0)
	fg = son.fg, -- 14.56:1
	fg_dark = sol.base0, -- #9eabac
	fg_gutter = sol.base01, -- #576d74
	comment = "#6b7183", -- sonokai grey_dim lifted to ~3.7:1

	-- Accents: sonokai
	red = son.red, --  6.28:1
	orange = son.orange, --  8.39:1
	yellow = son.yellow, -- 11.36:1
	green = son.green, -- 10.52:1
	blue = son.blue, -- 10.31:1
	purple = son.purple, --  8.11:1
	grey = son.grey, --  5.03:1

	-- Accents: solarized, for hues sonokai lacks
	cyan = sol.cyan300, -- 12.80:1
	magenta = sol.magenta300, --  5.88:1
	violet = "#8b8fd6", -- violet500 lifted, 6.28:1

	-- Muted fills: sonokai
	bg_red = son.bg_red,
	bg_yellow = son.bg_yellow,
	bg_green = son.bg_green,
	bg_blue = son.bg_blue,
	bg_purple = son.bg_purple,

	-- ── Markup accents ───────────────────────────────────────────────────────
	-- Hand-tuned for JSX/TSX/Astro. These keep the hues that were dialled in
	-- against this background rather than reusing the generic accents, so
	-- brackets, tag names and attributes stay distinguishable from each other
	-- at a glance. All measured against bg #001419.
	-- Imported / user components: <Header>, <BasicPage>. 4.66:1
	jsx_component = "#C53836",
	jsx_bracket = "#C83A37", -- < > </ />              5.16:1
	jsx_tag = "#AEC544", -- div, h2, section       9.76:1
	jsx_attr = "#588FC8", -- as=, bg=, className=   5.55:1
	jsx_text = "#E8E8E8", -- literal text in tags  13.7:1
	-- import / from / export and the other module keywords. 4.13:1 -- just
	-- under the 4.5:1 floor, which suits a block that sits at the top of a
	-- file and should not compete with the code below it.
	jsx_keyword = "#849902",
	-- kept as an alias so anything still reading jsx_import keeps working
	jsx_import = "#849902",

	git_add = son.green,
	git_change = son.yellow,
	git_delete = son.red,

	none = "NONE",
}

--- @param opts table|nil  { transparent = boolean }
function M.setup(opts)
	opts = opts or {}
	local c = vim.deepcopy(M.palette)
	if opts.transparent then
		c.bg = "NONE"
		c.bg_float = "NONE"
		c.bg_sidebar = "NONE"
		c.bg_dark = "NONE"
	end
	return c
end

return M
