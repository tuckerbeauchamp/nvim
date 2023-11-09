local lint = require("lint")
lint.linters_by_ft = {
    javascript = {'eslint'},
    typescript = {'eslint'},
    html = {'tidy'}
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})


vim.api.nvim_create_autocmd({ "TextChanged" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
