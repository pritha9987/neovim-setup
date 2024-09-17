vim.cmd("set expandtab")
vim.cmd("set smarttab")
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.cmd("set noswapfile")
vim.cmd("set nobackup")



require("config.lazy")
require("vim-options")

require("lazy").setup("plugins")



