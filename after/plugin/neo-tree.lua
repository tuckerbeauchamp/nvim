require('neo-tree').setup { 
    filesystem = {
        filtered_items = {
            visible = true,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            never_show = {
                '.git',
            }
        }
    }
}
