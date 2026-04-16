vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-dap", version = "b516f20b487b0ac6a281e376dfac1d16b5040041" },
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
})

local _dap_initialized = false

local function init_dap()
  if _dap_initialized then
    return
  end

  _dap_initialized = true

  local dap = require("dap")
  local dapui = require("dapui")

  local js_debug_path =
    vim.fn.expand("$HOME/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js")
  dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = { js_debug_path, "${port}" },
    },
  }
  -- alias node to pwa-node
  dap.adapters["node"] = function(cb, config)
    if config.type == "node" then
      config.type = "pwa-node"
    end
    local a = dap.adapters["pwa-node"]
    if type(a) == "function" then
      a(cb, config)
    else
      cb(a)
    end
  end

  -- Disable default nvim-dap behavior of automatically loading .vscode/launch.json
  dap.providers.configs["dap.launch.json"] = function()
    return {}
  end

  -- JS/TS configurations based on user's launch.json
  local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
  for _, ft in ipairs(js_filetypes) do
    dap.configurations[ft] = {
      -- Launch node app option
      {
        type = "pwa-node",
        request = "launch",
        name = "Nvim Debug App",
        program = "${file}",
        cwd = vim.fn.getcwd(),
      },
      -- Or attach to running node app (below)
      -- pnpm run debug
      -- debug: node --inspect=9229
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach to Running Node App",
        port = 9229,
        address = "localhost",
        localRoot = vim.fn.getcwd(),
        remoteRoot = "/usr/src/app",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "Nvim Mocha Tests",
        program = vim.fn.getcwd() .. "/node_modules/mocha/bin/_mocha",
        args = {
          "--require",
          "ts-node/register/transpile-only",
          "--require",
          "source-map-support/register",
          "--reporter",
          "spec",
          "--colors",
          vim.fn.getcwd() .. "/tests/unit/**/*.[tj]s",
        },
        internalConsoleOptions = "openOnSessionStart",
        skipFiles = { "<node_internals>/**" },
        sourceMaps = true,
        protocol = "inspector",
        cwd = vim.fn.getcwd(),
      },
    }
  end

  -- DAP UI setup
  dapui.setup({
    icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
    controls = {
      icons = {
        pause = "⏸",
        play = "▶",
        step_into = "⏎",
        step_over = "⏭",
        step_out = "⏮",
        step_back = "b",
        run_last = "▶▶",
        terminate = "⏹",
        disconnect = "⏏",
      },
    },
  })

  -- -- Auto-open/close UI
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
  end
  dap.listeners.before.disconnect["dapui_config"] = function()
    dapui.close({})
  end

  -- -- Virtual text
  require("nvim-dap-virtual-text").setup()
end

-- stylua: ignore start
vim.keymap.set("n", "<leader>DB", function() init_dap(); require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>DA", function() init_dap(); require("dap").list_breakpoints(); vim.cmd("copen") end, { desc = "List Breakpoints" })
vim.keymap.set("n", "<leader>DC", function() init_dap(); require("dap").continue() end, { desc = "Run/Continue" })
vim.keymap.set("n", "<leader>DG", function() init_dap(); require("dap").goto_() end, { desc = "Go to Line (No Execute)" })
vim.keymap.set("n", "<leader>DI", function() init_dap(); require("dap").step_into() end, { desc = "Step Into" })
vim.keymap.set("n", "<leader>DJ", function() init_dap(); require("dap").down() end, { desc = "Down" })
vim.keymap.set("n", "<leader>DK", function() init_dap(); require("dap").up() end, { desc = "Up" })
vim.keymap.set("n", "<leader>DL", function() init_dap(); require("dap").run_last() end, { desc = "Run Last" })
vim.keymap.set("n", "<leader>DO", function() init_dap(); require("dap").step_out() end, { desc = "Step Out" })
vim.keymap.set("n", "<leader>DP", function() init_dap(); require("dap").pause() end, { desc = "Pause" })
vim.keymap.set("n", "<leader>DR", function() init_dap(); require("dap").repl.toggle() end, { desc = "Toggle REPL" })
vim.keymap.set("n", "<leader>DS", function() init_dap(); require("dap").session() end, { desc = "Session" })
vim.keymap.set("n", "<leader>DT", function()
	init_dap();
	require("dap").terminate()
	vim.defer_fn(function()
		require("dapui").close({})
	end, 100)
end, { desc = "Terminate" })
vim.keymap.set("n", "<leader>DW", function() init_dap(); require("dap.ui.widgets").hover() end, { desc = "DAP Widgets" })
vim.keymap.set("n","<leader>DU", function() init_dap(); require("dapui").toggle({}) end, {desc = "Dap UI"})
