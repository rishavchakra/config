--[[ Download and get reference to Packer.nvim ]]

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Install packer from github if is not in our system
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer now, please close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
  -- augroup packer_user_config
    -- autocmd!
    -- autocmd BufWritePost plugins.lua source <afile> | PackerSync
  -- augroup end
-- ]])

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	print('Packer could not be found or properly referenced')
	return
end

return packer

