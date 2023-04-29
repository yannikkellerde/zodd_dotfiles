local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ command = "source <afile> | PackerCompile", group = packer_group, pattern = "init.lua" }
)

require("packer").startup(function(use)
	use "mechatroner/rainbow_csv"
	use "wbthomason/packer.nvim"
	use "andweeb/presence.nvim"
	use { "catppuccin/nvim", as = "catppuccin" }
	use "glepnir/dashboard-nvim"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/nvim-cmp"
	use "jose-elias-alvarez/null-ls.nvim"
	use "kyazdani42/nvim-web-devicons"
	use "L3MON4D3/LuaSnip"
	use "neovim/nvim-lspconfig"
	use "lewis6991/gitsigns.nvim"
	use "nvim-lua/plenary.nvim"
  use "nvim-lualine/lualine.nvim"
	use "nvim-telescope/telescope.nvim"
	use "nvim-telescope/telescope-file-browser.nvim"
	use "nvim-treesitter/nvim-treesitter"
	use "onsails/lspkind-nvim"
	use "ryanoasis/vim-devicons"
	use "saadparwaiz1/cmp_luasnip"
	use "simrat39/rust-tools.nvim"
	use "tpope/vim-commentary"
	use {"williamboman/mason.nvim", run = ":MasonUpdate"}
	use {"williamboman/mason-lspconfig.nvim"}
	use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
	use "nickeb96/fish.vim"
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'lervag/vimtex'
end)

vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.lazyredraw = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.updatetime = 100
vim.g.mapleader = ","
vim.g.mouse = false
vim.g.ttymouse = false
for i=1,9,1 do
	vim.keymap.set("n",tostring(i).."<Space>".."l",":"..string.rep("bnext|",i).."<CR>",{ silent = true })
	vim.keymap.set("n",tostring(i).."<Space>".."h",":"..string.rep("bprevious|",i).."<CR>",{ silent = true })
	vim.keymap.set("n",tostring(i).."<Space>".."t",":bfirst|"..string.rep("bnext|",i-1).."<CR>",{ silent = true })
end

vim.keymap.set("n","+","ddko")
vim.keymap.set("n","cr","ct_")
vim.keymap.set("n","dr","dt_")
vim.keymap.set("n", "<Space>f", vim.lsp.buf.code_action)
vim.keymap.set("n", "<Space>k", "K")
vim.keymap.set("n", "<Space>i", "<C-I>zz")
vim.keymap.set("n", "<Space>o", "<C-O>zz")
vim.keymap.set("n","<Space>z","<C-6>", { silent = true})
vim.keymap.set("n","<Space>l",":bnext<CR>", { silent = true})
vim.keymap.set("n","<Space>m",":bmod<CR>", { silent = true})
vim.keymap.set("n","<Space>h",":bprevious<CR>", { silent = true})
vim.keymap.set("n","<Space>q",":bp <BAR> bd #|bnext<CR>", { silent = true})
vim.keymap.set("n","<Space>Q",":%bd|e#<CR>", { silent = true})

vim.keymap.set("n","<Space>vb",":ls<cr>:vertical sb<space>", { silent = true})
vim.keymap.set("n","<Space>b",":ls<cr>:b<space>", { silent = true})
vim.keymap.set("n","<Leader>b",":b#<CR>", { silent = true})
vim.keymap.set("n","<Space>sb",":ls<cr>:sb<space>", { silent = true})

vim.keymap.set("v","<Space>r", "\"hy:%s/<C-r>h//g<left><left>")
vim.keymap.set("v","<Space>s",function()
     return "y:.,.+" .. vim.v.count .. "s/<C-R>+/" end, {expr = true})
vim.keymap.set("v","<Space>x","<C-x>")
vim.keymap.set("v","<Space>a","<C-a>")
vim.keymap.set("v","g<Space>x","g<C-x>")
vim.keymap.set("v","g<Space>a","g<C-a>")
vim.keymap.set("n","<Space>x","<C-x>")
vim.keymap.set("n","<Space>a","<C-a>")

