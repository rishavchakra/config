-- Language-specific configuration
--
-- Tabs, spaces, etc.

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = { "*.lua" },
	callback = function(args)
		vim.opt.expandtab = false
	end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = { "*.ts", "*.tsx", "*.jsx", "*.js", "*.json" },
	callback = function(args)
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.expandtab = false
	end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = {"*.c", "*.cpp", "*.cxx", "*.cc", "*.h", "*.hxx", "*.hpp"},
	callback = function(args)
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = {"*.tex"},
	callback = function(args)
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.opt.expandtab = false
	end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = {"*.vert", "*.frag"},
	command = "set filetype=glsl",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.wgsl" }, command = "set filetype=wgsl" })
