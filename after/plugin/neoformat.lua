vim.api.nvim_exec([[ autocmd BufWritePre,InsertLeave *.js,*.ts,*.css,*.html,*.md Neoformat ]], false)

