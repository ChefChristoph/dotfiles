# 🍿 Snacks Keymaps Reference

## Core Snacks Functionality

| Keymap | Description |
|--------|-------------|
| `<leader>nh` | Show notification history |
| `<leader>nd` | Dismiss all notifications |

## Fun Custom Notifications

| Keymap | Description |
|--------|-------------|
| `<leader>nm` | Show random motivational message |
| `<leader>nr` | Show rainbow notification |
| `<leader>nt` | Show coding session time |
| `<leader>ns` | Show file statistics |

## Automatic Notifications

### File Operations
- **File Save**: Enhanced notifications with file type icons and stats
- **File Open**: Git branch display when entering buffers

### Development
- **LSP Attach**: Language server connection notifications
- **Diagnostics**: Error and warning count notifications
- **Macro Recording**: Start/stop macro recording notifications
- **Search**: Search result count notifications

### System
- **Welcome**: Greeting message on startup with time/date
- **Terminal**: Terminal open notifications
- **Plugin Updates**: Lazy.nvim update status

### Git Integration
- **Branch Display**: Current git branch shown when changing buffers

## File Type Icons

The file save notifications include custom icons for different file types:
- 🌙 Lua files
- 🐍 Python files
- ⚡ JavaScript/TypeScript files
- 🦀 Rust files
- 🐹 Go files
- 📝 Markdown files
- 📋 JSON files
- ⚙️ YAML files
- 💾 Default for other files

## Time-Based Features

- **Session Tracking**: Automatically tracks coding session time
- **Time-Based Greetings**: Different greetings for morning/afternoon/evening
- **Smart Timeouts**: Different timeout durations for different notification types

## Advanced Features

- **Notification Replacement**: Uses IDs to replace existing notifications
- **Markdown Support**: Rich text formatting in notifications
- **Emoji Integration**: Extensive use of emojis for visual appeal
- **Context Awareness**: Notifications adapt based on current context

## Troubleshooting

If notifications aren't showing:
1. Check if snacks is properly loaded: `:lua print(vim.inspect(require('snacks')))`
2. Verify notifier is enabled in your lazy config
3. Check for any Lua errors: `:messages`
4. Test with a simple notification: `:lua require('snacks').notify.info('Test')`
