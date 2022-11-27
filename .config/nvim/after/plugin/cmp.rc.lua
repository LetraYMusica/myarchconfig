local status, cmp = pcall(require, 'cmp')
if not status then
  print('Cmp no se encuentra en el sistema')
  return
end

local lspkind = require('lspkind')

local map = cmp.mapping

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = map.preset.insert({
    ['<C-d>'] = map.scroll_docs(-4),
    ['<C-f>'] = map.scroll_docs(4),
    ['<C-Space>'] = map.complete(),
    ['<C-e>'] = map.close(),
    ['<CR>'] = map.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' }
  }),
  formatting = {
    format = lspkind.cmp_format({
      wirth_text = false,
      maxwidth = 50
    })
  }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
