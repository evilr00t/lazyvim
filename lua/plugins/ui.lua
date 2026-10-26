---@diagnostic disable: undefined-global

local colors = {
  bg = "#16161e",
  fg = "#c0caf5",
  muted = "#737aa2",
  blue = "#7aa2f7",
  cyan = "#7dcfff",
  green = "#9ece6a",
  magenta = "#bb9af7",
  orange = "#ff9e64",
  red = "#f7768e",
}

local mode_colors = {
  n = colors.blue,
  i = colors.green,
  v = colors.magenta,
  V = colors.magenta,
  ["\22"] = colors.magenta,
  s = colors.magenta,
  S = colors.magenta,
  ["\19"] = colors.magenta,
  c = colors.orange,
  R = colors.red,
  r = colors.cyan,
  t = colors.cyan,
}

local function current_lsp()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    return ""
  end

  local names = {}
  for _, client in ipairs(clients) do
    names[#names + 1] = client.name
  end
  return " LSP: " .. table.concat(names, ", ")
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.theme = {
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.muted, bg = colors.bg } },
      }
      opts.options.component_separators = ""
      opts.options.section_separators = ""

      opts.sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            function()
              return "▊"
            end,
            color = { fg = colors.red },
            padding = { left = 0, right = 1 },
          },
          {
            "mode",
            fmt = function(mode)
              return " " .. mode
            end,
            color = function()
              local mode = vim.fn.mode():sub(1, 1)
              return { fg = colors.bg, bg = mode_colors[mode] or colors.blue, gui = "bold" }
            end,
            padding = { left = 1, right = 1 },
          },
          {
            "filesize",
            cond = function()
              return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            color = { fg = colors.cyan },
            padding = { left = 0, right = 1 },
          },
          {
            "filetype",
            icon_only = true,
            separator = "",
            cond = function()
              return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            color = { fg = colors.blue },
            padding = { left = 0, right = 0 },
          },
          {
            "filename",
            cond = function()
              return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            color = { fg = colors.magenta, gui = "bold" },
            padding = { left = 0, right = 1 },
          },
          { "location", color = { fg = colors.fg }, padding = { left = 0, right = 1 } },
          { "progress", color = { fg = colors.fg, gui = "bold" }, padding = { left = 0, right = 1 } },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
            diagnostics_color = {
              error = { fg = colors.red },
              warn = { fg = colors.orange },
              info = { fg = colors.cyan },
              hint = { fg = colors.blue },
            },
          },
          { function() return "%=" end },
          {
            current_lsp,
            cond = function()
              return #vim.lsp.get_clients({ bufnr = 0 }) > 0
            end,
            color = { fg = colors.cyan, gui = "bold" },
          },
        },
        lualine_x = {
          {
            "o:encoding",
            fmt = string.upper,
            cond = function()
              return vim.fn.winwidth(0) > 80
            end,
            color = { fg = colors.green, gui = "bold" },
            padding = { left = 1, right = 1 },
          },
          {
            "fileformat",
            fmt = string.upper,
            icons_enabled = false,
            color = { fg = colors.green, gui = "bold" },
            padding = { left = 0, right = 1 },
          },
          { "branch", icon = "", color = { fg = colors.magenta, gui = "bold" }, padding = { left = 0, right = 1 } },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            cond = function()
              local status = vim.b.gitsigns_status_dict
              return status ~= nil
                and ((status.added or 0) > 0 or (status.changed or 0) > 0 or (status.removed or 0) > 0)
            end,
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.orange },
              removed = { fg = colors.red },
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
            padding = { left = 0, right = 1 },
          },
          {
            function()
              return "▊"
            end,
            color = { fg = colors.blue },
            padding = { left = 0, right = 0 },
          },
        },
        lualine_y = {},
        lualine_z = {},
      }
      opts.inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", color = { fg = colors.muted } } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.highlights = vim.tbl_deep_extend("force", opts.highlights or {}, {
        buffer_selected = { fg = "#e0af68", bg = "#283457", bold = true },
        modified_selected = { fg = "#9ece6a", bg = "#283457" },
        error_diagnostic_selected = { fg = "#f7768e", bg = "#283457", bold = true },
        warning_diagnostic_selected = { fg = "#ff9e64", bg = "#283457", bold = true },
        info_diagnostic_selected = { fg = "#7aa2f7", bg = "#283457", bold = true },
        hint_diagnostic_selected = { fg = "#7dcfff", bg = "#283457", bold = true },
      })
    end,
  },
}
