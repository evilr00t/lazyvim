return {
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<Tab>", neocodeium.accept, { desc = "Accept suggestion" })
      vim.keymap.set("i", "<M-]>", neocodeium.cycle_or_complete, { desc = "Next suggestion" })
      vim.keymap.set("i", "<M-[>", function()
        neocodeium.cycle_or_complete(-1)
      end, { desc = "Previous suggestion" })
      vim.keymap.set("i", "<C-]>", neocodeium.clear, { desc = "Dismiss suggestion" })
    end,
  },
}
