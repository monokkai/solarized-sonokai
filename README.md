# solarized-sonokai

A Neovim colorscheme mixing two themes:

- **[Solarized Osaka](https://github.com/craftzdog/solarized-osaka.nvim)** — backgrounds and the neutral ramp
- **[Sonokai](https://github.com/sainnhe/sonokai)** — syntax accents

## Why mix them

Solarized Osaka's deep teal backgrounds (`#001419`, `#002c38`) look good behind a
transparent terminal, but several of its 500-level accents are too dark to read
against them — `green500` (`#849900`) measures 3.4:1 and `orange500` (`#c94c16`)
2.9:1, both under the 4.5:1 readability floor.

Sonokai's accents are vivid and all clear 4.5:1 on that background, but sonokai's
own base is a flat grey-purple (`#2c2e34`) that doesn't suit a transparent setup.

Taking the backgrounds from one and the accents from the other plays to each
one's strength. Solarized's brighter 300-level steps fill in `cyan` and
`magenta`, which sonokai has no equivalent for.

## Contrast

Measured against `bg` `#001419`:

| Role | Colour | Ratio |
| --- | --- | --- |
| fg | `#e2e2e3` | 14.56:1 |
| yellow — strings | `#e7c664` | 11.36:1 |
| green — functions, builtin tags | `#9ed072` | 10.52:1 |
| blue — types, attributes | `#76cce0` | 10.31:1 |
| cyan | `#2aeddd` | 12.80:1 |
| orange — params, imports | `#f39660` | 8.39:1 |
| purple — constants, decorators | `#b39df3` | 8.11:1 |
| red — keywords, components | `#fc5d7c` | 6.28:1 |
| violet | `#8b8fd6` | 6.28:1 |
| magenta | `#f254a0` | 5.88:1 |
| grey — punctuation | `#7f8490` | 5.03:1 |
| comment | `#6b7183` | 3.7:1 (dim on purpose) |

## Language support

Highlights are defined against the **standard Treesitter capture names**
(`@function`, `@type`, `@keyword`, `@tag`, `@attribute`, …) rather than
per-language groups. Every nvim-treesitter parser emits those captures, so any
language with a parser is styled — Go, Rust, Java, Kotlin, Swift, Python, Ruby,
C/C++, C#, PHP, Elixir, Haskell, Lua, SQL, GraphQL, Protobuf, and the rest.

Markup captures (`@tag`, `@tag.builtin`, `@tag.attribute`, `@tag.delimiter`)
cover TSX/JSX, Vue, Svelte, Astro, HTML and XML. LSP semantic tokens
(`@lsp.type.*`) are mapped too, so servers that emit them stay consistent with
the Treesitter colours.

### JSX / markup distinction

`@tag.builtin` (lowercase HTML elements — `div`, `section`, `h2`) is **green**,
while `@tag` (capitalised components — `<Box>`, `<HeaderLink>`) is **red**, so
imported components read differently from native elements at a glance.

## Install

With lazy.nvim, pointing at the local checkout:

```lua
{
  dir = "~/Desktop/developement/libs_configs/solarized-sonokai",
  name = "solarized-sonokai",
  lazy = false,
  priority = 1000,
  config = function()
    require("solarized-sonokai").setup({
      transparent = true,      -- let the terminal background through
      italic_comments = true,
      terminal_colors = true,
    })
    vim.cmd.colorscheme("solarized-sonokai")
  end,
}
```

Or without a plugin manager:

```vim
:set rtp+=~/Desktop/developement/libs_configs/solarized-sonokai
:colorscheme solarized-sonokai
```

## Layout

```
colors/solarized-sonokai.lua      entry point for :colorscheme
lua/solarized-sonokai/init.lua    setup(), load(), terminal colours
lua/solarized-sonokai/palette.lua both source palettes + the mix
lua/solarized-sonokai/theme.lua   highlight group definitions
```

Both source palettes are exported whole as `palette.solarized` and
`palette.sonokai`, so a different mix can be assembled without re-deriving the
values.
# solarized-sonokai
