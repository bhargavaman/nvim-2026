require("vim._core.ui2").enable({
  enable = true, -- Whether to enable or disable the UI.
  msg = { -- Options related to the message module.
    ---@type 'cmd'|'msg' Default message target
    targets = "cmd",
    msg = {
      timeout = 4000, -- Time a message is visible in the message window.
    },
  },
})
require("aman.set")
require("aman.remap")
require("aman.diagnostics")
require("aman.misc")
require("aman.lsp")
require("aman.terminal")
