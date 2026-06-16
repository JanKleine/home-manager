require('claudecode').setup({
  terminal = {
    provider = 'native',          -- built-in terminal split; no snacks.nvim
    split_side = 'right',
    split_width_percentage = 0.30,
  },
  -- terminal_cmd defaults to `claude` on PATH (Nix-managed via home.packages)
})

-- Session / terminal
vim.keymap.set('n', '<leader>ac', '<cmd>ClaudeCode<cr>',            { desc = 'Toggle Claude' })
vim.keymap.set('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>',       { desc = 'Focus Claude' })
vim.keymap.set('n', '<leader>ar', '<cmd>ClaudeCode --resume<cr>',   { desc = 'Resume Claude' })
vim.keymap.set('n', '<leader>aC', '<cmd>ClaudeCode --continue<cr>', { desc = 'Continue Claude' })
vim.keymap.set('n', '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', { desc = 'Select model' })

-- Context references (the IntelliJ-style "select and reference")
vim.keymap.set('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>',        { desc = 'Send selection to Claude' })
vim.keymap.set('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>',       { desc = 'Add current buffer' })

-- In-editor diffs proposed by Claude
vim.keymap.set('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>',  { desc = 'Accept diff' })
vim.keymap.set('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>',    { desc = 'Deny diff' })

-- nvim-tree: @-mention the file/dir under the cursor (buffer-local, mirrors README `ft` map)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'NvimTree',
  callback = function(ev)
    vim.keymap.set('n', '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>',
      { buffer = ev.buf, desc = 'Add file to Claude' })
  end,
})
