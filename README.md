# Personal Neovim Configuration

A modern, feature-rich Neovim configuration optimized for web development, systems programming, and efficient code editing.

## Features

### Language Server Protocol (LSP)

Full LSP support with automatic server installation via Mason:

- **Lua** - lua_ls
- **TypeScript/JavaScript** - ts_ls
- **Solidity** - solidity, solidity_ls_nomicfoundation
- **Rust** - rust_analyzer
- **Prisma** - prismals

LSP features include hover documentation, go-to-definition, code actions, and inline diagnostics.

### Code Completion

Intelligent autocompletion powered by nvim-cmp with:

- LSP-based suggestions
- Snippet support via LuaSnip
- VSCode snippet format compatibility

### Formatting and Linting

Automatic code formatting and linting through none-ls:

- **Lua** - StyLua
- **JavaScript/TypeScript** - Prettier (with .prettierrc detection)
- **Solidity** - Forge fmt
- **JSON** - Fixjson
- **TOML** - Taplo
- **Rust** - Rustfmt
- **Linting** - ESLint via eslint_d

Format on save is enabled by default.

### Code Navigation

- **Telescope** - Fuzzy file finding and live grep search
- **Neo-tree** - Sidebar file explorer with git status integration
- **Treesitter** - Enhanced syntax highlighting and smart indentation

### Git Integration

- **Gitsigns** - Inline git hunks, blame annotations, and diff preview
- **Vim-fugitive** - Full git command wrapper

### User Interface

- **Catppuccin** - Macchiato color theme
- **Lualine** - Enhanced status line
- **Alpha** - Startup dashboard

## Key Bindings

Leader key: `<Space>`

### General

| Key | Action |
|-----|--------|
| `<C-d>` | Half-page down (centered) |
| `<C-u>` | Half-page up (centered) |
| `<Cmd-s>` | Format and save |
| `<D-r>` | Replace all occurrences of a word in the current file |

### LSP

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `<leader>ca` | Code actions |
| `<leader>e` | Expand diagnostic |

### Navigation

| Key | Action |
|-----|--------|
| `<C-p>` | Find files |
| `<leader>fg` | Live grep |
| `<C-n>` | Toggle file explorer |

### Git

| Key | Action |
|-----|--------|
| `<leader>gp` | Preview hunk |
| `<leader>gt` | Toggle line blame |

## Structure

```
~/.config/nvim/
├── init.lua              # Entry point and core settings
├── lazy-lock.json        # Plugin version lock file
└── lua/
    ├── vim-cmd.lua       # Editor settings
    └── plugins/          # Plugin configurations
        ├── lsp-config.lua
        ├── completions.lua
        ├── catppuccin.lua
        ├── telescope.lua
        ├── alpha.lua
        ├── lualine.lua
        ├── neo-tree.lua
        ├── gitsigns.lua
        ├── treesitter.lua
        ├── none-ls.lua
        └── vim-be-good.lua
```

## Requirements

- Neovim 0.9.0 or later
- Git
- A Nerd Font (for icons)
- ripgrep (for Telescope live grep)

## Installation

1. Backup your existing Neovim configuration
2. Clone this repository to `~/.config/nvim`
3. Open Neovim - plugins will be installed automatically via lazy.nvim

## Plugin Manager

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management with automatic bootstrapping and update checking.
