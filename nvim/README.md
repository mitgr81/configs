# nvim

Personal Neovim configuration. Originally derived from
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), since migrated
from `lazy.nvim` to Neovim 0.12's built-in **`vim.pack`** plugin manager and
native LSP.

## Requirements

- **Neovim 0.12+** (uses `vim.pack`, `vim.lsp.config`/`vim.lsp.enable`,
  `vim.loader`).
- `git` on `PATH` (vim.pack clones plugins).
- A Nerd Font (`vim.g.have_nerd_font = true`).
- External tooling installed on demand by [mason](https://github.com/mason-org/mason.nvim)
  (LSP servers, etc.). A working compiler/`tree-sitter` for parser builds.

## Layout

```
init.lua                  Core: vim.loader, leader keys, options, base keymaps,
                          PackChanged build hook, optional startup profiler.
plugin/                   One file per plugin/concern. Auto-sourced by Neovim
                          alphabetically AFTER init.lua. Each file does
                          `vim.pack.add{...}` then its own setup().
  00-colorscheme.lua      Loaded first (tokyonight) to avoid a theme flash.
  01-treesitter.lua       Loaded early; many plugins depend on it.
  lsp.lua                 Native LSP (see below).
  completion.lua          nvim-cmp + LuaSnip stack.
  ...                     snacks, which-key, gitsigns, trouble, noice, etc.
  zz-custom-configs.lua   Loaded last; pulls in lua/custom/configs (which
                          overrides some plugin defaults, so order matters).
lua/custom/configs/       Non-plugin config: options, keymaps, commands,
                          neovide, and the keymap linter.
spell/                    Personal spell dictionary.
nvim-pack-lock.json       vim.pack lockfile (committed for reproducible installs).
```

Plugins are **eager-loaded** (no declarative lazy triggers); `vim.loader` keeps
startup fast.

## Plugin management (vim.pack)

| Task | How |
|------|-----|
| Add a plugin | Add `vim.pack.add{ 'https://github.com/owner/repo' }` to a `plugin/*.lua` file. Dependencies must be listed before dependents. |
| Update all | `:PackUpdate` — opens a review tab; `:write` confirms, `:quit` discards, then `:restart`. |
| Update some | `:PackUpdate snacks.nvim trouble.nvim` (tab-completes plugin names). |
| Update, no prompt | `:PackUpdate!` |
| Show installed (offline) | `:PackStatus` |
| Remove a plugin | Delete its `vim.pack.add` line, then `:lua vim.pack.del{ 'name' }`. |
| Health | `:checkhealth vim.pack` |
| Roll back a bad update | `git checkout HEAD -- nvim-pack-lock.json` then `:lua vim.pack.update(nil, { offline = true, target = 'lockfile' })`. |

Two plugins need special handling, documented inline in their files:
`plugin/refactoring.lua` (adds `lewis6991/async.nvim`) and `plugin/jinja.lua`
(bootstrap-clones without submodules, since vim.pack can't skip jinja.vim's
broken `test/bin` submodule).

## LSP

Native Neovim LSP, configured in `plugin/lsp.lua`:

- `vim.lsp.config('*', { ... })` sets shared capabilities + `on_attach` keymaps.
- `vim.lsp.config('<server>', { ... })` holds per-server overrides.
- `vim.lsp.enable({ ...servers... })` activates them.
- **mason** still installs the server binaries (`:Mason`, `U` to update).

## Handy commands

- `:PackUpdate` / `:PackUpdate!` / `:PackStatus` — plugin management (above).
- `:KeymapLint` — flags keymaps that duplicate a Neovim 0.11+ built-in default
  (e.g. `<leader>ca` vs the default `gra`) into the quickfix list. Also runs
  automatically on the first `LspAttach`; view results with `<leader>xQ`.
- `:Cppath` — copy the current file's absolute path to the clipboard.
- `PROF=1 nvim` — capture a snacks startup profile (replacement for
  `:Lazy profile`).

## Leader

`<space>` is both `mapleader` and `maplocalleader`.
