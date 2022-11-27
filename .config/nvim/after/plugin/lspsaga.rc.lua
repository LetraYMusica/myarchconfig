local status, saga = pcall(require, 'lspsaga')
if not status then
	print('Lspsaga no se encuentra en el equipo')
	return
end

saga.init_lsp_saga()

local opt = { silent = true }

local set = vim.keymap.set

set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opt)
set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opt)
set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opt)
-- set('i', '<C-ñ>', '<Cmd>Lspsaga signature_help<cr>', opt)
set('n', 'gp', '<Cmd>Lspsaga peek_definition<cr>', opt)
set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opt)
