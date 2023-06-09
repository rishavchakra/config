local vim = vim
return {
    'numToStr/FTerm.nvim',
    cmd = { 'FTermOpen', 'FTermClose', 'Git', 'Build', 'Run' },
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

        vim.api.nvim_create_user_command('Build', function()
            local build_cmd = { error = true }
            local ft = vim.bo.filetype

            if ft == 'rust' then
                build_cmd = {'cargo', 'build'}
            elseif ft == 'typescript' or ft == 'typescriptreact' then
                build_cmd = {'npm', 'run', 'build'}
            elseif ft == 'zig' then
                build_cmd = {'zig', 'build'}
            end

            if build_cmd.error then
                require('notify')('No build command specified for this filetype!', vim.log.levels.WARN)
            else
                require('FTerm').scratch({ cmd = build_cmd })
            end
        end, { bang = true })

        vim.api.nvim_create_user_command('Run', function()
            local run_cmd = { error = true }
            local ft = vim.bo.filetype

            if ft == 'rust' then
                run_cmd = {'cargo', 'run'}
            elseif ft == 'typescript' or ft == 'typescriptreact' then
                run_cmd = {'npm', 'run', 'dev'}
            elseif ft == 'zig' then
                run_cmd = {'zig', 'run'}
            end

            if run_cmd.error then
                require('notify')('No run command specified for this filetype!', vim.log.levels.WARN)
            else
                require('FTerm').scratch({ cmd = run_cmd })
            end
        end, { bang = true })
    end,
    keys = {
        { '<A-t>', '<cmd>lua require("FTerm").toggle()<cr>', mode='n', desc='Toggle Terminal'},
        { '<A-t>', '<C-\\><C-n><cmd>lua require("FTerm").toggle()<cr>', mode='t', desc='Toggle Terminal'},
    },
    dependencies = {
        'rcarriga/nvim-notify',
    },
}
