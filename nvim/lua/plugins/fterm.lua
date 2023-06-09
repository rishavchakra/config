return {
    'numToStr/FTerm.nvim',
    cmd = { 'FTermOpen', 'FTermClose', 'Git', 'BuildCargo', 'BuildNpm' },
    opts = {
        border = 'double',
    },
    config = function(_, opts)
        require('FTerm').setup(opts)

        vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
        vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })

        vim.api.nvim_create_user_command('Git', function()
            require('FTerm').scratch({ cmd = {'lazygit'} })
        end, { bang = true })

        vim.api.nvim_create_user_command('BuildCargo', function()
            require('FTerm').scratch({ cmd = {'cargo', 'build', '--target', os.getenv('RUST_TARGET') } })
        end, { bang = true })

        vim.api.nvim_create_user_command('BuildNpm', function()
            require('FTerm').scratch({ cmd = {'npm', 'run', 'build'} })
        end, { bang = true })
    end,
    keys = {
        { '<A-t>', '<cmd>lua require("FTerm").toggle()<cr>', mode='n', desc='Toggle Terminal'},
        { '<A-t>', '<C-\\><C-n><cmd>lua require("FTerm").toggle()<cr>', mode='t', desc='Toggle Terminal'},
    },
}
