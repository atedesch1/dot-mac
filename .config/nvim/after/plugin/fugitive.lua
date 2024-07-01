vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { silent = true, desc = '[G]it [S]tack' })

local fugitive_group = vim.api.nvim_create_augroup("fugitive_group", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
  group = fugitive_group,
  pattern = "*",
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>p", function()
      vim.cmd.Git('pull --rebase')
    end, opts)

    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git('push')
    end, opts)

    vim.keymap.set("n", "<leader>t", function()
      local word = vim.fn.expand("<cWORD>")
      vim.api.nvim_feedkeys(":" .. "Git push -u origin " .. word, "n", true)
    end, opts)
    vim.keymap.set("n", "<leader>T", ":Git push -u origin ", opts);

    vim.keymap.set("n", "<leader>c", ":Git checkout ", opts);
    vim.keymap.set("n", "<leader>r", ":Git rebase ", opts);
  end,
})
