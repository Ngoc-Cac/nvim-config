local templates = {
  vanilla = "$XDG_CONFIG_HOME/nvim/templates/tex/vanilla/",
}

local function copy_tex_template(doctype, dest)
  if not templates[doctype] then return end

  local source = vim.fn.expand(templates[doctype])
  if vim.fn.isdirectory(source) == 1 then
    source = source .. "/*"
  end

  return vim.system({ "cp", "-r", source, dest }):wait()
end

local function tex_create(opts)
  local args = opts.fargs

  if #args ~= 2 then
    vim.notify(
      "Command needs exactly 2 arguments!",
      vim.log.levels.ERROR,
      { title = "Missing Arguments!", timeout = 1000 }
    )
    return
  elseif not vim.fn.isdirectory(args[2]) then
    vim.notify(
      string.format("'%s' is not a directory", args[2]),
      vim.log.levels.ERROR,
      { title = "Destination Is Not Directory!", timeout = 2000 }
    )
    return
  end

  local ret = copy_tex_template(args[1], args[2])

  if ret and ret.code ~= 0 then
    vim.notify(
      string.format(
        "Unable to create template %s! Please make sure the "
        .. "destination directory '%s' exists.\n%s",
        args[1], args[2], ret.stderr
      ),
      vim.log.levels.ERROR,
      { title = "Could not create template!", timeout = 2000 }
    )
  else
    vim.notify(
      string.format("Created '%s' template at %s.", args[1], args[2]),
      vim.log.levels.INFO,
      { title = "Template Created Successfully!", timeout = 1000}
    )
  end
end

vim.api.nvim_create_user_command(
  "TexCreate",
  tex_create,
  {
    nargs = "+",
    desc  = "Create a new TeX project from a template",
    complete = function(arglead, cmdline, _)
      local args = vim.split(cmdline, "%s+")

      if #args == 2 then
        return vim.tbl_filter(
          function(k) return k:find(arglead, 1, true) end,
          vim.tbl_keys(templates)
        )
      elseif #args == 3 then
        return vim.fn.getcompletion(arglead, "dir")
      end
    end,
  }
)

return { setup = function() end }