vim.keymap.set("n","<Space>{","C{}<Esc>P")
vim.keymap.set("n","<Space>(","C()<Esc>P")
vim.keymap.set("n","<Space>[","C[]<Esc>P")
vim.keymap.set("n","<Space>'","C''<Esc>P")
vim.keymap.set("n",'<Space>"','C""<Esc>P')
vim.keymap.set("v","<Space>p",'"9dP"')

vim.keymap.set("n","<Leader>c",":VimtexCompile<CR>")
vim.keymap.set("n","<Leader>e",":VimtexView<CR>")
vim.keymap.set("n","<Leader>m",":TSContextToggle<CR>", {silent = true})
vim.keymap.set("n","<Leader>s",":mksession! editing.vim<CR>")
vim.keymap.set("n","<Leader>{","ciw{}<Esc>P")
vim.keymap.set("n","<Leader>(","ciw()<Esc>P")
vim.keymap.set("n","<Leader>[","ciw[]<Esc>P")
vim.keymap.set("n","<Leader>'","ciw''<Esc>P")
vim.keymap.set("n",'<Leader>"','ciw""<Esc>P')
vim.keymap.set("v","<Leader>{","c{}<Esc>P")
vim.keymap.set("v","<Leader>(","c()<Esc>P")
vim.keymap.set("v","<Leader>[","c[]<Esc>P")
vim.keymap.set("v","<Leader>'","c''<Esc>P")
vim.keymap.set("v",'<Leader>"','c""<Esc>P')

vim.keymap.set("v","//","y/\\V<C-r>\"<CR>")
vim.keymap.set("n",'<','<<')
vim.keymap.set("n",'>','>>')
vim.keymap.set("n",'°','$')
vim.keymap.set("n",'Q','$')
vim.keymap.set("v",'Q','$')
vim.keymap.set("n",'""',':registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>',{ silent = true })
vim.keymap.set("n","<C-down>","<C-W><C-J>")
vim.keymap.set("n","<C-up>","<C-W><C-K>")
vim.keymap.set("n","<C-right>","<C-W><C-L>")
vim.keymap.set("n","<C-left>","<C-W><C-H>")
vim.keymap.set("n", "<Leader>k", "<C-w>k")
vim.keymap.set("n", "<Leader>h", "<C-w>h")
vim.keymap.set("n", "<Leader>j", "<C-w>j")
vim.keymap.set("n", "<Leader>l", "<C-w>l")
vim.keymap.set("n", "<Leader>q", ":bprevious<CR>:bdelete #<CR>", { silent = true })
vim.keymap.set("n", "<Leader>n", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? \"gk\" : \"k\"", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? \"gj\" : \"j\"", { expr = true, silent = true })
vim.keymap.set("n", "<Leader>T", ":vsplit term://zsh <CR>", { silent = true })
vim.keymap.set("n", "<Leader>t", ":e term://zsh <CR>", { silent = true })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { silent = true })
vim.keymap.set("n", "<Leader>v", ":edit ~/.config/nvim/init.lua<CR>", { silent = true })
vim.keymap.set("n", "<C-S>", ":update<CR>", { silent=true })
vim.keymap.set("v", "<C-S>", "<C-C>:update<CR>", { silent=true })
vim.keymap.set("i", "<C-S>", "<C-O>:update<CR>", { silent=true })

local lang_maps = {
	cpp = { build = "g++ % -o %:r", exec = "./%:r" },
	typescript = { build = "deno compile %", exec = "deno run %" },
	javascript = { build = "deno compile %", exec = "deno run %" },
	python = { exec = "python %" },
	java = { build = "javac %", exec = "java %:r" },
	sh = { exec = "./%" },
	go = { build = "go build", exec = "go run %" },
	rust = { exec = "cargo run" },
	arduino = {
		build = "arduino-cli compile --fqbn arduino:avr:uno %:r",
		exec = "arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno %:r",
	},
}
for lang, data in pairs(lang_maps) do
	if data.build ~= nil then
		vim.api.nvim_create_autocmd(
			"FileType",
			{ command = "nnoremap <Leader>b :!" .. data.build .. "<CR>", pattern = lang }
		)
	end
	vim.api.nvim_create_autocmd(
		"FileType",
		{ command = "nnoremap <Leader>e :split<CR>:terminal " .. data.exec .. "<CR>", pattern = lang }
	)
