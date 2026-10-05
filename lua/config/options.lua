-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Python: basedpyright instead of pyright (lang.python extra)
vim.g.lazyvim_python_lsp = "basedpyright"

-- AI completions as inline ghost text accepted with <Tab>, not as a completion-menu source
vim.g.ai_cmp = false

-- docker_compose_language_service only attaches to this filetype
vim.filetype.add({
  pattern = {
    ["docker%-compose%.ya?ml"] = "yaml.docker-compose",
    ["compose%.ya?ml"] = "yaml.docker-compose",
  },
})

-- Jinja2 templates: highlight as the underlying file (x.yml.j2 -> yaml, nginx.conf.j2 -> conf),
-- falling back to the jinja treesitter parser when the base name says nothing
vim.filetype.add({
  extension = {
    j2 = function(path, bufnr)
      return vim.filetype.match({ filename = (path:gsub("%.j2$", "")), buf = bufnr }) or "jinja"
    end,
  },
})
