local status, autopairs = pcall(require, 'nvim-autopairs')
if not status then
  print('Autopairs no se encuentra en el equipo')
  return
end

autopairs.setup {
  disable_filetype = {
    'TelescopePrompt',
    'vim'
  }
}
