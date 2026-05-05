return {
  -- Overseer is already added via LazyVim extra, but we enhance it here
  {
    "stevearc/overseer.nvim",
    optional = true,
    opts = {
      strategy = {
        "toggleterm",
        direction = "horizontal",
        autos_croll = true,
        quit_on_exit = "success",
      },
      templates = { "builtin" },
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
        bindings = {
          ["?"] = "ShowHelp",
          ["g?"] = "ShowHelp",
          ["<CR>"] = "RunAction",
          ["<C-e>"] = "Edit",
          ["o"] = "Open",
          ["<C-v>"] = "OpenVsplit",
          ["<C-s>"] = "OpenSplit",
          ["<C-f>"] = "OpenFloat",
          ["<C-q>"] = "OpenQuickFix",
          ["p"] = "TogglePreview",
          ["<C-l>"] = "IncreaseDetail",
          ["<C-h>"] = "DecreaseDetail",
          ["L"] = "IncreaseAllDetail",
          ["H"] = "DecreaseAllDetail",
          ["["] = "DecreaseWidth",
          ["]"] = "IncreaseWidth",
          ["{"] = "PrevTask",
          ["}"] = "NextTask",
          ["<C-k>"] = "ScrollOutputUp",
          ["<C-j>"] = "ScrollOutputDown",
          ["q"] = "Close",
        },
      },
      component_aliases = {
        default = {
          { "display_duration", detail_level = 2 },
          "on_output_summarize",
          "on_exit_set_status",
          "on_complete_notify",
          "on_complete_dispose",
        },
      },
    },
    keys = {
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle Overseer" },
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Quick action" },
      { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer info" },
      { "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Build task" },
      { "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
      { "<leader>oc", "<cmd>OverseerClearCache<cr>", desc = "Clear cache" },
    },
  },

  -- Custom Overseer task templates directory
  -- Create ~/.config/nvim/lua/overseer/template/user/ for custom tasks
  -- Example task structure will be provided separately
}
