# 🤖 Ollama AI Integration Guide

This guide covers how to use Ollama AI integration in your enhanced Neovim configuration for coding assistance, text generation, and more.

## 🚀 Quick Start

1. **Ensure Ollama is running**: `ollama serve` (if not already running)
2. **Open any file**: `nvim document.py`
3. **Ask AI anything**: `Space + ai` 
4. **Chat with AI**: `Space + ac`

---

## 📋 Table of Contents

- [Available Models](#available-models)
- [Basic Usage](#basic-usage)
- [AI Commands](#ai-commands)
- [Coding Assistance](#coding-assistance)
- [Text Enhancement](#text-enhancement)
- [Keybindings Reference](#keybindings-reference)
- [Advanced Usage](#advanced-usage)
- [Troubleshooting](#troubleshooting)

---

## 🧠 Available Models

Your system currently has these models installed:

| Model | Size | Best For |
|-------|------|----------|
| `codellama:13b` | 7.4 GB | **Default** - ⭐ **Best for coding** |
| `qwen2.5-coder:7b` | 4.7 GB | **Excellent coding** - Modern & fast |
| `deepseek-coder:6.7b` | 3.8 GB | **Specialized coding** - Great for complex code |
| `llama3.1:latest` | 4.9 GB | General purpose, coding |
| `llama3:latest` | 4.7 GB | General purpose, fast responses |
| `mistral:7b` | 4.4 GB | Coding, technical tasks |
| `llama3.1:8b` | 4.9 GB | Advanced reasoning |

### 🔄 Switching Models

```bash
# Add new models
ollama pull codellama:7b
ollama pull deepseek-coder:6.7b

# List available models
ollama list
```

---

## 🎯 Basic Usage

### 💬 AI Chat Mode

1. **Start chat**: `Space + ac`
2. **Type your question**: "How do I optimize this Python code?"
3. **Get AI response**: AI analyzes and responds
4. **Continue conversation**: Keep asking follow-up questions

### 📝 Text Generation

1. **Select text** (optional): Highlight code or text
2. **Generate**: `Space + ai`
3. **Choose action**: Pick from available prompts
4. **Review output**: AI generates relevant content

### 🔧 Quick Actions

- **Explain code**: `Space + ax` - Get code explanations
- **Improve code**: `Space + ae` - Enhance your code
- **Generate tests**: `Space + at` - Create unit tests
- **Fix grammar**: `Space + ad` - Improve writing

---

## 🛠️ AI Commands

### 📊 Available Commands

| Command | Shortcut | Description |
|---------|----------|-------------|
| `:Gen` | `Space + ai` | General AI generation |
| `:Gen Chat` | `Space + ac` | Interactive chat mode |
| `:Gen Summarize` | `Space + as` | Summarize text/code |
| `:Gen Enhance_Code` | `Space + ae` | Improve code quality |
| `:Gen Review_Code` | `Space + ar` | Code review |
| `:Gen Generate_Tests` | `Space + at` | Create unit tests |
| `:Gen Enhance_Grammar_Spelling` | `Space + ad` | Fix grammar/spelling |
| `:Gen Explain_Code` | `Space + ax` | Explain code functionality |
| `:Gen Change_Model` | `Space + am` | Switch AI model |

### 🎮 Interactive Controls

Once AI is running:

| Key | Action |
|-----|--------|
| `q` | Quit AI interaction |
| `Ctrl + r` | Retry generation |
| `Ctrl + Enter` | Accept suggestion |

---

## 💻 Coding Assistance

### 🐍 Python Development

#### Code Enhancement
```python
# Original code
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

# Select code → Space + ae
# AI suggests optimized version with memoization
```

#### Test Generation
```python
# Your function
def calculate_average(numbers):
    return sum(numbers) / len(numbers)

# Select function → Space + at
# AI generates comprehensive tests
```

#### Code Review
```python
# Your code
def process_data(data):
    result = []
    for item in data:
        if item > 0:
            result.append(item * 2)
    return result

# Select code → Space + ar
# AI provides improvement suggestions
```

### 🌐 Web Development

#### HTML/CSS/JavaScript
```html
<!-- Select HTML → Space + ae -->
<div class="container">
    <h1>Title</h1>
</div>

<!-- AI suggests improvements -->
```

#### Documentation
```javascript
// Select function → Space + ax
function processPayment(amount, currency) {
    // AI explains the function's purpose
}
```

### 🔧 General Code Tasks

1. **Refactoring**: Select code → `Space + ae`
2. **Bug fixing**: Select problematic code → `Space + ar`
3. **Documentation**: Select code → `Space + ax`
4. **Testing**: Select function → `Space + at`

---

## 📝 Text Enhancement

### ✍️ Writing Assistance

#### Grammar & Spelling
```markdown
# Original text
"This is a exmaple of bad grammer that needs fixing."

# Select text → Space + ad
# AI fixes: "This is an example of bad grammar that needs fixing."
```

#### Summarization
```markdown
# Long document or code
# Select content → Space + as
# AI provides concise summary
```

### 📄 Document Processing

#### Markdown Enhancement
```markdown
# Basic content
## Features
- Item 1
- Item 2

# Select → Space + ae
# AI suggests improved formatting and structure
```

#### Technical Writing
```markdown
# Select technical content → Space + ad
# AI improves clarity and readability
```

---

## ⌨️ Keybindings Reference

### 🎯 Core AI Keybindings

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `Space + ai` | Normal/Visual | Generate | General AI generation |
| `Space + ac` | Normal/Visual | Chat | Interactive chat mode |
| `Space + as` | Normal/Visual | Summarize | Summarize content |
| `Space + ae` | Normal/Visual | Enhance Code | Improve code quality |
| `Space + ar` | Normal/Visual | Review Code | Code review & suggestions |
| `Space + at` | Normal/Visual | Generate Tests | Create unit tests |
| `Space + ad` | Normal/Visual | Fix Grammar | Grammar & spelling |
| `Space + ax` | Normal/Visual | Explain Code | Code explanation |
| `Space + am` | Normal/Visual | Change Model | Switch AI model |

### 🔧 Control Keys (During AI interaction)

| Key | Action |
|-----|--------|
| `q` | Quit AI session |
| `Ctrl + r` | Retry generation |
| `Ctrl + Enter` | Accept AI suggestion |
| `Esc` | Cancel current operation |

---

## 🔥 Advanced Usage

### 🎨 Custom Prompts

You can create custom AI prompts by editing the gen.nvim configuration:

```lua
-- Add to your config
require('gen').prompts['Custom_Prompt'] = {
  prompt = "Your custom prompt here: $text",
  replace = true
}
```

### 🔄 Model Switching

#### Switch Models on the Fly
1. **Change model**: `Space + am`
2. **Select from list**: Choose available model
3. **Confirm**: AI switches to new model

#### Recommended Models by Task

| Task | Recommended Model | Why |
|------|-------------------|-----|
| **Python/General Coding** | `codellama:13b` | ⭐ **Best for all coding tasks** |
| **Modern Code (Web/JS)** | `qwen2.5-coder:7b` | Latest coding patterns |
| **Complex Code Analysis** | `deepseek-coder:6.7b` | Specialized for complex logic |
| **Quick Code Questions** | `codellama:13b` | Fast & accurate for code |
| **General Questions** | `llama3.1:latest` | Best general-purpose model |
| **Advanced Reasoning** | `llama3.1:8b` | Most capable reasoning |

### 📊 Performance Optimization

#### Memory Usage
```bash
# Check model memory usage
ollama ps

# Unload unused models
ollama stop model_name
```

#### Response Speed
- **Smaller models** = Faster responses
- **Larger models** = Better quality
- **Switch based on task complexity**

---

## 🔧 Configuration

### ⚙️ Default Settings

Your configuration uses these defaults:

```lua
{
  model = "codellama:13b",       -- Default model (⭐ Best for coding)
  host = "localhost",            -- Ollama host
  port = "11434",               -- Ollama port
  display_mode = "split",        -- Show in split window
  show_prompt = false,          -- Hide prompt details
  show_model = false,           -- Hide model info
  no_auto_close = false,        -- Auto-close when done
  debug = false                 -- Debug mode off
}
```

### 🎛️ Customization Options

#### Change Display Mode
```lua
display_mode = "split"      -- Split window (default)
display_mode = "float"      -- Floating window
display_mode = "horizontal" -- Horizontal split
```

#### Show/Hide Information
```lua
show_prompt = true          -- Show the prompt being sent
show_model = true           -- Show current model name
debug = true                -- Enable debug information
```

---

## 🚨 Troubleshooting

### Common Issues

#### ❌ "Connection refused"
**Problem**: Ollama service not running
**Solution**: 
```bash
# Start Ollama service
ollama serve

# Or check if running
ps aux | grep ollama
```

#### ❌ "Model not found"
**Problem**: Requested model not installed
**Solution**:
```bash
# Install missing model
ollama pull llama3.1:latest

# Check available models
ollama list
```

#### ❌ "Slow responses"
**Problem**: Model too large for system
**Solution**:
```bash
# Use smaller model
ollama pull llama3:latest

# Or check system resources
htop
```

#### ❌ "AI not responding"
**Problem**: Ollama service issues
**Solution**:
```bash
# Restart Ollama
pkill ollama
ollama serve

# Check logs
ollama logs
```

### 🔍 Debug Mode

Enable debug mode to see what's happening:

```lua
-- In your config
debug = true
```

This shows:
- Prompts being sent
- Model responses
- Connection status
- Error messages

### 🏥 Health Check

```bash
# Test Ollama connection
curl http://localhost:11434/api/tags

# Test specific model
ollama run llama3.1:latest "Hello"

# Check system resources
ollama ps
```

---

## 💡 Tips & Best Practices

### 🚀 Productivity Tips

1. **Use visual selection** for precise AI assistance
2. **Start with smaller models** for quick iterations
3. **Switch models** based on task complexity
4. **Use chat mode** for iterative problem-solving
5. **Combine with other tools** (LSP, formatters)

### 🎯 Effective Prompting

#### For Code
- **Be specific**: "Optimize this Python function for memory usage"
- **Include context**: Select relevant code blocks
- **Ask follow-ups**: Use chat mode for clarification

#### For Writing
- **Specify style**: "Make this more formal/casual"
- **Include purpose**: "For technical documentation"
- **Request specific changes**: "Fix grammar but keep tone"

### 🔧 Model Selection

| If you need... | Use model... |
|----------------|-------------|
| **Quick answers** | `llama3:latest` |
| **Code review** | `llama3.1:latest` |
| **Complex analysis** | `llama3.1:8b` |
| **Fast iteration** | `mistral:7b` |

### 📈 Performance Tips

1. **Keep models loaded** for faster responses
2. **Use appropriate model size** for your hardware
3. **Close unused models** to free memory
4. **Monitor system resources** during heavy usage

---

## 🎊 Conclusion

Your Neovim setup now includes powerful AI capabilities with Ollama integration:

- ✅ **Code assistance** - Generate, improve, and review code
- ✅ **Text enhancement** - Fix grammar, summarize, explain
- ✅ **Multiple models** - Switch based on task needs
- ✅ **Interactive chat** - Iterative problem-solving
- ✅ **Seamless integration** - Works with your existing workflow

### 🌟 Key Features

- **9 AI commands** for different tasks
- **Visual selection support** for precise assistance
- **Model switching** for optimal performance
- **Chat mode** for interactive problem-solving
- **Integrated with your IDE** workflow

**Start coding with AI assistance today!** 🤖✨

---

## 📚 Quick Reference

### Essential Commands
- `Space + ai` - General AI help
- `Space + ac` - Start AI chat
- `Space + ae` - Enhance code
- `Space + ar` - Review code
- `Space + at` - Generate tests

### Model Management
```bash
ollama list          # Show models
ollama pull model    # Install model
ollama serve         # Start service
ollama ps            # Show running models
```

---

*Your AI-powered coding companion is ready! 🚀*
