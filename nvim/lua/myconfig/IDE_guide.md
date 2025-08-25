# 🚀 Neovim IDE Configuration Guide

This setup transforms your Neovim into a full-featured IDE with support for Swift, Bash, Zsh, and Python development.

## ✨ Features

- **LSP Support**: Language servers for intelligent code completion and diagnostics
- **Treesitter**: Enhanced syntax highlighting and code folding
- **Modern UI**: File explorer, statusline, bufferline, and beautiful theme
- **Version Control**: Comprehensive Git integration via gitsigns
- **Code Formatting**: Automatic formatting with conform.nvim
- **Diagnostics**: Trouble.nvim for better error navigation
- **Fuzzy Finding**: Telescope with FZF for fast file/text searching

## 🛠️ Installation Requirements

### Prerequisites
1. **Neovim** >= 0.9.4
2. **Node.js** (installed automatically via Homebrew)
3. **Git** (for version control features)

### Language Server Prerequisites
- **Swift**: Install Xcode command line tools: `xcode-select --install`
- **Python**: pyright (installed automatically via Mason)
- **Bash**: bashls (installed automatically via Mason)
- **Lua**: lua_ls (installed automatically via Mason)

## ⌨️ Keybindings

### File Navigation
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle NeoTree file explorer |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | List open buffers |
| `<leader>fh` | Help tags |

### LSP Features
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover documentation |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>d` | Show diagnostics |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<C-k>` | Signature help |

### Code Editing
| Key | Action |
|-----|--------|
| `<C-Space>` | Trigger completion |
| `<leader>f` | Format current buffer |
| `gc` | Toggle line comment |
| `<C-\>` | Toggle terminal |

### Diagnostics (Trouble.nvim)
| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle Trouble |
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `<leader>xl` | Location list |
| `<leader>xq` | Quickfix list |
| `gR` | LSP references |

### Git Operations
| Key | Action |
|-----|--------|
| `<leader>gh` | Preview hunk |
| `<leader>gb` | Blame line |
| `<leader>gs` | Stage hunk |
| `<leader>gu` | Undo stage hunk |
| `<leader>gr` | Reset hunk |

### Snacks Notifications
| Key | Action |
|-----|--------|
| `<leader>nh` | Show notification history |
| `<leader>nd` | Dismiss all notifications |
| `<leader>nm` | Show motivational message |
| `<leader>nt` | Show coding session time |
| `<leader>ns` | Show file statistics |

## 🎨 Appearance
- **Theme**: Tokyo Night (dark, modern theme)
- **Statusline**: Lualine with Git branch and LSP info
- **Bufferline**: Tab-like interface for open buffers
- **File Explorer**: NeoTree with Git status integration
- **Indent Guides**: Visual indentation lines

## 🔧 Language-Specific Configuration

### Swift Development
- **LSP**: sourcekit-lsp (requires Xcode)
- **Formatting**: swift-format (install via `brew install swift-format`)
- **Indentation**: 4 spaces, 100 character line limit

### Python Development
- **LSP**: pyright (auto-installed)
- **Formatting**: black (install via `pip install black`)
- **Indentation**: 4 spaces, 88 character line limit

### Bash/Zsh Development
- **LSP**: bashls (auto-installed)
- **Formatting**: shfmt (install via `brew install shfmt`)
- **Indentation**: 2 spaces, 80 character line limit

## 🚀 Getting Started

1. **Open Neovim**: The configuration loads automatically
2. **Install Language Servers**: Run `:Mason` to manage LSP servers
3. **Check Health**: Run `:checkhealth` to verify setup
4. **Open a Project**: Use `<leader>e` to open the file explorer
5. **Start Coding**: Enjoy IntelliSense, diagnostics, and more!

## 🔍 Useful Commands

- `:Mason` - Manage language servers and tools
- `:LspInfo` - Show active language servers
- `:checkhealth` - Check Neovim configuration health
- `:Telescope` - Open Telescope picker
- `:TSUpdate` - Update Treesitter parsers
- `:Lazy` - Manage plugins

## 🐛 Troubleshooting

### Common Issues
1. **LSP not working**: Check `:LspInfo` and ensure language servers are installed
2. **Formatting not working**: Install the required formatter (black, shfmt, swift-format)
3. **Telescope not finding files**: Ensure you're in a directory with files
4. **Git signs not showing**: Ensure you're in a Git repository

### Swift Setup
```bash
# Install Xcode command line tools
xcode-select --install

# Install swift-format (optional)
brew install swift-format
```

### Python Setup
```bash
# Install formatter
pip install black
```

### Bash/Zsh Setup
```bash
# Install shell formatter
brew install shfmt
```

---

🎉 **Enjoy your enhanced coding experience in Neovim!**
