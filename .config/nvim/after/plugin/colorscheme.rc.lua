local status, color = pcall(require, 'nightfox')
if not status then
  return
end

color.setup({
  options = {
    transparent = true
  }
})

vim.cmd("colorscheme nightfox")
