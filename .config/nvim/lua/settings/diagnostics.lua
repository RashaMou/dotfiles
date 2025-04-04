-- Disable inline diagnostics
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    focusable = false,
    header = '',
    prefix = '',
    source = true,
    scope = 'buffer',
  },
}

-- Create a custom filter for diagnostics
local ns = vim.api.nvim_create_namespace 'filtered_diagnostics'
local orig_set_diagnostic = vim.diagnostic.set

vim.diagnostic.set = function(namespace, bufnr, diagnostics, opts)
  -- Filter out the specific ESLint error
  local filtered = {}
  for _, diag in ipairs(diagnostics) do
    if not (diag.source == 'eslint' and type(diag.message) == 'string' and diag.message:match "Cannot find package 'eslint%-plugin%-react'") then
      table.insert(filtered, diag)
    end
  end
  return orig_set_diagnostic(namespace, bufnr, filtered, opts)
end

-- Enable diagnostics on hover
vim.api.nvim_create_autocmd({ 'CursorHold' }, {
  pattern = '*',
  callback = function()
    for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.api.nvim_win_get_config(winid).zindex then
        return
      end
    end
    vim.diagnostic.open_float {
      scope = 'cursor',
      focusable = false,
      close_events = {
        'CursorMoved',
        'CursorMovedI',
        'BufHidden',
        'InsertCharPre',
        'WinLeave',
      },
    }
  end,
})

-- Open the diagnostic float for the current line
vim.keymap.set('n', '<leader>dl', function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = 'Show Diagnostic on Current Line' })

-- Jump to the next diagnostic and hover
vim.keymap.set('n', ']d', function()
  vim.diagnostic.goto_next()
  vim.diagnostic.open_float(nil, { focus = false }) -- Show diagnostic in a floating window
end, { desc = 'Next Diagnostic' })

-- Jump to the previous diagnostic and hover
vim.keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev()
  vim.diagnostic.open_float(nil, { focus = false }) -- Show diagnostic in a floating window
end, { desc = 'Previous Diagnostic' })
