# 📝 Markdown Features Guide

This guide covers all the markdown features available in your enhanced Neovim configuration.

## 🚀 Quick Start

1. **Create a markdown file**: `nvim document.md`
2. **Enable table mode**: `Space + mt` 
3. **Start live preview**: `Space + mp`
4. **Begin writing!**

---

## 📋 Table of Contents

- [Basic Syntax](#basic-syntax)
- [Table Features](#table-features)
- [Live Preview](#live-preview)
- [Keybindings Reference](#keybindings-reference)
- [Advanced Features](#advanced-features)
- [Tips & Tricks](#tips--tricks)

---

## 🎯 Basic Syntax

### Headers
```markdown
# Header 1
## Header 2
### Header 3
#### Header 4
##### Header 5
###### Header 6
```

### Text Formatting
```markdown
**Bold text**
*Italic text*
***Bold and italic***
~~Strikethrough~~
`inline code`
```

### Lists
```markdown
- Unordered list item 1
- Unordered list item 2
  - Nested item
  - Another nested item

1. Ordered list item 1
2. Ordered list item 2
   1. Nested numbered item
   2. Another nested item
```

### Links and Images
```markdown
[Link text](https://example.com)
[Link with title](https://example.com "Title")
![Alt text](image.jpg)
![Image with title](image.jpg "Image title")
```

### Blockquotes
```markdown
> This is a blockquote
> 
> It can span multiple lines
> 
> > And can be nested
```

### Code Blocks
````markdown
```python
def hello_world():
    print("Hello, World!")
```

```bash
echo "This is a bash command"
```
````

### Horizontal Rules
```markdown
---
***
___
```

---

## 📊 Table Features

### 🔧 Table Mode Keybindings

| Key | Action |
|-----|--------|
| `Space + mt` | Toggle table mode on/off |
| `Space + mf` | Realign table |
| `Space + ms` | Convert selection to table |
| `<leader>tm` | Toggle table mode (alternative) |

### ✨ Auto Table Creation

1. **Enable table mode**: `Space + mt`
2. **Start typing**: `| Name | Age | City |`
3. **Press Enter** - table automatically formats!
4. **Keep typing** - rows auto-align as you type

### 📝 Table Creation Examples

#### Simple Table
```markdown
| Name | Age | City |
|------|-----|------|
| John | 30  | NYC  |
| Jane | 25  | LA   |
```

#### Aligned Tables
```markdown
| Left | Center | Right |
|:-----|:------:|------:|
| Text | Text   | Text  |
| More | More   | More  |
```

#### Complex Table
```markdown
| Feature | Status | Priority | Notes |
|---------|:------:|:--------:|-------|
| Tables  | ✅ Done | High | Working perfectly |
| Preview | ✅ Done | High | Live browser preview |
| Syntax  | ✅ Done | Medium | Enhanced highlighting |
```

### 🛠️ Table Manipulation

- **Add rows**: Just type `|` and content, press Enter
- **Delete rows**: Delete the entire line
- **Reformat**: `Space + mf` to realign everything
- **Convert text**: Select text and `Space + ms` to tableize

---

## 🌐 Live Preview

### 🎬 Preview Features

- **Real-time updates** as you type
- **Syntax highlighting** for code blocks
- **Math rendering** with KaTeX support
- **Mermaid diagrams** support
- **Custom CSS** styling
- **Dark theme** integration

### 🔧 Preview Keybindings

| Key | Action |
|-----|--------|
| `Space + mp` | Toggle markdown preview |
| `:MarkdownPreview` | Start preview |
| `:MarkdownPreviewStop` | Stop preview |
| `:MarkdownPreviewToggle` | Toggle preview |

### ⚙️ Preview Settings

The preview automatically:
- Opens in your default browser
- Updates in real-time as you edit
- Closes when you quit the file
- Uses dark theme to match your setup
- Renders math equations
- Supports flowcharts and diagrams

---

## ⌨️ Keybindings Reference

### Core Markdown Keybindings

| Key | Action | Description |
|-----|--------|-------------|
| `Space + mp` | Toggle Preview | Live browser preview |
| `Space + mt` | Toggle Table Mode | Enable/disable table editing |
| `Space + mf` | Format Table | Realign table columns |
| `Space + ms` | Selection to Table | Convert selected text to table |
| `gc` | Toggle Comment | Comment/uncomment lines |
| `Space + f` | Format Document | Format entire document |

### File Operations

| Key | Action | Description |
|-----|--------|-------------|
| `Space + e` | File Explorer | Browse files |
| `Space + ff` | Find Files | Search for markdown files |
| `Space + fg` | Live Grep | Search text in files |
| `Space + fb` | Buffers | Switch between open files |

### General Editing

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl + Space` | Autocomplete | Trigger completion |
| `gd` | Go to Definition | Jump to definition |
| `K` | Hover Documentation | Show documentation |
| `Space + d` | Show Diagnostics | Display errors/warnings |

---

## 🔥 Advanced Features

### 🎨 Syntax Highlighting

Enhanced syntax highlighting for:
- **Headers** with visual hierarchy
- **Code blocks** with language-specific highlighting
- **Links** with distinct styling
- **Emphasis** (bold, italic) with proper rendering
- **Lists** with proper indentation
- **Tables** with column alignment

### 📐 Math Support

Write mathematical expressions:

```markdown
Inline math: $E = mc^2$

Block math:
$$
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
$$
```

### 📊 Mermaid Diagrams

Create flowcharts and diagrams:

````markdown
```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```
````

### 🎯 Task Lists

Create interactive checkboxes:

```markdown
- [x] Completed task
- [ ] Pending task
- [ ] Another pending task
```

### 📝 Footnotes

Add footnotes to your documents:

```markdown
This is a text with a footnote[^1].

[^1]: This is the footnote content.
```

---

## 💡 Tips & Tricks

### 🚀 Productivity Tips

1. **Use table mode** for quick table creation
2. **Enable live preview** for real-time feedback
3. **Use `Space + fg`** to search across all markdown files
4. **Leverage code completion** with `Ctrl + Space`
5. **Format regularly** with `Space + f`

### 🎨 Styling Tips

1. **Use headers** to create document structure
2. **Add horizontal rules** (`---`) to separate sections
3. **Use blockquotes** for important information
4. **Combine formatting** (***bold italic***)
5. **Use code blocks** for technical content

### 🔧 Table Tips

1. **Enable table mode first** (`Space + mt`)
2. **Don't worry about alignment** - it auto-formats
3. **Use `Space + mf`** to clean up messy tables
4. **Select text and `Space + ms`** to convert to table
5. **Use alignment syntax** (`:---:`, `---:`, `:---`)

### 📱 Preview Tips

1. **Keep preview open** while editing
2. **Use split screen** (browser + Neovim)
3. **Check mobile view** by resizing browser
4. **Test all features** in preview mode
5. **Use dark theme** for better experience

---

## 🔍 Troubleshooting

### Common Issues

**Preview not opening?**
- Check if you have a web browser installed
- Try `:MarkdownPreview` command manually
- Restart Neovim and try again

**Tables not formatting?**
- Ensure table mode is enabled (`Space + mt`)
- Check that you're using `|` characters correctly
- Try `Space + mf` to realign

**Syntax highlighting not working?**
- Ensure file has `.md` extension
- Check if Treesitter is installed (`:TSUpdate`)
- Restart Neovim

### Getting Help

- Use `Space + fh` to search help docs
- Check `:help markdown` for built-in help
- Use `g?` in any mode for context help

---

## 🎊 Conclusion

Your Neovim setup now provides a complete markdown editing environment with:

- ✅ **Enhanced syntax highlighting**
- ✅ **Live browser preview**
- ✅ **Professional table editing**
- ✅ **Math and diagram support**
- ✅ **Integrated file management**
- ✅ **Git integration**

**Happy writing!** 📝✨

---

*Generated for your enhanced Neovim configuration*
