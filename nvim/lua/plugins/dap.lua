return {
    {
        'mfussenegger/nvim-dap',
        opts = function()
            local dap = require('dap')
            dap.adapters.lldb = {
                type = 'executable',
                command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
                name = 'lldb',
            }
        end
    }
}
