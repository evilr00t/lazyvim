return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        yaml = { "actionlint" },
      },
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint-cli2.jsonc", "-" },
        },
        actionlint = {
          condition = function(ctx)
            return ctx.filename:find("/%.github/workflows/") ~= nil
          end,
        },
      },
    },
  },
}
