# nvim config

## plugins

### core

- [lazy.nvim](https://github.com/folke/lazy.nvim) - plugin manager
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - nerd font icons

### appearance + ui

- [rose-pine](https://github.com/rose-pine/neovim) - theme
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - better syntax highlighting
- [statuscol](https://github.com/luukvbaal/statuscol.nvim) - enhanced status column
  - [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - for git information in the status column
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - statusline

### lsp + formatting

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - lsp configuration
- [mason.nvim](https://github.com/williamboman/mason.nvim) - lsp/formatter installer and manager
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - bridge between mason and lspconfig
- [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) - auto-installs formatters and linters
- [conform.nvim](https://github.com/stevearc/conform.nvim) - lightweight formatter
- [trouble](https://github.com/folke/trouble.nvim) - prettier diagnostics and references

### autocompletion

- [luasnip](https://github.com/L3MON4D3/LuaSnip) - snippet engine
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - completion engine
  - [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - lsp completion source
  - [cmp-path](https://github.com/hrsh7th/cmp-path) - filesystem path completion source
  - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - buffer completion source
  - [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - luasnip completion source

### navigation

- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - file explorer
- [telescope](https://github.com/nvim-telescope/telescope.nvim) - fuzzy finder
  - requires [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep

### qol

- [autopairs](https://github.com/windwp/nvim-autopairs) - auto closing of brackets and quotes
- [comment.nvim](https://github.com/numToStr/Comment.nvim) - smarter commenting
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - better code folding
  - [promise-async](https://github.com/kevinhwang91/promise-async) - used in ufo configs
- [which-key](https://github.com/folke/which-key.nvim) - keybindings popup

## dependencies

- Neovim >= 0.11.5
- a [patched nerd font](https://www.nerdfonts.com/)
- git
- c compiler in your path (for nvim-treesitter)

## keybindings

the leader key is set to `space`.

### general & system

| mapping     | description                                                          |
| ----------- | -------------------------------------------------------------------- |
| `<leader>w` | save the current buffer to disk                                      |
| `<leader>q` | close the current window or quit neovim                              |
| `<leader>?` | display an interactive list of all available keybindings (which-key) |
| `<esc>`     | clear search highlighting from the screen                            |
| `<tab>`     | indent the current visual selection                                  |
| `<s-tab>`   | outdent the current visual selection                                 |

### navigation & panes

| mapping        | description                                |
| -------------- | ------------------------------------------ |
| `<leader>e`    | toggle the nvim-tree file explorer sidebar |
| `<m-h>`        | shift focus to the window on the left      |
| `<m-j>`        | shift focus to the window below            |
| `<m-k>`        | shift focus to the window above            |
| `<m-l>`        | shift focus to the window on the right     |
| `<leader>'`    | split the current window horizontally      |
| `<leader><cr>` | split the current window vertically        |

### search & telescope

| mapping      | description                                            |
| ------------ | ------------------------------------------------------ |
| `<leader>ff` | fuzzy find files within the current working directory  |
| `<leader>fg` | search for string across all project files (live grep) |
| `zR`         | open all folds in the current buffer (ufo)             |
| `zM`         | close all folds in the current buffer (ufo)            |

### clipboard & editing

| mapping     | description                                                         |
| ----------- | ------------------------------------------------------------------- |
| `<c-c>`     | copy the visual selection to the system clipboard                   |
| `<c-v>`     | paste from the system clipboard while in insert mode                |
| `<leader>y` | yank the current line or selection to the system clipboard          |
| `<leader>p` | paste the contents of the system clipboard after the cursor         |
| `<leader>f` | format the current buffer or visual selection using conform.nvim    |
| `<c-_>`     | toggle line-wise comment for the current line or selection (ctrl+/) |
| `<m-/>`     | toggle block-wise comment for the current line or selection (alt+/) |

### lsp intelligence

| mapping      | description                                                                         |
| ------------ | ----------------------------------------------------------------------------------- |
| `k`          | show hover documentation for the symbol under the cursor                            |
| `gd`         | jump to the definition of the symbol under the cursor                               |
| `gd`         | jump to the declaration of the symbol under the cursor                              |
| `gi`         | list all implementations for the symbol under the cursor                            |
| `gl`         | show diagnostic details (errors/warnings) for the current line in a floating window |
| `go`         | jump to the type definition of the symbol under the cursor                          |
| `gr`         | list all references to the symbol under the cursor in a quickfix list               |
| `gs`         | display signature information for the function under the cursor                     |
| `<leader>rn` | rename all occurrences of the symbol under the cursor                               |
| `<leader>ca` | display available code actions/fixes for the current line                           |

### git integration (gitsigns)

| mapping       | description                                                            |
| ------------- | ---------------------------------------------------------------------- |
| `]c`          | jump to the next changed hunk in the file                              |
| `[c`          | jump to the previous changed hunk in the file                          |
| `<leader>gg`  | show a floating preview of the git hunk under the cursor               |
| `<leader>gs`  | stage or unstage the current hunk or visual selection                  |
| `<leader>grr` | reset the current hunk or visual selection to its last committed state |

### diagnostics & trouble

| mapping      | description                                                  |
| ------------ | ------------------------------------------------------------ |
| `<leader>xx` | toggle the trouble list for workspace-wide diagnostics       |
| `<leader>xx` | toggle the trouble list for the current buffer's diagnostics |
| `<leader>xq` | toggle the trouble quickfix list                             |
| `<leader>xl` | toggle the trouble location list                             |
| `<leader>xr` | toggle the trouble list for lsp references                   |
| `<leader>xd` | toggle the trouble list for lsp definitions                  |
| `<leader>xi` | toggle the trouble list for lsp implementations              |
| `<leader>xt` | toggle the trouble list for lsp type definitions             |
| `<leader>xs` | toggle a document symbols outline in the trouble panel       |
