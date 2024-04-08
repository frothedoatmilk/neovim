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
          cmd = "haml-lint",
          args = { "-p" },
          stream = "stdout",
          ignore_exitcode = true,
          parser = require("lint.parser").from_pattern(pattern, groups, severity_map),
        },
      },
    },
  },
}
