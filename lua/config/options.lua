-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Python: basedpyright instead of pyright (lang.python extra)
vim.g.lazyvim_python_lsp = "basedpyright"

-- docker_compose_language_service only attaches to this filetype
vim.filetype.add({
  pattern = {
    ["docker%-compose%.ya?ml"] = "yaml.docker-compose",
    ["compose%.ya?ml"] = "yaml.docker-compose",
  },
})
