local snacks = require("snacks")

-- Enhanced file save notification with file info
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    local filename = vim.fn.expand("%:t")
    local filepath = vim.fn.expand("%:~:.")
    local lines = vim.api.nvim_buf_line_count(0)
    local filetype = vim.bo.filetype
    
    local icon = "💾"
    if filetype == "lua" then icon = "🌙"
    elseif filetype == "python" then icon = "🐍"
    elseif filetype == "javascript" or filetype == "typescript" then icon = "⚡"
    elseif filetype == "rust" then icon = "🦀"
    elseif filetype == "go" then icon = "🐹"
    elseif filetype == "markdown" then icon = "📝"
    elseif filetype == "json" then icon = "📋"
    elseif filetype == "yaml" or filetype == "yml" then icon = "⚙️"
    end
    
    snacks.notify.info(string.format("%s %s saved!", icon, filename), {
      title = "File Saved",
      timeout = 2000,
      ft = "markdown",
      msg = string.format("%s %s\n**%s** • %d lines", icon, filename, filepath, lines),
    })
  end,
})

-- Welcome message on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Delay to ensure everything is loaded
    vim.defer_fn(function()
      local time = os.date("%H:%M")
      local date = os.date("%Y-%m-%d")
      local greeting = "Good morning! 🌅"
      local hour = tonumber(os.date("%H"))
      
      if hour >= 12 and hour < 17 then
        greeting = "Good afternoon! ☀️"
      elseif hour >= 17 then
        greeting = "Good evening! 🌙"
      end
      
      snacks.notify.info(greeting, {
        title = "Welcome to Neovim",
        timeout = 3000,
        msg = string.format("%s\n📅 %s • 🕐 %s", greeting, date, time),
      })
    end, 500)
  end,
})

-- Git branch notification when changing buffers
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype ~= "" then return end
    
    vim.defer_fn(function()
      local handle = io.popen("git branch --show-current 2>/dev/null")
      if handle then
        local branch = handle:read("*a"):gsub("\n", "")
        handle:close()
        
        if branch ~= "" then
          snacks.notify("🌿 " .. branch, {
            title = "Git Branch",
            level = "info",
            timeout = 1500,
            id = "git_branch", -- Replace previous notification
          })
        end
      end
    end, 100)
  end,
})

-- LSP status notifications
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      snacks.notify.info("🔌 LSP Connected", {
        title = "Language Server",
        timeout = 2000,
        msg = string.format("🔌 **%s** attached to %s", client.name, vim.fn.expand("%:t")),
      })
    end
  end,
})

-- Plugin update notifications
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyUpdatePre",
  callback = function()
    snacks.notify.info("🔄 Updating plugins...", {
      title = "Lazy.nvim",
      timeout = 0, -- Keep until manually closed
      id = "lazy_update",
    })
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyUpdatePost",
  callback = function()
    snacks.notify.info("✅ Plugins updated!", {
      title = "Lazy.nvim",
      timeout = 3000,
      id = "lazy_update", -- Replace the "updating" notification
    })
  end,
})

-- Error handling with enhanced notifications (disabled to prevent recursion)
-- vim.api.nvim_create_autocmd("DiagnosticChanged", {
--   callback = function()
--     local diagnostics = vim.diagnostic.get(0)
--     local errors = vim.tbl_filter(function(d) return d.severity == vim.diagnostic.severity.ERROR end, diagnostics)
--     local warnings = vim.tbl_filter(function(d) return d.severity == vim.diagnostic.severity.WARN end, diagnostics)
--     
--     if #errors > 0 then
--       snacks.notify.error(string.format("❌ %d error(s) found", #errors), {
--         title = "Diagnostics",
--         timeout = 3000,
--         id = "diagnostics",
--       })
--     elseif #warnings > 0 then
--       snacks.notify.warn(string.format("⚠️ %d warning(s) found", #warnings), {
--         title = "Diagnostics",
--         timeout = 2000,
--         id = "diagnostics",
--       })
--     end
--   end,
-- })

-- Macro recording notifications
vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    local register = vim.fn.reg_recording()
    snacks.notify.info("🎬 Recording macro...", {
      title = "Macro",
      timeout = 0,
      id = "macro_recording",
      msg = string.format("🎬 Recording macro to **%s**", register),
    })
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    snacks.notify.info("✅ Macro recorded!", {
      title = "Macro",
      timeout = 2000,
      id = "macro_recording",
    })
  end,
})

