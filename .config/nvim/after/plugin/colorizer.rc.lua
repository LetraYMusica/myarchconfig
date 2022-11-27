local status, colorizer = pcall(require, 'colorizer')
if not status then
  print('Colorizer no se eencuentra en el equipo')
  return
end

colorizer.setup {
  '*';
  css = { names = true }
}
