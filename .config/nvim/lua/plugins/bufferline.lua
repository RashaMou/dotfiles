return {
  'akinsho/bufferline.nvim',
  opts = {
    options = {
      always_show_bufferline = false,
      diagnostics = 'nvim_lsp',
      show_buffer_close_icons = true,
      separator_style = 'slant',
      show_close_icon = false,
      color_icons = true,
      tab_size = 18,
      max_name_length = 18,
      indicator = {
        icon = '┃ ',
        style = 'icon',
      },
    },
    highlights = {
      buffer_selected = {
        bold = true,
        fg = '#fab388',
        bg = '#1e1e2e',
      },
      fill = {
        bg = '#1c1c1c',
      },
    },
  },
}
