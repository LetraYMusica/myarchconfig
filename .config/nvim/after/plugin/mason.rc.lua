local status, mason = pcall(require, 'mason')
if not status then
  print('Mason no se encuentra en el sistema')
  return
end

local status2, lspconfig = pcall(require, 'mason-lspconfig')
if not status2 then
  print('Mason-lspconfig no se encuentra en el sistema')
  return
end

mason.setup()
lspconfig.setup({
  ensure_installed = {
    'tsserver',
    'texlab',
    'emmet_ls',
  },
})
