return {
  -- Keep mini.animate for scroll/resize/open/close, but leave cursor motion unanimated.
  { "nvim-mini/mini.animate", optional = true, opts = { cursor = { enable = false } } },
}