-- Search result notifications
vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    local cmdtype = vim.fn.getcmdtype()
    if cmdtype == "/" or cmdtype == "?" then
      vim.defer_fn(function()
        local search_count = vim.fn.searchcount()
        if search_count.total > 0 then
          snacks.notify.info(string.format("🔍 %d matches found", search_count.total), {
            title = "Search",
            timeout = 2000,
            msg = string.format("🔍 **%d/%d** matches for '%s'", search_count.current, search_count.total, vim.fn.getreg("/")),
          })
        else
          snacks.notify.warn("🔍 No matches found", {
            title = "Search",
            timeout = 2000,
            msg = string.format("🔍 No matches for '%s'", vim.fn.getreg("/")),
          })
        end
      end, 100)
    end
  end,
})

-- Terminal notifications
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    snacks.notify.info("💻 Terminal opened", {
      title = "Terminal",
      timeout = 1500,
    })
  end,
})

-- Custom keymaps for snacks functionality
vim.keymap.set("n", "<leader>nh", function()
  snacks.notifier.show_history()
end, { desc = "Show notification history" })

vim.keymap.set("n", "<leader>nd", function()
  snacks.notifier.hide()
end, { desc = "Dismiss all notifications" })

-- Fun custom notifications
vim.keymap.set("n", "<leader>nm", function()
  local motivational = {
    "🚀 You're doing great!",
    "💪 Keep pushing forward!",
    "🌟 Code like a star!",
    "🔥 You're on fire!",
    "⚡ Lightning fast coding!",
    "🎯 Stay focused!",
    "🏆 Champion mindset!",
    "🌈 Colorful solutions!",
  }
  
  local message = motivational[math.random(#motivational)]
  snacks.notify.info(message, {
    title = "Motivation",
    timeout = 3000,
  })
end, { desc = "Show motivational message" })

-- Time tracking notification
vim.keymap.set("n", "<leader>nt", function()
  local start_time = vim.g.session_start_time or vim.fn.localtime()
  local current_time = vim.fn.localtime()
  local elapsed = current_time - start_time
  local hours = math.floor(elapsed / 3600)
  local minutes = math.floor((elapsed % 3600) / 60)
  
  snacks.notify.info(string.format("⏱️ Session: %dh %dm", hours, minutes), {
    title = "Time Tracking",
    timeout = 3000,
    msg = string.format("⏱️ You've been coding for **%d hours %d minutes**\n🎯 Keep up the great work!", hours, minutes),
  })
end, { desc = "Show coding session time" })

-- Initialize session start time
if not vim.g.session_start_time then
  vim.g.session_start_time = vim.fn.localtime()
end

-- Custom notification styles (you can add more in your lazy config)
local function create_rainbow_notification()
  local colors = { "🔴", "🟠", "🟡", "🟢", "🔵", "🟣" }
  local current_color = 1
  
  local function next_color()
    local color = colors[current_color]
    current_color = current_color % #colors + 1
    return color
  end
  
  snacks.notify.info(next_color() .. " Rainbow notification!", {
    title = "Rainbow",
    timeout = 2000,
    id = "rainbow",
  })
end

vim.keymap.set("n", "<leader>nr", create_rainbow_notification, { desc = "Show rainbow notification" })

-- File statistics notification
vim.keymap.set("n", "<leader>ns", function()
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_line_count(buf)
  local words = 0
  local chars = 0
  
  for i = 1, lines do
    local line = vim.api.nvim_buf_get_lines(buf, i-1, i, false)[1] or ""
    words = words + #vim.split(line, "%s+")
    chars = chars + #line
  end
  
  local filename = vim.fn.expand("%:t")
  local filetype = vim.bo.filetype
  
  snacks.notify.info(string.format("📊 %s statistics", filename), {
    title = "File Stats",
    timeout = 5000,
    msg = string.format("📊 **%s** (%s)\n📝 %d lines\n🔤 %d words\n🔢 %d characters", filename, filetype, lines, words, chars),
  })
end, { desc = "Show file statistics" })

print("🍿 Snacks configuration loaded successfully!")
