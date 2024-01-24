return {
    'f-person/git-blame.nvim',
    config = function()
        require('gitblame').setup({
            virtual_text_column = 80,
            message_when_not_committed = '  <author> • <date> • <summary>',
            gitblame_set_extmark_options = {
                priority = 200
            }
        })
    end
}
