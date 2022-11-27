local status, prettier = pcall(require, 'prettier')
if not status then
  print('Prettier no se encuentra en el sistema')
  return
end

prettier.setup({
  bin = 'prettierd', -- or `'prettier'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    'php'
  },
})
