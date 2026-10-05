return {
  -- Overseer v2 comes from the editor.overseer extra:
  -- <leader>ow task list, <leader>oo run task (extra's <leader>ot is remapped below)
  {
    "stevearc/overseer.nvim",
    optional = true,
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
      },
    },
    keys = {
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle Overseer" },
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
      { "<leader>os", "<cmd>OverseerShell<cr>", desc = "Run shell command" },
    },
  },

  -- Custom Overseer task templates directory
  -- Create ~/.config/nvim/lua/overseer/template/user/ for custom tasks
}
