return {
    'johnfrankmorgan/whitespace.nvim',
    config = function()
        require('whitespace-nvim').setup({
            highlight = 'DiffDelete',
            ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help', 'NeoTree', 'NeogitStatus', 'NeogitPopup' },
            ignore_terminal = true,
        })
    end
}
