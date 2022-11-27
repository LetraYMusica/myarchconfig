local status, telescope = pcall(require, 'telescope')
if not status then
  print('Telescope no se encuentra en el equipo')
  return
end

local actions = require('telescope.actions')

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      }
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          ['a'] = fb_actions.create,
          ['u'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd('startinsert')
          end
        }
      }
    }
  }
}

telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }

local set = vim.keymap.set

set('n', ';f', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<CR>', opts)
set('n', ';r', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
set('n', ';t', '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)
set('n', ';;', '<cmd>lua require("telescope.builtin").resume()<CR>', opts)
set('n', ';e', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', opts)
set('n', '\\\\', '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
set('n', 'sf',
  '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 20 } })<CR>'
  , opts)