end
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	command = "lua vim.lsp.buf.formatting_sync(nil, 1000)",
-- 	pattern = "*.cpp,*.css,*.go,*.h,*.html,*.js,*.json,*.jsx,*.lua,*.md,*.py,*.rs,*.ts,*.tsx,*.yaml",
-- })
vim.api.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("TermOpen", { command = "startinsert", pattern = "*" })
vim.api.nvim_create_autocmd("BufWinEnter", { command = "set noexpandtab tabstop=2 shiftwidth=2", pattern = "*.rs" })

vim.cmd "sign define DiagnosticSignError text=● texthl=DiagnosticSignError"
vim.cmd "sign define DiagnosticSignWarn text=● texthl=DiagnosticSignWarn"
vim.cmd "sign define DiagnosticSignInfo text=● texthl=DiagnosticSignInfo"
vim.cmd "sign define DiagnosticSignHint text=● texthl=DiagnosticSignHint"

vim.diagnostic.config { virtual_text = false }

require("presence"):setup {
	neovim_image_text = "Neovim",
	presence_log_level = "error",
	presence_editing_text = "Editing « %s »",
	presence_file_explorer_text = "Browsing files",
	presence_reading_text = "Reading  « %s »",
	presence_workspace_text = "Working on « %s »",
}

vim.g.catppuccin_flavour = "mocha"
vim.cmd "colorscheme catppuccin"

local db = require "dashboard"
db.custom_header = {
	"",
	"",
	"",
	"",
	" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
	" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
	" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
	" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
	" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
	" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
	"",
	"",
	"",
}
db.custom_center = {
	{
		icon = " ",
		desc = "New File            ",
		action = "DashboardNewFile",
	},
	{
		icon = " ",
		desc = "Browse Files        ",
		action = "Telescope file_browser",
	},
	{
		icon = " ",
		desc = "Find File           ",
		action = "Telescope find_files",
	},
	{
		icon = " ",
		desc = "Configure Neovim    ",
		action = "edit ~/.config/nvim/init.lua",
	},
	{
		icon = " ",
		desc = "Exit Neovim              ",
		action = "quit",
	},
}
vim.keymap.set("n", "<Leader>o", ":DashboardNewFile<CR>", { silent = true })

local luasnip = require "luasnip"
local cmp = require "cmp"
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		["<UP>"] =  cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm()
				cmp.abort()
				vim.cmd('call feedkeys("\\<UP>")')
			else
				fallback()
			end
		end, { "i", "s" }),
		["<Down>"] =  cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm()
				cmp.abort()
				vim.cmd('call feedkeys("\\<DOWN>")')
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-Space>"] = cmp.mapping.complete(),
		-- ["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = { { name = "nvim_lsp", max_item_count = 10 }, { name = "luasnip", max_item_count = 10 } },
}

