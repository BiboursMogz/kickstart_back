-- Enables relative number
vim.opt.relativenumber = true;

-- Deactivate using the system clipboard for all yank/paste operations
vim.o.clipboard = "";

-- Configures Neovim to use delphi as default pascal language "flavor"
vim.cmd([[
	let pascal_delphi=1
	let pascal_one_line_string=1
	let pascal_symbol_operator=1
]]);

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

vim.o.cursorline = true;

vim.diagnostic.config({
  -- float = {},
  severity_sort = true,
  -- signs = true,
  -- underline = true,
  -- update_in_insert = false,
  virtual_text = false,
});

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true });

vim.keymap.set('n', '<C-d>', '<C-d>z.', {silent = true});
vim.keymap.set('n', '<C-u>', '<C-u>z.', {silent = true});
