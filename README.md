Based nvim config

## Dependencies
LSP servers
#### Arch:
```bash
sudo pacman -S lua-language-server clangd rust-analyzer go-pls bash-language-server shellcheck zls
pipx install basedpyright
npm i -g svelte-language-server @tailwindcss/language-server typescript-language-server
# typst lsp
cargo install --git https://github.com/Myriad-Dreamin/tinymist --locked tinymist-cli
```
#### Debian/Ubuntu:
**Note**: must use nightly nvim version! Consider bob nvim version manager or build from source
```bash
sudo apt update && sudo apt install -y clangd gopls shellcheck cargo npm python3-pip pipx curl git && pipx install basedpyright && npm i -g bash-language-server lua-fmt svelte-language-server @tailwindcss/language-server typescript-language-server && cargo install rust-analyzer --locked || curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c | sudo tee /usr/local/bin/rust-analyzer > /dev/null && sudo chmod +x /usr/local/bin/rust-analyzer && curl -L https://github.com/ziglang/zig/releases/latest/download/zig-linux-x86_64.tar.xz | tar -xJf - && sudo mv zig-linux-x86_64*/zig /usr/local/bin/ && cargo install --git https://github.com/Myriad-Dreamin/tinymist --locked tinymist-cli
```
