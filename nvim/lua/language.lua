local tab2 = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = { "*" },
    callback = function(args)
        local ft = vim.bo[args.buf].filetype

        if ft == 'typescript' or ft == 'typescriptreact' then
            tab2()
        elseif ft == 'javascript'or ft == 'javascriptreact' then
            tab2()
        elseif ft == 'json' then
            tab2()
        elseif ft == 'cpp' or ft == 'c' then
            tab2()
        elseif ft == 'zig' then
            vim.keymap.set('n', '<leader>s', ':w!<CR>')
        end
    end
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' },
    { pattern = { '*.vert', '*.frag' }, command = 'set filetype=glsl' })

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' },
    { pattern = { '*.wgsl' }, command = 'set filetype=wgsl' })
