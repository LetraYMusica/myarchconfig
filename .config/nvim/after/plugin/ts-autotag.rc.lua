local status, autotag = pcall(require, 'nvim-ts-autotag')
if not status then
  print('Autotag no se encuentra en el equipo')
  return
end

autotag.setup {}
