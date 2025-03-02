Repro of https://github.com/Saghen/blink.cmp/issues/636

To run:
`nvim --clean -u clipboard.lua file.txt`

Then, in nvim:
`Vyi<esc>i`
or
`i<esc>Vyi`

You should see "Waiting for OSC 52 response from the terminal. Press Ctrl-C to interrupt..."

For the same bug without blink:
`nvim --clean -u without-blink.lua file.txt`

and the same behavior occurs.

For the most minimized version, you can run it with e.g. 
nix run github:nix-community/neovim-nightly-overlay#neovim -- --clean -u minimized.lua file.txt

Any command to enter insert mode will then stall trying to fetch the register.
