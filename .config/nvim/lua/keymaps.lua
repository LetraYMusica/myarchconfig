local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- remapeando <Space> como tecla líder
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- -----------------------------------
-- modo normal
-- -----------------------------------
keymap('n', '<Up>', '<nop>', opts)
keymap('n', '<Down>', '<nop>', opts)
keymap('n', '<Left>', '<nop>', opts)
keymap('n', '<Right>', '<nop>', opts)

-- navegación
keymap('n', '<leader>e', "<cmd>lua print('hola mundo')<cr>", opts)
keymap('n', '<leader>t', ':NvimTreeToggle<cr>', opts)

keymap('n', '<S-l>', ':bnext<cr>', opts)
keymap('n', '<S-h>', ':bprevious<cr>', opts)

keymap('n', '<A-k>', ':m -2<cr>', opts)
keymap('n', '<A-j>', ':m +1<cr>', opts)

keymap('n', 'sl', '<C-w>l', opts)
keymap('n', 'sk', '<C-w>k', opts)
keymap('n', 'sj', '<C-w>j', opts)
keymap('n', 'sh', '<C-w>h', opts)

-- desplazamiento de líneas
keymap('n', '>', '>>', opts)
keymap('n', '<', '<<', opts)

-- split
keymap('n', '<C-s>', ':vsplit<cr>', opts)
keymap('n', '<A-s>', ':close<cr>', opts)
keymap('n', '<A-a>', ':only<cr>', opts)

-- incremento y decremento
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

--seleccionar todo
keymap('n', '<C-a>', 'gg<S-v>G', opts)
-- -----------------------------------
-- modo de inserción
-- -----------------------------------
keymap('i', '<Up>', '<nop>', opts)
keymap('i', '<Down>', '<nop>', opts)
keymap('i', '<Left>', '<nop>', opts)
keymap('i', '<Right>', '<nop>', opts)

keymap('i', '<C-k>', '<Up>', opts)
keymap('i', '<C-j>', '<Down>', opts)
keymap('i', '<C-l>', '<Right>', opts)
keymap('i', '<C-h>', '<Left>', opts)

keymap('i', '<esc>', '<nop>', opts)
keymap('i', 'kj', '<esc>', opts)

keymap('i', 'uuu', '<esc>bgUwea', opts)
keymap('i', 'iii', '<esc>bguwea', opts)
-- -----------------------------------
-- modo visual
-- -----------------------------------
keymap('v', '<Up>', '<nop>', opts)
keymap('v', '<Down>', '<nop>', opts)
keymap('v', '<Left>', '<nop>', opts)
keymap('v', '<Right>', '<nop>', opts)

keymap('v', '<esc>', '<nop>', opts)

-- permanecer en modo de indentación
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

-- mover el texto hacia arriba o hacia abajo
keymap('v', '<A-k>', ':m -2<cr>', opts)
keymap('v', '<A-j>', ':m +1<cr>', opts)

-- blque visual
-- mover el texto hacia arriba o hacia abajo
keymap('x', '<A-k>', ':m -2<cr>gv-gv', opts)
keymap('x', '<A-j>', ":move '>+1<cr>gv-gv", opts)
-- -----------------------------------
-- modo consola
-- -----------------------------------
keymap('c', 'Q<cr>', '<cmd>qall<cr>', { silent = false })
keymap('c', 'W<cr>', '<cmd>wall<cr>', { silent = false })
