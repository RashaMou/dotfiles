local function delete_scratch_buffer()
  local bufname = vim.fn.expand '%:p'
  local snacks = require 'snacks.scratch'
  local scratches = snacks.list()
  local scratch_file = nil

  for _, s in ipairs(scratches) do
    local full_path = vim.fn.fnamemodify(s.file, ':p')
    if full_path == bufname then
      scratch_file = full_path
      break
    end
  end

  if scratch_file then
    -- Store buffer info
    local win_id = vim.fn.win_getid()
    local buf_to_delete = vim.fn.bufnr '%'

    -- Try to switch buffers first
    pcall(function()
      vim.cmd 'if bufnr("#") > 0 | b # | else | bn | endif'
    end)

    -- Clean up the scratch windows/buffers properly
    pcall(function()
      -- Tell snacks the scratch is gone by clearing its state
      vim.g.snacks_scratch_list = nil
      -- Force close any floating windows
      vim.cmd 'wincmd c'
    end)

    -- Only focus window if still valid
    if vim.api.nvim_win_is_valid(win_id) then
      vim.fn.win_gotoid(win_id)
    end

    -- Delete the buffer
    pcall(function()
      vim.cmd('bdelete! ' .. buf_to_delete)
    end)

    -- Delete the actual file
    local success, err = os.remove(scratch_file)
    if success then
      -- Clear the plugin's cache of scratch files
      vim.schedule(function()
        vim.g.snacks_scratch_list = nil
        snacks.list() -- Force a fresh read
      end)
    else
      print('Failed to delete file:', err)
    end
  else
    print 'Scratch file not found!'
  end
end

vim.keymap.set('n', '<leader>ed', delete_scratch_buffer, { desc = 'Delete Scratch Buffer' })
