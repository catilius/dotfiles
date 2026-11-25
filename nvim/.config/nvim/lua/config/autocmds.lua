-- highlights yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      -- timeout = 40,
    })
  end,
})

-- format on save
local format_group = vim.api.nvim_create_augroup("LspFormatOnSave", {
  clear = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = format_group,
  desc = "Format with attached language servers before saving",

  callback = function(event)
    local clients = vim.lsp.get_clients({
      bufnr = event.buf,
      method = "textDocument/formatting",
    })

    for _, client in ipairs(clients) do
      if not client:supports_method("textDocument/willSaveWaitUntil", event.buf) then
        vim.lsp.buf.format({
          bufnr = event.buf,
          id = client.id,
          async = false,
          timeout_ms = 1000,
        })
      end
    end
  end,
})
