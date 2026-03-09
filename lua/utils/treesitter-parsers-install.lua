local parsers = {
  "bash",
  "c",
  "comment",  -- TODO, NOTE, WARN, WARNING, BUG, FIXME, ERROR
  "css",
  "dockerfile",
  "ecma",  -- js, tsx stuff
  "gitignore",
  "html",
  "html_tags",
  "javascript",
  "json",
  "jsx",
  "latex",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "readline",  -- inputrc and stuff
  "requirements",  -- requirements.txt files
  "toml",
  "vim",
  "yaml",
}

vim.cmd("TSInstall " .. table.concat(parsers, " "))
