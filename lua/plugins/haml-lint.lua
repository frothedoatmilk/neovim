local pattern = "(.+):(%d+) %[(%a)%] (.+)"
local groups = { "file", "lnum", "severity", "message" }
local severity_map = {
  ["E"] = vim.diagnostic.severity.ERROR,
  ["W"] = vim.diagnostic.severity.WARN,
}

return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        haml = { "hamllint" },
      },
      linters = {
        hamllint = {
          cmd = "bundle",
          args = {
            "exec",
            "--",
            "haml-lint",
            "--parallel",
            "--stdin",
            function()
              return vim.api.nvim_buf_get_name(0)
            end,
          },
          stdin = true,
          stream = "stdout",
          ignore_exitcode = true,
          parser = require("lint.parser").from_pattern(pattern, groups, severity_map),
        },
      },
    },
  },
}
