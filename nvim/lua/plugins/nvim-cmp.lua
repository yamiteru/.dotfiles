function config()
	local cmp = require("cmp")
	local cmplsp = require("cmp_nvim_lsp")
	local compare = require("cmp.config.compare")
	local luasnip = require("luasnip")

	local capabilities = require('cmp_nvim_lsp').default_capabilities()

	require("mason-lspconfig").setup_handlers({
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabiities = capabilities
			})
		end
	})

	cmp.setup({
		preselect = false,
		min_length = 0,

		completion = {
			completeopt = "menu,menuone,preview,noselect",
		},

		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},

		formatting = {
			fields = { "abbr", "kind", "menu" },
		},

		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},

		view = {
			entries = {
				name = "custom",
				selection_order = "near_cursor",
				follow_cursor = true,
			},
		},

		mapping = {
			["<C-y>"] = cmp.mapping(
				cmp.mapping.confirm({
					select = true,
					behavior = cmp.ConfirmBehavior.Insert,
				}),
				{ "i", "c" }
			),
			["<C-n>"] = cmp.mapping.select_next_item({
				behavior = cmp.ConfirmBehavior.Insert,
			}),
			["<C-p>"] = cmp.mapping.select_prev_item({
				behavior = cmp.ConfirmBehavior.Insert,
			}),
			["<C-b>"] = cmp.mapping.scroll_docs(-5),
			["<C-f>"] = cmp.mapping.scroll_docs(5),
			["<C-q>"] = cmp.mapping.abort(),
		},

		matching = {
			disallow_fuzzy_matching = true,
			disallow_fullfuzzy_matching = true,
			disallow_partial_fuzzy_matching = true,
			disallow_partial_matching = false,
			disallow_prefix_unmatching = true,
    },

		sources = cmp.config.sources({
			{ name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "treesitter" },
			{ name = "path" },
			{ name = "buffer" },
			{ name = "supermaven" },
			{ name = "nvim_lsp_signature_help" },
			{
				name = 'look',
				option = {
					convert_case = true,
					loud = true
				}
			},
		}),

		sorting = {
			priority_weight = 1,
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				require("cmp-under-comparator").under,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},

		performance = {
			max_view_entries = 20,
		},
	})

	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})

	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		}),
		matching = { disallow_symbol_nonprefix_matching = false }
	})

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			local opts = { buffer = ev.buf }

			vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		end,
	})
end

return {
	"hrsh7th/nvim-cmp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"octaltree/cmp-look",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"lukas-reineke/cmp-under-comparator",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = config
}
