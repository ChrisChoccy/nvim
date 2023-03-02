-- PaperColor
vim.opt.background = 'light'
vim.cmd [[colorscheme PaperColor]]

-- Italics
local function mod_hl(hl_name, opts)
	local is_ok, hl_def = pcall(vim.api.nvim_get_hl_by_name, hl_name, true)
	if is_ok then
		for k,v in pairs(opts) do hl_def[k] = v end
		vim.api.nvim_set_hl(0, hl_name, hl_def)
	end
end

vim.api.nvim_create_autocmd({"VimEnter", "ColorScheme"}, {
	group = vim.api.nvim_create_augroup('Color', {}),
	pattern = "*",
	callback = function ()
		mod_hl("PythonBoolean", { bold=true, italic=true })
		mod_hl("PythonRepeat", { bold=true, italic=true })
		mod_hl("PythonConditional", { bold=true, italic=true })
		mod_hl("PythonOperator", { bold=true, italic=true })
		mod_hl("PythonImport", { bold=true, italic=true })
		mod_hl("structure", { bold=true, italic=true })

		mod_hl("function", { bold=true })

		mod_hl('identifier', { italic=true })
		mod_hl("PythonStatement", { italic=true })
		mod_hl("constant", { italic=true })
  end
})