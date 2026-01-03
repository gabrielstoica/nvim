return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({
					condition = function(utils)
						return utils.root_has_file({
							".prettierrc.yml",
							".prettierrc.yml",
							".prettierrc.json",
							".prettierrc",
						})
					end,
				}),
				null_ls.builtins.formatting.fixjson,
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.taplo,
				null_ls.builtins.formatting.rustfmt,
				require("none-ls.diagnostics.eslint_d"), -- requires none-ls-extras.nvim
			},
		})

		vim.keymap.set("n", "<D-s>", function()
			vim.lsp.buf.format()
			vim.cmd("wa") -- Save the file
		end, { noremap = true, silent = true })

		vim.keymap.set("i", "<D-s>", function()
			vim.lsp.buf.format() -- Format the file
			vim.cmd("stopinsert")
			vim.cmd("wa") -- Save the file
		end, { noremap = true, silent = true })
	end,
}
