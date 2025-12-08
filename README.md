# Based nvim config

## Requirements
- Neovim 0.12+ (nightly)
- Git, (and the Languages listed below, for full support)

## Installation
```bash
git clone  https://github.com/mladicstefan/neovim ~/.config/nvim
nvim
```

## Supported Languages

| Language | LSP | Formatter |
|----------|-----|-----------|
| Lua | lua_ls | stylua |
| C/C++ | clangd | clang-format |
| Rust | rust_analyzer | rustfmt |
| Python | basedpyright | black, isort |
| Go | gopls | goimports, gofmt |
| JavaScript/TypeScript | ts_ls | prettier |
| Svelte | svelte | prettier |
| HTML/CSS | - | prettier |
| Bash | bashls | shfmt |
| Zig | zls | zigfmt |
| OCaml | ocamllsp | ocamlformat |
| Typst | tinymist | - |

**Note**: Most tools auto-install via Mason. Install Go and Zig system-wide for their formatters.
