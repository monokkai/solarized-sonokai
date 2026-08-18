-- Highlight definitions for solarized-sonokai.
--
-- Language coverage: this maps the standard Treesitter capture names
-- (@function, @type, @keyword, @tag ...). Those captures are what every
-- nvim-treesitter parser emits, so any language with a parser is styled without
-- a per-language block. The `@tag.*` and markup groups cover
-- tsx/jsx/vue/svelte/astro/html/xml; @attribute covers those plus python
-- decorators, java annotations, rust attributes and C# attributes.

local M = {}

function M.get(c)
	local none = "NONE"

	return {
		-- ── Editor ───────────────────────────────────────────────────────────
		Normal = { fg = c.fg, bg = c.bg },
		NormalNC = { fg = c.fg, bg = c.bg },
		NormalFloat = { fg = c.fg, bg = c.bg_float },
		FloatBorder = { fg = c.border, bg = c.bg_float },
		FloatTitle = { fg = c.blue, bg = c.bg_float, bold = true },
		ColorColumn = { bg = c.bg_highlight },
		Cursor = { fg = c.bg, bg = c.fg },
		CursorLine = { bg = c.bg_highlight },
		CursorColumn = { bg = c.bg_highlight },
		CursorLineNr = { fg = c.yellow, bold = true },
		LineNr = { fg = c.fg_gutter },
		SignColumn = { bg = none },
		VertSplit = { fg = c.border },
		WinSeparator = { fg = c.border },
		Folded = { fg = c.blue, bg = c.bg_highlight },
		FoldColumn = { fg = c.fg_gutter, bg = none },
		Visual = { bg = c.bg_visual },
		VisualNOS = { bg = c.bg_visual },
		Search = { fg = c.bg, bg = c.yellow },
		IncSearch = { fg = c.bg, bg = c.orange },
		CurSearch = { fg = c.bg, bg = c.orange },
		MatchParen = { fg = c.orange, bold = true },
		NonText = { fg = c.fg_gutter },
		Whitespace = { fg = c.fg_gutter },
		SpecialKey = { fg = c.fg_gutter },
		EndOfBuffer = { fg = c.bg },
		Directory = { fg = c.blue },
		Title = { fg = c.green, bold = true },
		ErrorMsg = { fg = c.red },
		WarningMsg = { fg = c.yellow },
		ModeMsg = { fg = c.fg, bold = true },
		MoreMsg = { fg = c.blue },
		Question = { fg = c.blue },
		QuickFixLine = { bg = c.bg_visual, bold = true },
		-- Transparent: lualine draws its own section backgrounds on top, and an
		-- opaque StatusLine here would paint the full-width bar behind them --
		-- which defeats the bubble caps and any transparency in the theme.
		StatusLine = { fg = c.fg, bg = none },
		StatusLineNC = { fg = c.comment, bg = none },
		TabLine = { fg = c.comment, bg = c.bg_highlight },
		TabLineFill = { bg = c.bg_highlight },
		TabLineSel = { fg = c.bg, bg = c.yellow, bold = true },
		WildMenu = { fg = c.bg, bg = c.blue },
		Pmenu = { fg = c.fg, bg = c.bg_highlight },
		PmenuSel = { fg = c.bg, bg = c.blue, bold = true },
		PmenuSbar = { bg = c.bg_highlight },
		PmenuThumb = { bg = c.fg_gutter },

		-- ── Legacy syntax groups ─────────────────────────────────────────────
		Comment = { fg = c.comment, italic = true },
		Constant = { fg = c.purple },
		String = { fg = c.yellow },
		Character = { fg = c.yellow },
		Number = { fg = c.purple },
		Boolean = { fg = c.purple },
		Float = { fg = c.purple },
		Identifier = { fg = c.fg },
		Function = { fg = c.green },
		Statement = { fg = c.red },
		Conditional = { fg = c.red },
		Repeat = { fg = c.red },
		Label = { fg = c.red },
		Operator = { fg = c.red },
		Keyword = { fg = c.red },
		Exception = { fg = c.red },
		PreProc = { fg = c.purple },
		Include = { fg = c.red },
		Define = { fg = c.purple },
		Macro = { fg = c.purple },
		Type = { fg = c.blue },
		StorageClass = { fg = c.red },
		Structure = { fg = c.blue },
		Typedef = { fg = c.blue },
		Special = { fg = c.orange },
		SpecialComment = { fg = c.comment, italic = true },
		Underlined = { underline = true },
		Bold = { bold = true },
		Italic = { italic = true },
		Todo = { fg = c.bg, bg = c.yellow, bold = true },
		Error = { fg = c.red },

		-- ── Treesitter: language-agnostic, so every parser is covered ────────
		["@variable"] = { fg = c.fg },
		["@variable.builtin"] = { fg = c.purple, italic = true },
		["@variable.parameter"] = { fg = c.orange },
		["@variable.member"] = { fg = c.fg },

		["@constant"] = { fg = c.purple },
		["@constant.builtin"] = { fg = c.purple, italic = true },
		["@constant.macro"] = { fg = c.purple },

		["@module"] = { fg = c.fg },
		["@label"] = { fg = c.red },

		["@string"] = { fg = c.yellow },
		["@string.documentation"] = { fg = c.yellow },
		["@string.regexp"] = { fg = c.orange },
		["@string.escape"] = { fg = c.purple },
		["@string.special"] = { fg = c.orange },
		["@string.special.url"] = { fg = c.blue, underline = true },
		["@character"] = { fg = c.yellow },
		["@character.special"] = { fg = c.orange },

		["@boolean"] = { fg = c.purple },
		["@number"] = { fg = c.purple },
		["@number.float"] = { fg = c.purple },

		["@type"] = { fg = c.blue },
		["@type.builtin"] = { fg = c.blue, italic = true },
		["@type.definition"] = { fg = c.blue },
		["@type.qualifier"] = { fg = c.red },

		["@attribute"] = { fg = c.purple }, -- decorators, annotations, derives
		["@property"] = { fg = c.fg },

		["@function"] = { fg = c.green },
		["@function.builtin"] = { fg = c.green, italic = true },
		["@function.call"] = { fg = c.green },
		["@function.macro"] = { fg = c.purple },
		["@function.method"] = { fg = c.green },
		["@function.method.call"] = { fg = c.green },
		["@constructor"] = { fg = c.blue },

		["@operator"] = { fg = c.red },

		["@keyword"] = { fg = c.red },
		["@keyword.coroutine"] = { fg = c.red },
		["@keyword.function"] = { fg = c.red },
		["@keyword.operator"] = { fg = c.red },
		["@keyword.type"] = { fg = c.red },
		["@keyword.modifier"] = { fg = c.red },
		["@keyword.repeat"] = { fg = c.red },
		["@keyword.return"] = { fg = c.red },
		["@keyword.debug"] = { fg = c.red },
		["@keyword.exception"] = { fg = c.red },
		["@keyword.conditional"] = { fg = c.red },
		["@keyword.directive"] = { fg = c.purple },

		["@punctuation.delimiter"] = { fg = c.grey },
		["@punctuation.bracket"] = { fg = c.grey },
		["@punctuation.special"] = { fg = c.orange },

		["@comment"] = { fg = c.comment, italic = true },
		["@comment.documentation"] = { fg = c.comment, italic = true },
		["@comment.error"] = { fg = c.bg, bg = c.red, bold = true },
		["@comment.warning"] = { fg = c.bg, bg = c.yellow, bold = true },
		["@comment.todo"] = { fg = c.bg, bg = c.blue, bold = true },
		["@comment.note"] = { fg = c.bg, bg = c.green, bold = true },

		-- Markup: html, xml, jsx, tsx, vue, svelte, astro, markdown
		--
		-- @tag.builtin is lowercase html (div, section); @tag is a capitalised
		-- component (<Box>). Treesitter gives components BOTH captures and
		-- applies @tag last, so the two can be coloured independently.
		["@tag"] = { fg = c.jsx_component }, -- <Header>, <BasicPage>, ...
		["@tag.builtin"] = { fg = c.jsx_tag }, -- div, h2, section ...
		["@tag.attribute"] = { fg = c.jsx_attr }, -- className=, as=, href=
		["@tag.delimiter"] = { fg = c.jsx_bracket }, -- < > </ />
		["@markup.raw.block"] = { fg = c.jsx_text },

		-- Module keywords -- import / from / export / default. These sit in a
		-- block at the top of a file and read as structure rather than logic,
		-- so they get their own colour away from the generic red @keyword.
		-- `import`, `from` and `export` all resolve to @keyword.import.
		-- `default` is plain @keyword, so it is left alone: colouring that
		-- group would repaint every keyword in the file.
		["@keyword.import"] = { fg = c.jsx_keyword },

		["@markup.strong"] = { fg = c.fg, bold = true },
		["@markup.italic"] = { fg = c.fg, italic = true },
		["@markup.strikethrough"] = { fg = c.comment, strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.heading"] = { fg = c.green, bold = true },
		["@markup.quote"] = { fg = c.comment, italic = true },
		["@markup.math"] = { fg = c.purple },
		["@markup.link"] = { fg = c.blue },
		["@markup.link.label"] = { fg = c.blue },
		["@markup.link.url"] = { fg = c.blue, underline = true },
		["@markup.raw"] = { fg = c.yellow },
		["@markup.list"] = { fg = c.red },
		["@markup.list.checked"] = { fg = c.green },
		["@markup.list.unchecked"] = { fg = c.comment },

		["@diff.plus"] = { fg = c.git_add },
		["@diff.minus"] = { fg = c.git_delete },
		["@diff.delta"] = { fg = c.git_change },

		-- ── LSP semantic tokens ──────────────────────────────────────────────
		["@lsp.type.class"] = { fg = c.blue },
		["@lsp.type.decorator"] = { fg = c.purple },
		["@lsp.type.enum"] = { fg = c.blue },
		["@lsp.type.enumMember"] = { fg = c.purple },
		["@lsp.type.interface"] = { fg = c.blue },
		["@lsp.type.function"] = { fg = c.green },
		["@lsp.type.macro"] = { fg = c.purple },
		["@lsp.type.method"] = { fg = c.green },
		["@lsp.type.namespace"] = { fg = c.fg },
		["@lsp.type.parameter"] = { fg = c.orange },
		["@lsp.type.property"] = { fg = c.fg },
		["@lsp.type.struct"] = { fg = c.blue },
		["@lsp.type.type"] = { fg = c.blue },
		["@lsp.type.typeParameter"] = { fg = c.blue, italic = true },
		["@lsp.type.variable"] = { fg = c.fg },
		["@lsp.mod.readonly"] = { fg = c.purple },
		["@lsp.mod.deprecated"] = { strikethrough = true },

		-- ── Diagnostics ──────────────────────────────────────────────────────
		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.yellow },
		DiagnosticInfo = { fg = c.blue },
		DiagnosticHint = { fg = c.green },
		DiagnosticOk = { fg = c.green },
		DiagnosticUnderlineError = { undercurl = true, sp = c.red },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.green },
		DiagnosticVirtualTextError = { fg = c.red, bg = c.bg_red },
		DiagnosticVirtualTextWarn = { fg = c.yellow, bg = c.bg_yellow },
		DiagnosticVirtualTextInfo = { fg = c.blue, bg = c.bg_blue },
		DiagnosticVirtualTextHint = { fg = c.green, bg = c.bg_green },

		LspReferenceText = { bg = c.bg_visual },
		LspReferenceRead = { bg = c.bg_visual },
		LspReferenceWrite = { bg = c.bg_visual },
		LspInlayHint = { fg = c.fg_gutter, italic = true },
		LspSignatureActiveParameter = { fg = c.orange, bold = true },

		-- ── Diff / git ───────────────────────────────────────────────────────
		DiffAdd = { fg = c.git_add, bg = c.bg_green },
		DiffChange = { fg = c.git_change, bg = c.bg_yellow },
		DiffDelete = { fg = c.git_delete, bg = c.bg_red },
		DiffText = { fg = c.fg, bg = c.bg_blue },
		diffAdded = { fg = c.git_add },
		diffRemoved = { fg = c.git_delete },
		diffChanged = { fg = c.git_change },
		diffFile = { fg = c.blue },
		diffLine = { fg = c.comment },

		GitSignsAdd = { fg = c.git_add },
		GitSignsChange = { fg = c.git_change },
		GitSignsDelete = { fg = c.git_delete },

		-- ── Plugins ──────────────────────────────────────────────────────────
		TelescopeNormal = { fg = c.fg, bg = c.bg_float },
		TelescopeBorder = { fg = c.border, bg = c.bg_float },
		TelescopeTitle = { fg = c.blue, bold = true },
		TelescopeSelection = { bg = c.bg_visual, bold = true },
		TelescopeMatching = { fg = c.orange, bold = true },
		TelescopePromptPrefix = { fg = c.red },

		NeoTreeNormal = { fg = c.fg_dark, bg = c.bg_sidebar },
		NeoTreeNormalNC = { fg = c.fg_dark, bg = c.bg_sidebar },
		NeoTreeDirectoryName = { fg = c.blue },
		NeoTreeDirectoryIcon = { fg = c.blue },
		NeoTreeRootName = { fg = c.green, bold = true },
		NeoTreeFileName = { fg = c.fg_dark },
		NeoTreeGitAdded = { fg = c.git_add },
		NeoTreeGitModified = { fg = c.git_change },
		NeoTreeGitDeleted = { fg = c.git_delete },
		NeoTreeIndentMarker = { fg = c.fg_gutter },

		BufferLineFill = { bg = c.bg_highlight },
		BufferLineBackground = { fg = c.comment, bg = c.bg_highlight },

		WhichKey = { fg = c.red },
		WhichKeyGroup = { fg = c.blue },
		WhichKeyDesc = { fg = c.fg },
		WhichKeySeparator = { fg = c.comment },
		WhichKeyFloat = { bg = c.bg_float },

		IndentBlanklineChar = { fg = c.fg_gutter },
		IblIndent = { fg = c.fg_gutter },
		IblScope = { fg = c.blue },

		NotifyERRORBorder = { fg = c.red },
		NotifyWARNBorder = { fg = c.yellow },
		NotifyINFOBorder = { fg = c.blue },
		NotifyDEBUGBorder = { fg = c.comment },
		NotifyTRACEBorder = { fg = c.purple },
		NotifyERRORTitle = { fg = c.red },
		NotifyWARNTitle = { fg = c.yellow },
		NotifyINFOTitle = { fg = c.blue },

		CmpItemAbbr = { fg = c.fg },
		CmpItemAbbrMatch = { fg = c.orange, bold = true },
		CmpItemKind = { fg = c.blue },
		CmpItemMenu = { fg = c.comment },

		FlashLabel = { fg = c.bg, bg = c.red, bold = true },
		LeapLabelPrimary = { fg = c.bg, bg = c.red, bold = true },
	}
end

return M
