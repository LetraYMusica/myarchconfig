vim.cmd ('autocmd!')

vim.opt.clipboard:append { 'unnamedplus' }

local settings = {
	cmdheight = 1,
	fileencoding = "utf-8",
	hlsearch = false,
	ignorecase = true,
	mouse = "a",
	smartcase = true,
	smartindent = true,
	splitright = true,
	splitbelow = true,
	timeoutlen = 1000,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
  colorcolumn = "120",
  termguicolors = true,
  wildoptions = 'pum',
  pumblend = 5,
  background = 'dark'
}

for k, v in pairs(settings) do
	vim.opt[k] = v
end
