---@diagnostic disable: undefined-global

local flamaster_accents = {
  DiagnosticSignError = { fg = "#f7768e", bold = true },
  DiagnosticSignWarn = { fg = "#ff9e64", bold = true },
  DiagnosticSignInfo = { fg = "#7aa2f7", bold = true },
  DiagnosticSignHint = { fg = "#7dcfff", bold = true },
  GitSignsAdd = { fg = "#9ece6a" },
  GitSignsChange = { fg = "#7aa2f7" },
  GitSignsDelete = { fg = "#f7768e" },
}

local function apply_flamaster_accents()
  if vim.g.colors_name ~= "flamaster" then
    return
  end

  for group, highlight in pairs(flamaster_accents) do
    vim.api.nvim_set_hl(0, group, highlight)
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.schedule(apply_flamaster_accents)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = apply_flamaster_accents,
})

apply_flamaster_accents()
