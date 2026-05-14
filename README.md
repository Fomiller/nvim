# nvim config

Personal Neovim configuration. Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim). LSP: native `vim.lsp` (Neovim 0.11+ API).

## Layout

```
init.lua                      -- entry point; loads everything below
lua/
  config/
    lazy.lua                  -- bootstrap lazy.nvim, set mapleader + termguicolors
    options.lua               -- vim.opt.* settings
    keymaps.lua               -- global keymaps
    autocmds.lua              -- autocmds (formatoptions, conform on save, etc.)
    diagnostics.lua           -- vim.diagnostic.config()
    lsp-servers.lua           -- ⭐ single source of truth for LSP servers
    functions/
      utils.lua               -- Utils.Smart_quit etc.
  plugins/                    -- one file per plugin spec, auto-loaded by lazy
    nvim-lspconfig.lua        -- consumes lsp-servers.lua; owns LspAttach keymaps
    mason.lua                 -- consumes lsp-servers.lua for ensure_installed
    mason-tool-installer.lua  -- non-LSP CLI tools (stylua, goimports, jq, yq, terraform)
    treesitter.lua            -- parser list + FileType autocmd + filetype detection
    blink.lua                 -- completion
    conform.lua               -- formatters
    telescope.lua             -- fuzzy finder
    ...
```

## The two things I actually touch: LSP + treesitter

### Add an LSP server

1. Open `lua/config/lsp-servers.lua`.
2. Add an entry. Use `{}` for default config, or a settings table:

   ```lua
   pyright = {},
   jsonls  = {
       settings = { json = { validate = { enable = true } } },
   },
   ```
3. Restart nvim. `mason-lspconfig` installs the server, `nvim-lspconfig` enables it with blink.cmp capabilities attached.

That's it — one file, one place.

### Add a treesitter parser

1. Open `lua/plugins/treesitter.lua`.
2. Append the parser name to the `parsers` table.
3. Restart nvim. `install(parsers)` compiles it on startup.
4. If the parser belongs to a filetype with a different name (e.g. `tsx` → `typescriptreact`), add the filetype to the `vim.list_extend(...)` block too.

### Add a filetype detection rule

`vim.filetype.add` lives at the bottom of `treesitter.lua`. Add a pattern there:

```lua
[".*%.bazel"] = "starlark",
```

## Day-to-day commands

| What | Command |
|---|---|
| Sync plugins (install/update/clean in one go) | `:Lazy sync` |
| Update plugins only | `:Lazy update` |
| Remove unused plugins | `:Lazy clean` |
| Update LSP servers | `:Mason` → `U` |
| Update CLI tools (jq, yq, stylua, etc.) | `:MasonToolsUpdate` |
| Update treesitter parsers | `:TSUpdate` |
| Check LSP health for current buffer | `:checkhealth lsp` |
| List clients attached to current buffer | `:LspInfo` |
| Check treesitter health | `:checkhealth nvim-treesitter` |
| Inspect treesitter highlight under cursor | `:Inspect` |
| Inspect full treesitter tree | `:InspectTree` |

## Build dependencies

These need to be on `$PATH` system-wide (Neovim's plugin manager can't install them itself):

- `tree-sitter` CLI — used to compile parsers from source (`brew install tree-sitter`).
- `git`, `make`, a C compiler — pulled in by Xcode CLT or Homebrew.
- `deno` — only if you re-add peek.nvim (currently removed).

Everything else (LSP servers, formatters, linters) is managed by Mason and lives under `~/.local/share/nvim/mason/`.

## Diagnostics

Diagnostics come from the LSPs configured in `lua/config/lsp-servers.lua`. Global UI settings (signs, virtual text, float style) live in `lua/config/diagnostics.lua`.

| Action | Key |
|---|---|
| Next diagnostic (in any buffer) | `]d` |
| Previous diagnostic | `[d` |
| Open float for diagnostic under cursor (LSP buffers only) | `<leader>vd` |
| Project-wide diagnostics list | `<leader>tt` (Trouble) |
| Current buffer diagnostics | `<leader>TT` (Trouble) |
| Quickfix list (Trouble) | `<leader>xQ` |

### Per-language notes

- **Go (gopls):** `staticcheck` is enabled, plus the `unusedparams` / `shadow` / `nilness` / `useany` analyzers. Inlay hints are ON by default — toggle with `<leader>ih`.
- **Rust (rust_analyzer):** runs `clippy` on save (not just `cargo check`). All cargo features are enabled. Inlay hints are ON by default — toggle with `<leader>ih`.
- **Terraform (terraformls + tflint):** both attach to `.tf` files. terraformls handles HCL/schema; tflint adds extra lint rules from `.tflint.hcl` if present. Virtual-text shows the source name when both report on the same line.

### Inlay hints

Inlay hints are virtual overlays from the LSP (parameter names at call sites, inferred types, etc.). They're not part of the file — display-only.

| Action | How |
|---|---|
| Toggle inlay hints in current buffer | `<leader>ih` |
| Change which languages have hints on by default | Edit `inlay_hints_default_on` in `lua/plugins/nvim-lspconfig.lua` |

Currently default-on for `go` and `rust`. Add filetypes (`lua`, `typescript`, etc.) by editing the table.

### Tuning a server

Edit its entry in `lua/config/lsp-servers.lua` and restart nvim. The config is passed to `vim.lsp.config[server]` verbatim — see `:h vim.lsp.config` and each server's docs.

## Troubleshooting

- **LSP not attaching?** Check `:LspInfo` and `:checkhealth lsp`. Confirm the server is installed (`:Mason`) and the filetype matches what `nvim-lspconfig` expects for that server.
- **Treesitter error on startup?** Confirm the `tree-sitter` CLI is on `$PATH`. Then `:TSUpdate <parser>` to rebuild a specific one.
- **Stale bytecode after a plugin update?** `rm -rf ~/.cache/nvim/luac` and restart.
- **LSP log filling up disk?** It's at `~/.local/state/nvim/lsp.log`. Log level is set to `WARN` in `options.lua` — if it still grows fast, a specific server is noisy (check the file's last entries).
