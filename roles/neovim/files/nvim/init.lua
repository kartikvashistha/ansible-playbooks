-- Set leader key
vim.g.mapleader = " "
vim.cmd("set termguicolors")

-- bootstrap lazy.nvim
require("configs.lazy")

-- bootstrap additional configs
require("configs.config")
require("configs.keymaps")
require("configs.ansible")
