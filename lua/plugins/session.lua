return {
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      auto_save = true,
      auto_restore = true,
      auto_create = true,
      suppressed_dirs = { "~/", "~/Downloads", "/" },
      use_git_branch = true,
    },
  },
}
