return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"prismals",
				"solidity_ls_nomicfoundation",
				"rust_analyzer",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config.ts_ls = {
				init_options = {
					preferences = {
						disableSuggestions = false,
					},
				},
				settings = {
					typescript = {
						format = { enable = false },
					},
					javascript = {
						format = { enable = false },
					},
				},
			}

			vim.lsp.config.rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						diagnostics = {
							enable = false,
						},
					},
				},
			}

			vim.lsp.enable("rust_analyzer")

			vim.lsp.config.taplo = {
				filetypes = { "toml" },
				-- IMPORTANT: this is required for taplo LSP to work in non-git repositories
				root_dir = require("lspconfig.util").root_pattern("*.toml", ".git"),
			}

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- Solidity LSP setup (official recommended config)
			local lspconfig = require("lspconfig")
			local configs = require("lspconfig.configs")

			configs.solidity = {
				default_config = {
					cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
					filetypes = { "solidity" },
					root_dir = lspconfig.util.find_git_ancestor,
					single_file_support = true,
				},
			}

			lspconfig.solidity.setup({ capabilities = capabilities })

			-- Disable solc LSP (conflicts with nomicfoundation server)
			vim.lsp.config.solc = { filetypes = {} }

			-- Displays the LSP diagnostic inline
			vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true } })

			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "[E]xpand diagnostic message" })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
