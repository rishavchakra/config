local tab2 = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
end

local ft_config = {
    typescript = tab2,
    typescriptreact = tab2,
    javascript = tab2,
    javascriptreact = tab2,
    json = tab2,
}

vim.api.nvim_create_autocmd('FileType', {
    pattern = { "*" },
    callback = function(args)
        local ft = vim.bo[args.buf].filetype

        if ft == 'typescript' then
            tab2()
        elseif ft == 'typescriptreact' then
            tab2()
        elseif ft == 'javascript' then
            tab2()
        elseif ft == 'javascriptreact' then
            tab2()
        elseif ft == 'json' then
            tab2()
        elseif ft == 'cpp' then
            tab2()
        elseif ft == 'c' then
            tab2()
        end
    end
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' },
    { pattern = { '*.vert', '*.frag' }, command = 'set filetype=glsl'
    })

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' },
    { pattern = { '*.wgsl' }, command = 'set filetype=wgsl'
    })
