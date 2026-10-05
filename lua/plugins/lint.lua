return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        yaml = { "actionlint" },
      },
      linters = {
        actionlint = {
          condition = function(ctx)
            return ctx.filename:find("/%.github/workflows/") ~= nil
          end,
        },
      },
    },
  },
}
