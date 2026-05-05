return {
  -- diffview.nvim - Better diff viewing
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        use_icons = true,
        signs = {
          fold_closed = "",
          fold_open = "",
          done = "✓",
        },
        view = {
          default = {
            layout = "diff2_horizontal",
          },
          merge_tool = {
            layout = "diff3_horizontal",
            disable_diagnostics = true,
          },
          file_history = {
            layout = "diff2_horizontal",
          },
        },
        file_panel = {
          listing_style = "tree",
          tree_options = {
            flatten_dirs = true,
            folder_statuses = "only_folded",
          },
          win_config = {
            position = "left",
            width = 35,
          },
        },
        file_history_panel = {
          log_options = {
            git = {
              single_file = {
                diff_merges = "combined",
              },
              multi_file = {
                diff_merges = "first-parent",
              },
            },
          },
          win_config = {
            position = "bottom",
            height = 16,
          },
        },
        commit_log_panel = {
          win_config = {},
        },
        default_args = {
          DiffviewOpen = {},
          DiffviewFileHistory = {},
        },
        hooks = {},
        keymaps = {
          disable_defaults = false,
          view = {
            {
              "n",
              "<tab>",
              require("diffview.actions").select_next_entry,
              { desc = "Open the diff for the next file" },
            },
            {
              "n",
              "<s-tab>",
              require("diffview.actions").select_prev_entry,
              { desc = "Open the diff for the previous file" },
            },
            { "n", "gf", require("diffview.actions").goto_file, { desc = "Open the file in a new split" } },
            {
              "n",
              "<C-w><C-f>",
              require("diffview.actions").goto_file_split,
              { desc = "Open the file in a new split" },
            },
            { "n", "<C-w>gf", require("diffview.actions").goto_file_tab, { desc = "Open the file in a new tabpage" } },
            { "n", "e", require("diffview.actions").focus_files, { desc = "Bring focus to the file panel" } },
            { "n", "b", require("diffview.actions").toggle_files, { desc = "Toggle the file panel" } },
          },
          file_panel = {
            { "n", "j", require("diffview.actions").next_entry, { desc = "Bring the cursor to the next file entry" } },
            {
              "n",
              "<down>",
              require("diffview.actions").next_entry,
              { desc = "Bring the cursor to the next file entry" },
            },
            {
              "n",
              "k",
              require("diffview.actions").prev_entry,
              { desc = "Bring the cursor to the previous file entry." },
            },
            {
              "n",
              "<up>",
              require("diffview.actions").prev_entry,
              { desc = "Bring the cursor to the previous file entry." },
            },
            {
              "n",
              "<cr>",
              require("diffview.actions").select_entry,
              { desc = "Open the diff for the selected entry." },
            },
            { "n", "o", require("diffview.actions").select_entry, { desc = "Open the diff for the selected entry." } },
            {
              "n",
              "<2-LeftMouse>",
              require("diffview.actions").select_entry,
              { desc = "Open the diff for the selected entry." },
            },
            {
              "n",
              "-",
              require("diffview.actions").toggle_stage_entry,
              { desc = "Stage / unstage the selected entry." },
            },
            { "n", "S", require("diffview.actions").stage_all, { desc = "Stage all entries." } },
            { "n", "U", require("diffview.actions").unstage_all, { desc = "Unstage all entries." } },
            {
              "n",
              "X",
              require("diffview.actions").restore_entry,
              { desc = "Restore entry to the state on the left side." },
            },
            {
              "n",
              "R",
              require("diffview.actions").refresh_files,
              { desc = "Update stats and entries in the file list." },
            },
            {
              "n",
              "<tab>",
              require("diffview.actions").select_next_entry,
              { desc = "Open the diff for the next file" },
            },
            {
              "n",
              "<s-tab>",
              require("diffview.actions").select_prev_entry,
              { desc = "Open the diff for the previous file" },
            },
            { "n", "gf", require("diffview.actions").goto_file, { desc = "Open the file in a new split" } },
            {
              "n",
              "<C-w><C-f>",
              require("diffview.actions").goto_file_split,
              { desc = "Open the file in a new split" },
            },
            { "n", "<C-w>gf", require("diffview.actions").goto_file_tab, { desc = "Open the file in a new tabpage" } },
            {
              "n",
              "i",
              require("diffview.actions").listing_style,
              { desc = "Toggle between 'list' and 'tree' views" },
            },
            {
              "n",
              "f",
              require("diffview.actions").toggle_flatten_dirs,
              { desc = "Flatten empty subdirectories in tree listing style." },
            },
            { "n", "e", require("diffview.actions").focus_files, { desc = "Bring focus to the file panel" } },
            { "n", "b", require("diffview.actions").toggle_files, { desc = "Toggle the file panel" } },
          },
          file_history_panel = {
            { "n", "g!", require("diffview.actions").options, { desc = "Open the option panel" } },
            {
              "n",
              "<C-A-d>",
              require("diffview.actions").open_in_diffview,
              { desc = "Open the entry under the cursor in a diffview" },
            },
            {
              "n",
              "y",
              require("diffview.actions").copy_hash,
              { desc = "Copy the commit hash of the entry under the cursor" },
            },
            { "n", "L", require("diffview.actions").open_commit_log, { desc = "Show commit details" } },
            { "n", "zR", require("diffview.actions").open_all_folds, { desc = "Expand all folds" } },
            { "n", "zM", require("diffview.actions").close_all_folds, { desc = "Collapse all folds" } },
            { "n", "j", require("diffview.actions").next_entry, { desc = "Bring the cursor to the next file entry" } },
            {
              "n",
              "<down>",
              require("diffview.actions").next_entry,
              { desc = "Bring the cursor to the next file entry" },
            },
            {
              "n",
              "k",
              require("diffview.actions").prev_entry,
              { desc = "Bring the cursor to the previous file entry." },
            },
            {
              "n",
              "<up>",
              require("diffview.actions").prev_entry,
              { desc = "Bring the cursor to the previous file entry." },
            },
            {
              "n",
              "<cr>",
              require("diffview.actions").select_entry,
              { desc = "Open the diff for the selected entry." },
            },
            { "n", "o", require("diffview.actions").select_entry, { desc = "Open the diff for the selected entry." } },
            {
              "n",
              "<2-LeftMouse>",
              require("diffview.actions").select_entry,
              { desc = "Open the diff for the selected entry." },
            },
            {
              "n",
              "<tab>",
              require("diffview.actions").select_next_entry,
              { desc = "Open the diff for the next file" },
            },
            {
              "n",
              "<s-tab>",
              require("diffview.actions").select_prev_entry,
              { desc = "Open the diff for the previous file" },
            },
            { "n", "gf", require("diffview.actions").goto_file, { desc = "Open the file in a new split" } },
            {
              "n",
              "<C-w><C-f>",
              require("diffview.actions").goto_file_split,
              { desc = "Open the file in a new split" },
            },
            { "n", "<C-w>gf", require("diffview.actions").goto_file_tab, { desc = "Open the file in a new tabpage" } },
            { "n", "e", require("diffview.actions").focus_files, { desc = "Bring focus to the file panel" } },
            { "n", "b", require("diffview.actions").toggle_files, { desc = "Toggle the file panel" } },
          },
          option_panel = {
            { "n", "<tab>", require("diffview.actions").select_entry, { desc = "Change the current option" } },
            { "n", "q", require("diffview.actions").close, { desc = "Close the panel" } },
          },
        },
      })
    end,
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
      { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    },
  },
}
