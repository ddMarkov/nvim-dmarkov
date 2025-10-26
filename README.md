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
