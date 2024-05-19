-- Set leader key
vim.g.mapleader = " "
vim.cmd("set termguicolors")

-- bootstrap lazy.nvim
require("config.lazy")

-- bootstrap additional configs
require("config.config")

require("config.ansible")
