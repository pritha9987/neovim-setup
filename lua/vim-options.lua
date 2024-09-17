
vim.g.background = "light"

vim.opt.swapfile = false

-- related to search
--vim.cmd("set hlsearch")
--vim.cmd("set incsearch")

vim.o.ignorecase       = true       -- Search ignore case
vim.o.smartcase        = true       -- Search ignore case unless search contains an uppercase
vim.o.infercase        = true       -- Adjust case in insert completion mode
vim.o.expandtab = true -- expand tab input with spaces characters
vim.o.smartindent = true -- syntax aware indentations for newline inserts
vim.o.tabstop = 4 -- num of space characters per tab
vim.o.softtabstop = 4 -- num of space characters per tab
vim.o.shiftwidth = 4 -- spaces per indentation level
--
--" Show matching brackets when text indicator is over them
--set showmatch
--

vim.opt.clipboard = "unnamedplus"
vim.cmd("set mouse=")
--vim.g.clipboard = {
--  name = 'OSC 52',
--  copy = {
--    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
--    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
--  },
--  paste = {
--    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
--    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
--  },
--}

vim.cmd("set clipboard+=unnamedplus")

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

vim.o.termguicolors = true

--"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
--" => Perforce additions
--"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vim.keymap.set('n', '<Leader>pa',  ':!p4 add %:p<CR>')
vim.keymap.set('n', '<Leader>pe',  ':!p4 edit %:p<CR>')
vim.keymap.set('n', '<Leader>pr',  ':!p4 revert %:p<CR>')

vim.cmd([[autocmd BufReadPost * autocmd FileType ++once if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]])

local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = lastplace,
    pattern = { "*" },
    desc = "remember last cursor place",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

local function toggle_quickfix()
  local windows = vim.fn.getwininfo()
  for _, win in pairs(windows) do
    if win["quickfix"] == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end

vim.keymap.set('n', '<C-x>', toggle_quickfix, { desc = "Toggle Quickfix Window" })
