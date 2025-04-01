vim.keymap.set("n", "<leader>u", function()
    vim.cmd("UndotreeToggle")
end)

vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>")

vim.keymap.set("n", "<leader>U", function()
    vim.cmd("UndotreeFocus")
end)
