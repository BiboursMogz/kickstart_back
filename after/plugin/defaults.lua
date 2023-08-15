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

