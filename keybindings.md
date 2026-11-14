# Neovim Keybindings

Modes: **n** = normal, **v** = visual, **i** = insert

## General

| Key | Mode | Action |
|-----|------|--------|
| `<Esc>` | n | Clear search highlight |
| `<leader>w` | n | Save |
| `<leader>q` | n | Quit |
| `<leader>ek` | n | Edit keybindings file |

## Window Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | n | Window left |
| `<C-j>` | n | Window down |
| `<C-k>` | n | Window up |
| `<C-l>` | n | Window right |

## Splits

| Key | Mode | Action |
|-----|------|--------|
| `<leader>sv` | n | Vertical split |
| `<leader>sh` | n | Horizontal split |
| `<leader>se` | n | Equalize splits |
| `<leader>sx` | n | Close split |

## Buffers

| Key | Mode | Action |
|-----|------|--------|
| `<S-h>` | n | Previous buffer |
| `<S-l>` | n | Next buffer |
| `<leader>bd` | n | Delete buffer |

## Editing

| Key | Mode | Action |
|-----|------|--------|
| `J` | v | Move selection down |
| `K` | v | Move selection up |
| `<` | v | Indent left (keep selection) |
| `>` | v | Indent right (keep selection) |
| `<leader>y` | n, v | Copy to system clipboard |
| `<leader>p` | n, v | Paste from system clipboard |
| `<leader>cf` | n, v | Format (conform, LSP fallback) |

## File Explorer (NvimTree)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ee` | n | Toggle file explorer |

## Telescope

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | n | Find files |
| `<leader>fg` | n | Live grep |
| `<leader>fb` | n | Buffers |
| `<leader>fh` | n | Help tags |
| `<leader>fr` | n | Recent files |
| `<leader>fd` | n | Diagnostics |
| `<leader>fs` | n | Document symbols |
| `<leader>fa` | n | Find files in home directory (incl. hidden) |

## LSP (active when a language server attaches)

| Key | Mode | Action |
|-----|------|--------|
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gi` | n | Go to implementation |
| `gy` | n | Go to type definition |
| `gr` | n | References |
| `K` | n | Hover docs |
| `<C-s>` | i | Signature help |
| `<leader>rn` | n | Rename symbol |
| `<leader>ca` | n, v | Code action |
| `<leader>co` | n | Organize imports |
| `<leader>cR` | n | Remove unused imports (TypeScript) |
| `<leader>e` | n | Line diagnostics |
| `[d` | n | Previous diagnostic |
| `]d` | n | Next diagnostic |

## Git (Fugitive)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gg` | n | Git status |
| `<leader>gc` | n | Git commit |
| `<leader>gp` | n | Git push |
| `<leader>gb` | n | Git blame |

## Completion (blink.cmp)

| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | i | Show menu / toggle documentation |
| `<C-e>` | i | Hide menu |
| `<CR>` | i | Accept |
| `<Tab>` | i | Next item / snippet forward |
| `<S-Tab>` | i | Previous item / snippet backward |
| `<C-n>` | i | Next item |
| `<C-p>` | i | Previous item |
| `<C-b>` | i | Scroll docs up |
| `<C-f>` | i | Scroll docs down |

## Multiple Cursors

| Shortcut | Mode | Action |
|---|---|---|
| `<leader>mc` | Normal | Select word under cursor |
| `<leader>mc` again | Multiple-cursor | Select next occurrence |
| `<leader>ma` | Normal | Select all occurrences |
| `Esc` | Multiple-cursor | Exit multiple-cursor mode |
