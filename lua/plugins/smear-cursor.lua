return {
  { "sphamba/smear-cursor.nvim", opts = {} },

  -- smear-cursor animates the cursor; keep mini.animate for scroll/resize/open/close
  { "nvim-mini/mini.animate", optional = true, opts = { cursor = { enable = false } } },
}
