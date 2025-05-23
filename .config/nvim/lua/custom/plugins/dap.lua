-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
    -- NOTE: Yes, you can install new plugins here!
    "mfussenegger/nvim-dap",
    -- NOTE: And you can specify dependencies as well
    dependencies = {
        -- Creates a beautiful debugger UI
        "rcarriga/nvim-dap-ui",
        
        -- virutaltext ability
        -- "theHamsta/nvim-dap-virtual-text",
        -- dependency for ncim-dap-ui
        "nvim-neotest/nvim-nio",

        -- Installs the debug adapters for you
        "williamboman/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",

        -- Add your own debuggers here
        -- "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("dapui").setup()
        -- require("dap-go").setup()
        
        -- require("nvim-dap-virtual-text").setup()

        require("mason-nvim-dap").setup({
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_setup = true,
            automatic_installation = true,


            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {
                -- netcoredbg is manually installed because it is not working in
                -- mason. This section is not needed and mason-nvim-dap 
                -- coreclr = function(config)
                --  config.adapters = {
                --      type = "executable",
                --      command = "/usr/bin/python3",
                --      args = {
                --          "-m",
                --          "debugpy.adapter",
                --      },
                --  }
                --  require('mason-nvim-dap').default_setup(config) -- don't forget this!
                -- end,
            },
            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
                -- "delve",
                "codelldb",
                "debugpy",
                "coreclr",

            },

        })

        -- Basic debugging keymaps, feel free to change to your liking!
        vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
        vim.keymap.set("n", "<F6>", dap.terminate, { desc = "Debug: Terminate" })
        vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
        vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
        vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>B", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Debug: Set Breakpoint" })

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        -- dapui.setup({ -- Set icons to characters that are more likely to work in every terminal.
        --  --    Feel free to remove or use ones that you like more! :)
        --  --    Don't feel like these are good choices.
        --  icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
        --  controls = {
        --      icons = {
        --          pause = "⏸",
        --          play = "▶",
        --          step_into = "⏎",
        --          step_over = "⏭",
        --          step_out = "⏮",
        --          step_back = "b",
        --          run_last = "▶▶",
        --          terminate = "⏹",
        --          disconnect = "⏏",
        --      },
        --  },
        -- })


        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

        -- dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        -- dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        -- dap.listeners.before.event_exited["dapui_config"] = dapui.close

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Install golang specific config
        -- require("dap-go").setup()
        dap.configurations.python = {
            {
                args = function() return vim.split(vim.fn.input("args> "), " ") end,
                type = 'python';
                request = 'launch';
                name = "Launch file";
                program = "${file}";
                pythonPath = function()
                    return '/usr/bin/python'
                end;
            },
        }

        -- dap.adapters.rust_ls_dubugger = {
        --  type = "executable",
        --  command = "/usr/bin/lldb-vscode", -- adjust as needed
        --  name = "lldb",
        -- }
        --
        -- dap.configurations.rust = {
        --  {
        --      type = "rust",
        --      request = "launch",
        --      program = function()
        --          return vim.fn.getcwd() .. "/target/debug/hello-world"
        --      end,
        --      cwd = "${workspaceFolder}",
        --      stopOnEntry = false,
        --  },
        -- }
    end,
}
