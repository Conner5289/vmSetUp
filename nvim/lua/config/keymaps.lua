-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.api.nvim_set_keymap("n", "<leader>cs", ":Telescope colorscheme<CR>", { noremap = true, silent = true })

--Java keymaps
vim.keymap.set("n", "<leader>jc", vim.cmd.JavaBuildCleanWorkspace, { desc = "Java: Clean Workspace" })
vim.keymap.set("n", "<leader>jb", vim.cmd.JavaBuildBuildWorkspace, { desc = "Java: Build Workspace" })
vim.keymap.set("n", "<leader>jr", vim.cmd.JavaRunnerRunMain, { desc = "Java: Run Main" })
vim.keymap.set("n", "<leader>js", vim.cmd.JavaRunnerStopMain, { desc = "Java: Stop Main" })
vim.keymap.set("n", "<leader>jtc", vim.cmd.JavaTestDebugCurrentClass, { desc = "Java: Run Class Test" })
vim.keymap.set("n", "<leader>jtm", vim.cmd.JavaTestRunCurrentMethod, { desc = "Java: Run method Test" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--NOTE: maybe keep
-- prime refactor plugin
-- vim.keymap.set('x', '<leader>re', ':Refactor extract ')
-- vim.keymap.set('x', '<leader>rf', ':Refactor extract_to_file ')
-- vim.keymap.set('x', '<leader>rv', ':Refactor extract_var ')
-- vim.keymap.set({ 'n', 'x' }, '<leader>ri', ':Refactor inline_var')
-- vim.keymap.set('n', '<leader>rI', ':Refactor inline_func')
-- vim.keymap.set('n', '<leader>rb', ':Refactor extract_block')
-- vim.keymap.set('n', '<leader>rbf', ':Refactor extract_block_to_file')

--NOTE: NeoTree open/close
-- vim.keymap.del("n", "<leader>/")

vim.keymap.set("n", "<leader>du", "<cmd>DBUIToggle<CR>", { desc = "Toggle DB UI" })
