local status, ll = pcall(require, 'lualine')
if not status then
  print('Lualine no se encuentra en el sistema')
  return
end

ll.setup({
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '  ', right = '' },
  }
})
