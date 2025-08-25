-- IDE-like configurations for Neovim

local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Setup Mason to handle external tool installation
mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    "bashls",  -- Bash
    "pyright", -- Python
    "lua_ls",  -- Lua
  },
})

-- LSP Server configurations
lspconfig.bashls.setup({})
lspconfig.pyright.setup({})
lspconfig.lua_ls.setup({})

-- Swift LSP setup (requires sourcekit-lsp to be installed separately)
-- You can install it via: xcode-select --install
if vim.fn.executable('sourcekit-lsp') == 1 then
  lspconfig.sourcekit.setup({
    cmd = { 'sourcekit-lsp' },
    filetypes = { 'swift', 'objective-c', 'objective-cpp' },
    root_dir = lspconfig.util.root_pattern('Package.swift', '.git'),
  })
end

-- Zsh support (basic, since zls is not commonly available)
if vim.fn.executable('zls') == 1 then
  lspconfig.zls.setup({})
end

-- Setup Treesitter for enhanced syntax highlighting
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash", "python", "swift", "html", "css", "lua", "javascript", "json", "toml", "markdown"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

-- Lualine configuration
require("lualine").setup({
  options = {
    theme = "tokyonight",
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    icons_enabled = true,
  }
})

-- Gitsigns configuration
require("gitsigns").setup({
  signs = {
    add = { hl = "GitGutterAdd", text = "+", numhl = "GitSignsAddNr" },
    change = { hl = "GitGutterChange", text = "~", numhl = "GitSignsChangeNr" },
    delete = { hl = "GitGutterDelete", text = "_", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GitGutterDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "GitGutterChange", text = "~", numhl = "GitSignsChangeNr" },
  },
})

-- Autopairs configuration
require("nvim-autopairs").setup({ check_ts = true })

-- Comment plugin
require("Comment").setup()

-- Surround plugin
require("nvim-surround").setup()

-- Conform for formatting
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    swift = { "swift-format" },
    bash = { "shfmt" },
    sh = { "shfmt" },
    zsh = { "shfmt" },
  },
})

-- Telescope configuration
require("telescope").setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})
require("telescope").load_extension("fzf")

-- Trouble configuration
require("trouble").setup()

-- Which-key configuration
require("which-key").setup()

-- Indent guides (version 3 compatible)
require("ibl").setup({
  indent = {
    char = "|",
  },
  scope = {
    enabled = false,
  },
})

-- Toggleterm configuration
require("toggleterm").setup({
  size = 20,
  open_mapping = [[<c-\>]],
  shading_factor = 2,
  direction = "horizontal",
  persist_size = true,
})

-- Keymaps
vim.keymap.set("n", "<leader>e", ':Neotree toggle<CR>', { desc = "Toggle NeoTree Explorer" })
vim.keymap.set("n", "<leader>ff", ':Telescope find_files<CR>', { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", ':Telescope live_grep<CR>', { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", ':Telescope buffers<CR>', { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", ':Telescope help_tags<CR>', { desc = "Help Tags" })
vim.keymap.set("i", "<C-Space>", "<Cmd>lua require('cmp').complete()<CR>", { desc = "Trigger Completion" })

-- LSP Keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set location list" })

-- Formatting
vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true })
end, { desc = "Format buffer" })

-- Trouble keymaps
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle Trouble" })
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Workspace diagnostics" })
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Location list" })
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Quickfix list" })
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "LSP references" })

-- Git keymaps
vim.keymap.set("n", "<leader>gh", ':Gitsigns preview_hunk<CR>', { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gb", ':Gitsigns blame_line<CR>', { desc = "Blame line" })
vim.keymap.set("n", "<leader>gs", ':Gitsigns stage_hunk<CR>', { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gu", ':Gitsigns undo_stage_hunk<CR>', { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>gr", ':Gitsigns reset_hunk<CR>', { desc = "Reset hunk" })

-- Markdown keymaps
vim.keymap.set("n", "<leader>mp", ':MarkdownPreviewToggle<CR>', { desc = "Toggle Markdown Preview" })
vim.keymap.set("n", "<leader>mt", ':TableModeToggle<CR>', { desc = "Toggle Table Mode" })
vim.keymap.set("n", "<leader>mf", ':TableModeRealign<CR>', { desc = "Realign Table" })
vim.keymap.set("n", "<leader>ms", ':Tableize<CR>', { desc = "Convert to Table" })
vim.keymap.set("v", "<leader>ms", ':Tableize<CR>', { desc = "Convert selection to Table" })

-- Org-mode keymaps (global)
vim.keymap.set("n", "<leader>oa", ':lua require("orgmode").action("agenda.prompt")<CR>', { desc = "Org Agenda" })
vim.keymap.set("n", "<leader>oc", ':lua require("orgmode").action("capture.prompt")<CR>', { desc = "Org Capture" })

-- Ollama AI keymaps
vim.keymap.set({ "n", "v" }, "<leader>ai", ":Gen<CR>", { desc = "Ollama AI Generate" })
vim.keymap.set({ "n", "v" }, "<leader>ac", ":Gen Chat<CR>", { desc = "Ollama AI Chat" })
vim.keymap.set({ "n", "v" }, "<leader>as", ":Gen Summarize<CR>", { desc = "Ollama AI Summarize" })
vim.keymap.set({ "n", "v" }, "<leader>ae", ":Gen Enhance_Code<CR>", { desc = "Ollama AI Enhance Code" })
vim.keymap.set({ "n", "v" }, "<leader>ar", ":Gen Review_Code<CR>", { desc = "Ollama AI Review Code" })
vim.keymap.set({ "n", "v" }, "<leader>at", ":Gen Generate_Tests<CR>", { desc = "Ollama AI Generate Tests" })
vim.keymap.set({ "n", "v" }, "<leader>ad", ":Gen Enhance_Grammar_Spelling<CR>", { desc = "Ollama AI Fix Grammar" })
vim.keymap.set({ "n", "v" }, "<leader>ax", ":Gen Explain_Code<CR>", { desc = "Ollama AI Explain Code" })
vim.keymap.set({ "n", "v" }, "<leader>am", ":Gen Change_Model<CR>", { desc = "Ollama AI Change Model" })

-- Setup nvim-cmp for autocompletion
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  })
})
