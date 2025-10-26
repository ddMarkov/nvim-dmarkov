# Dimi’s Neovim Config

Custom Neovim environment optimized for full-stack dev & rapid project switching.
Built around first-principles simplicity, modular Lua structure, and IDE-like ergonomics (PyCharm-style workflow, but faster).

- Minimal global state, everything modular
- Only plugins I deeply understand
- Same shortcuts across terminal, editor, and REPL
- Git & LSP integrated as first-class citizens

## 🔌 Key Plugins & Their Role

| Plugin | Purpose |
|---------|----------|
| **Telescope** | Fuzzy finding, project search 
| **Neo-tree** | File explorer 
| **ToggleTerm** | Integrated shell 
| **project.nvim** | Auto-detect & switch projects 
| **nvim-lspconfig** | LSP integration


## Development workflow
1. Open a project: `nvim .` or `:Telescope projects`
2. Toggle file tree: `<leader>e`
3. Search: `<leader>pf` or `<leader>ps`
4. Open terminal: `<leader>t`
5. Jump between splits with `<C-h/j/k/l>`
6. Exit terminal mode with `<C-[>`

## Adding a new plugin
1. Add it to `lua/dimi/packer.lua`
2. Run `:PackerSync`
3. Create `after/plugin/<name>.lua` for setup

## System Info
- Kitty terminal (might work with others too but Kitty is a satisfying option especially on Mac)
- Neovim 0.10.x
- Nerd Font: JetBrainsMono Nerd Font Mono

## 🧠 LSP Setup

This Neovim config uses **[mason.nvim](https://github.com/williamboman/mason.nvim)** and **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** to manage and configure Language Servers.

### Installed Language Servers
| Language | LSP Server | Notes |
|-----------|-------------|--------|
| **Lua** | `lua-language-server` | Used for Neovim config and plugin development |
| **Python** | `basedpyright` | Lightweight, modern alternative to Pyright |
| *(Optional)* TypeScript | `typescript-language-server` | For JS/TS projects |

### ⚙️ Setup Notes
- LSP servers **must be installed via Mason**, not manually.  
- To install missing servers:
  ```vim
  :MasonInstall lua-language-server basedpyright typescript-language-server

