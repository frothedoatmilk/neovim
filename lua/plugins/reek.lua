local pattern = "^%s*(.+):(%d+): (.*) %["
local groups = { "file", "lnum", "message" }

return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        ruby = { "reek" },
      },
      linters = {
        reek = {
          cmd = "reek",
          args = {
            "--single-line",
            "--no-color",
            "--force-exclusion",
            function()
              return vim.api.nvim_buf_get_name(0)
            end,
          },
          stdin = true,
          stream = "stdout",
          parser = require("lint.parser").from_pattern(pattern, groups, {}, { ["severity"] = vim.diagnostic.severity.WARN }),
          ignore_exitcode = true
        },
      },
    },
  },
}
