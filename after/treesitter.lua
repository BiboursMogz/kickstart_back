local treesitter_config = require'nvim-treesitter.configs';

local function tblToSet(aTbl)
  local set = {};

  for _, value in ipairs(aTbl) do
    set[value] = true;
  end
  return set;
end;

local function my_ensure(old_ensure)
  if type(old_ensure) == "string" then
    old_ensure = { old_ensure }
  end
  if not tblToSet(old_ensure)["pascal"] then
    local new_ensure = table.concat(old_ensure, 'pascal');
    return new_ensure;
  else
    return old_ensure;
  end;
end;

treesitter_config.setup {
  -- ensure_installed = treesitter_config.get_ensure_installed_parsers() + 'pascal',
  ensure_installed = my_ensure(treesitter_config.get_ensure_installed_parsers()),
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
};
