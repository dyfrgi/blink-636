-- Clipboard configuration
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
vim.opt.clipboard = "unnamedplus" -- use the '+' register by default

local builtin = {}

local function get_selected_text()
  if vim.fn.visualmode() == 'V' then return vim.fn.trim(vim.fn.getreg(vim.v.register, true), '\n', 2) end
  return ''
end

vim.api.nvim_create_autocmd('InsertEnter', {
  group = vim.api.nvim_create_augroup('BlinkSnippetsEagerEnter', { clear = true }),
  callback = function()
    builtin.eager = {}
    builtin.eager.TM_SELECTED_TEXT = get_selected_text()
  end,
})