local servers = {
	"bashls",
	"clangd",
	"cssls",
	"gopls",
	"html",
	"pyright",
	"rust_analyzer",
	"lua_ls",
	"tailwindcss",
	"tsserver",
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
local has_formatter = { "gopls", "html", "rust_analyzer", "lua_ls", "tsserver" }
mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup{ensure_installed=servers}
on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "<Leader>p", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<Leader>i", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
	local should_format = true
	for _, value in pairs(has_formatter) do
		if client.name == value then
			should_format = false
		end
	end
	if not should_format then
		client.server_capabilities.document_formatting = false
	end
end

mason_lspconfig.setup_handlers({
	function (server_name)
		require("lspconfig")[server_name].setup{
			on_attach = on_attach,
		}
	end
})

--- local has_formatter = { "gopls", "html", "rust_analyzer", "lua_ls", "tsserver" }
--- for _, name in pairs(servers) do
--- 	local found, server = require("mason").get_server(name)
--- 	if found and not server:is_installed() then
--- 		print("Installing " .. name)
--- 		server:install()
--- 	end
--- end
---  
--- 
--- local setup_server = {
--- 	lua_ls = function(opts)
--- 		opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
--- 	end,
--- }
--- require("mason").on_server_ready(function(server)
--- 	local opts = {
--- 		on_attach = function(client, bufnr)
--- 			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--- 			local opts = { buffer = bufnr }
--- 			vim.keymap.set("n", "<Leader>p", vim.lsp.buf.hover, opts)
--- 			vim.keymap.set("n", "<Leader>i", vim.lsp.buf.definition, opts)
--- 			vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
--- 			local should_format = true
--- 			for _, value in pairs(has_formatter) do
--- 				if client.name == value then
--- 					should_format = false
--- 				end
--- 			end
--- 			if not should_format then
--- 				client.server_capabilities.document_formatting = false
--- 			end
--- 		end,
--- 		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--- 	}
--- 	if setup_server[server.name] then
--- 		setup_server[server.name](opts)
--- 	end
--- 	server:setup(opts)
--- end)

local null_ls = require "null-ls"
null_ls.setup {
	sources = {
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
	},
}

require("gitsigns").setup {
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
}

local cp = require("catppuccin.palettes.init").get_palette()
local custom_catppuccin = require "lualine.themes.catppuccin"
custom_catppuccin.normal.b.bg = cp.surface0
custom_catppuccin.normal.c.bg = cp.base
custom_catppuccin.insert.b.bg = cp.surface0
custom_catppuccin.command.b.bg = cp.surface0
custom_catppuccin.visual.b.bg = cp.surface0
custom_catppuccin.replace.b.bg = cp.surface0
custom_catppuccin.inactive.a.bg = cp.base
custom_catppuccin.inactive.b.bg = cp.base
custom_catppuccin.inactive.b.fg = cp.surface0
custom_catppuccin.inactive.c.bg = cp.base
require("lualine").setup {
	options = {
		theme = custom_catppuccin,
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
		lualine_b = { "filename", "branch", { "diff", colored = false } },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				mode=2,
				max_length=vim.o.columns,
				separator = { left = "", right = "" },
				right_padding = 2,
				symbols = { alternate_file = "" },
			},
		},
	},
}

local telescope = require "telescope"
local actions = require "telescope.actions"

telescope.setup {
	defaults = {
		mappings = { n = { ["o"] = actions.select_default,
	    ["x"] = actions.select_horizontal,
      ["v"] = actions.select_vertical,
      ["t"] = actions.select_tab,
	  } },
		initial_mode = "normal",
		hidden = true,
		file_ignore_patterns = { ".git/", "node_modules/", "target/" },
	},
	extensions = { file_browser = { hidden = true } },
}
telescope.load_extension "file_browser"
vim.keymap.set("n", "<C-j>", telescope.extensions.file_browser.file_browser)
vim.keymap.set("n", "<C-k>", require("telescope.builtin").find_files)
vim.keymap.set("n", "<C-l>", require("telescope.builtin").treesitter)

-- local fzf = require("fzf")

-- coroutine.wrap(function()
--   local result = fzf.fzf({"choice 1", "choice 2"}, "--ansi")
--   -- result is a list of lines that fzf returns, if the user has chosen
--   if result then
--     print(result[1])
--   end
-- end)()

require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"bash",
		"cpp",
		"css",
		"go",
		"html",
		"javascript",
		"lua",
		"make",
		"python",
		"rust",
		"tsx",
		"typescript",
		"yaml",
		-- "latex",
	},
	highlight = { enable = true },
}

require("rust-tools").setup {}

vim.keymap.set({ "n", "v" }, "<Leader>.", ":Commentary<CR>", { silent = true })

-- require("nvim-autopairs").setup {}

require("lsp_lines").setup {}
require("lsp_lines").toggle()
vim.keymap.set("n", "<Leader>-", require("lsp_lines").toggle)

vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
-- vim.g.vimtex_compiler_method = 'latexrun'
