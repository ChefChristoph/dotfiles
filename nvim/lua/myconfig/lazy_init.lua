local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
   spec = {
     -- Core dependencies
     { "nvim-lua/plenary.nvim" },
     { "nvim-tree/nvim-web-devicons" },
     
     -- IDE-like appearance
     { "nvim-lualine/lualine.nvim" },
     {
       "folke/tokyonight.nvim",
       lazy = false,
       priority = 1000,
       config = function()
         vim.cmd([[colorscheme tokyonight]])
       end,
     },
     
     -- File explorer
     {
       "nvim-neo-tree/neo-tree.nvim",
       branch = "v3.x",
       dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         "MunifTanjim/nui.nvim",
       },
       config = function()
         require("neo-tree").setup({
           close_if_last_window = true,
           popup_border_style = "rounded",
           enable_git_status = true,
           enable_diagnostics = true,
           default_component_configs = {
             indent = {
               indent_size = 2,
               padding = 1,
               with_markers = true,
               indent_marker = "│",
               last_indent_marker = "└",
               highlight = "NeoTreeIndentMarker",
             },
             icon = {
               folder_closed = "📁",
               folder_open = "📂",
               folder_empty = "📂",
             },
             git_status = {
               symbols = {
                 added = "✚",
                 modified = "✱",
                 deleted = "✖",
                 renamed = "➜",
                 untracked = "★",
                 ignored = "◌",
                 unstaged = "✗",
                 staged = "✓",
                 conflict = "⚡",
               },
             },
           },
         })
       end,
     },
     
     -- Bufferline (tabs)
     {
       "akinsho/bufferline.nvim",
       version = "*",
       dependencies = "nvim-tree/nvim-web-devicons",
       config = function()
         require("bufferline").setup({
           options = {
             mode = "buffers",
             separator_style = "slant",
             always_show_bufferline = true,
             show_buffer_close_icons = true,
             show_close_icon = true,
             color_icons = true,
             diagnostics = "nvim_lsp",
             diagnostics_update_in_insert = false,
             offsets = {
               {
                 filetype = "neo-tree",
                 text = "File Explorer",
                 highlight = "Directory",
                 text_align = "left",
               },
             },
           },
         })
       end,
     },
     
     -- Fuzzy finder
     { "folke/which-key.nvim" },
     {
       "nvim-telescope/telescope.nvim",
       dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-telescope/telescope-fzf-native.nvim",
       },
     },
     {
       "nvim-telescope/telescope-fzf-native.nvim",
       build = "make",
     },
     
     -- LSP and completion
     { "neovim/nvim-lspconfig" },
     { "williamboman/mason.nvim" },
     { "williamboman/mason-lspconfig.nvim" },
     { "hrsh7th/nvim-cmp" },
     { "hrsh7th/cmp-nvim-lsp" },
     { "hrsh7th/cmp-path" },
     { "hrsh7th/cmp-buffer" },
     { "hrsh7th/cmp-cmdline" },
     { "L3MON4D3/LuaSnip" },
     { "saadparwaiz1/cmp_luasnip" },
     
     -- Treesitter for syntax highlighting
     {
       "nvim-treesitter/nvim-treesitter",
       build = ":TSUpdate",
     },
     
     -- Git integration
     { "lewis6991/gitsigns.nvim" },
     { "tpope/vim-fugitive" },
     
     -- Code formatting
     { "stevearc/conform.nvim" },
     
     -- Terminal integration
     { "akinsho/toggleterm.nvim" },
     
     -- Indent guides
     { "lukas-reineke/indent-blankline.nvim" },
     
     -- Auto pairs
     { "windwp/nvim-autopairs" },
     
     -- Comment toggling
     { "numToStr/Comment.nvim" },
     
     -- Surround
     { "kylechui/nvim-surround" },
     
     -- Dashboard
     {
       "goolord/alpha-nvim",
       dependencies = { "nvim-tree/nvim-web-devicons" },
     },
     
     -- Trouble for diagnostics
     { "folke/trouble.nvim" },
     
     -- Snacks for notifications
     {
       "folke/snacks.nvim",
       config = function()
         require("snacks").setup({})
       end,
     },
     
     -- Markdown enhancements
     {
       "dhruvasagar/vim-table-mode",
       ft = { "markdown", "org" },
       config = function()
         vim.g.table_mode_corner = "|"
         vim.g.table_mode_corner_corner = "|"
         vim.g.table_mode_header_fillchar = "-"
       end,
     },
     {
       "iamcco/markdown-preview.nvim",
       cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
       ft = { "markdown" },
       build = function() vim.fn["mkdp#util#install"]() end,
       config = function()
         vim.g.mkdp_auto_start = 0
         vim.g.mkdp_auto_close = 1
         vim.g.mkdp_refresh_slow = 0
         vim.g.mkdp_command_for_global = 0
         vim.g.mkdp_open_to_the_world = 0
         vim.g.mkdp_open_ip = ""
         vim.g.mkdp_browser = ""
         vim.g.mkdp_echo_preview_url = 0
         vim.g.mkdp_browserfunc = ""
         vim.g.mkdp_preview_options = {
           mkit = {},
           katex = {},
           uml = {},
           maid = {},
           disable_sync_scroll = 0,
           sync_scroll_type = "middle",
           hide_yaml_meta = 1,
           sequence_diagrams = {},
           flowchart_diagrams = {},
           content_editable = false,
           disable_filename = 0,
           toc = {}
         }
         vim.g.mkdp_markdown_css = ""
         vim.g.mkdp_highlight_css = ""
         vim.g.mkdp_port = ""
         vim.g.mkdp_page_title = "「${name}」"
         vim.g.mkdp_filetypes = { "markdown" }
         vim.g.mkdp_theme = "dark"
       end,
     },
     {
       "lukas-reineke/headlines.nvim",
       ft = { "markdown", "org" },
       config = function()
         require("headlines").setup({
           markdown = {
             headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
             codeblock_highlight = "CodeBlock",
             dash_highlight = "Dash",
             dash_string = "-",
             quote_highlight = "Quote",
             quote_string = "┃",
             fat_headlines = true,
             fat_headline_upper_string = "▃",
             fat_headline_lower_string = "🬂",
           },
           org = {
             headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
             codeblock_highlight = "CodeBlock",
             dash_highlight = "Dash",
             dash_string = "-",
             quote_highlight = "Quote",
             quote_string = "┃",
             fat_headlines = true,
             fat_headline_upper_string = "▃",
             fat_headline_lower_string = "🬂",
           },
         })
       end,
     },
     
     -- Org-mode support
     {
       "nvim-orgmode/orgmode",
       ft = { "org" },
       config = function()
         require("orgmode").setup({
           org_agenda_files = { "~/org/*" },
           org_default_notes_file = "~/org/notes.org",
           org_todo_keywords = { "TODO", "NEXT", "WAITING", "|", "DONE", "CANCELLED" },
           org_hide_emphasis_markers = true,
           org_startup_indented = true,
           org_adapt_indentation = true,
           org_edit_src_content_indentation = 2,
           org_src_window_setup = "split-window-below",
           mappings = {
             global = {
               org_agenda = "<Leader>oa",
               org_capture = "<Leader>oc",
             },
             agenda = {
               org_agenda_later = "f",
               org_agenda_earlier = "b",
               org_agenda_goto_today = ".",
               org_agenda_day_view = "vd",
               org_agenda_week_view = "vw",
               org_agenda_month_view = "vm",
               org_agenda_year_view = "vy",
               org_agenda_quit = "q",
               org_agenda_switch_to = "<CR>",
               org_agenda_goto = "<TAB>",
               org_agenda_kill = "d",
               org_agenda_archive = "$",
               org_agenda_toggle_checkbox = "<C-Space>",
               org_agenda_todo = "t",
               org_agenda_clock_in = "I",
               org_agenda_clock_out = "O",
               org_agenda_clock_cancel = "X",
               org_agenda_clock_goto = "J",
               org_agenda_set_effort = "e",
               org_agenda_show_help = "?",
             },
             org = {
               org_todo = "cit",
               org_todo_prev = "ciT",
               org_toggle_checkbox = "<C-Space>",
               org_open_at_point = "<CR>",
               org_cycle = "<TAB>",
               org_global_cycle = "<S-TAB>",
               org_archive_subtree = "<Leader>o$",
               org_set_tags_command = "<Leader>ot",
               org_toggle_archive_tag = "<Leader>oA",
               org_do_promote = "<<",
               org_do_demote = ">>",
               org_promote_subtree = "<s",
               org_demote_subtree = ">s",
               org_meta_return = "<Leader><CR>",
               org_insert_heading_respect_content = "<Leader>oh",
               org_insert_todo_heading = "<Leader>oT",
               org_insert_todo_heading_respect_content = "<Leader>ot",
               org_move_subtree_up = "<Leader>oK",
               org_move_subtree_down = "<Leader>oJ",
               org_export = "<Leader>oe",
               org_next_visible_heading = "}",
               org_previous_visible_heading = "{",
               org_forward_heading_same_level = "]]",
               org_backward_heading_same_level = "[[",
               org_outline_up_heading = "g{",
               org_clock_in = "<Leader>oxi",
               org_clock_out = "<Leader>oxo",
               org_clock_cancel = "<Leader>oxq",
               org_clock_goto = "<Leader>oxj",
               org_set_effort = "<Leader>oxe",
               org_show_help = "g?",
             },
           },
         })
       end,
     },
     {
       "akinsho/org-bullets.nvim",
       ft = { "org" },
       config = function()
         require("org-bullets").setup({
           symbols = {
             headlines = { "◉", "○", "✸", "✿" },
             checkboxes = {
               half = { "", "OrgTSCheckboxHalfChecked" },
               done = { "✓", "OrgDone" },
               todo = { "˟", "OrgTODO" },
             },
           },
         })
       end,
     },
     
     -- Ollama AI integration
     {
       "David-Kunz/gen.nvim",
       config = function()
         require("gen").setup({
           model = "codellama:13b",
           host = "localhost",
           port = "11434",
           quit_map = "q",
           retry_map = "<c-r>",
           accept_map = "<c-cr>",
           display_mode = "split",
           show_prompt = false,
           show_model = false,
           no_auto_close = false,
           debug = false
         })
       end,
     },
   }
 })
