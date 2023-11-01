vim.api.nvim_exec([[ autocmd BufWritePre,InsertLeave *.js,*.jsx,*.tsx,*.ts,*.css,*.html,*.md Neoformat ]], false)

