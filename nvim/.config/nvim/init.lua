-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- bootstrap packer plugin
local fn = vim.fn
local execute = vim.api.nvim_command

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

-- load settings

require('settings.init')
require('tmp')
require('settings').setup()
require('plugins').setup()
require('config.lsp').setup()
