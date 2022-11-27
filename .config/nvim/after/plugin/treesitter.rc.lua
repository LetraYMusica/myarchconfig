local status, ts = pcall(require, 'nvim-treesitter.configs')
if not status then
  print('Treesitter no se encuentra en el equipo.')
  return
end

ts.setup({
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    'tsx',
    'json',
    'css',
    "lua",
    'javascript',
    'html'
  },
  autotag = {
    enable = true,
  }
})
