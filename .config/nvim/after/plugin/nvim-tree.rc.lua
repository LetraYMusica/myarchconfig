local status, ntree = pcall(require, 'nvim-tree')
if not status then
  print('Nvim-tree no se encuentra en el equipo')
  return
end

ntree.setup({
  view = {
    adaptive_size = true,
    width = 20,
    hide_root_folder = true,
    side = "left",
    preserve_window_proportions = false,
    number = true,
    relativenumber = true,
    signcolumn = "yes"
  },
  actions = {
    use_system_clipboard = true,
    open_file = {
      quit_on_open = true
    }
  }
})
