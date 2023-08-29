return {
	"sainnhe/gruvbox-material",
	version = "*",
	config = function ()
		vim.cmd [[ 
			" Important!!
			if has('termguicolors')
				set termguicolors
			endif

			" For dark version.
			set background=dark
			" Set contrast.
			" This configuration option should be placed before `colorscheme gruvbox-material`.
			" Available values: 'hard', 'medium'(default), 'soft'
			let g:gruvbox_material_background = 'hard'
			" For better performance
			let g:gruvbox_material_better_performance = 1
		]];
		vim.cmd.colorscheme 'gruvbox-material';

		local hl_groups = { 'DiagnosticUnderlineError', 'DiagnosticUnderlineWarn', 'DiagnosticUnderlineInfo', 'DiagnosticUnderlineHint'};
		for _, hl in ipairs(hl_groups) do
			vim.cmd.highlight(hl .. ' gui=underline');
		end;

		local c = require('lualine').get_config();
		c.theme =  'gruvbox-material';
		require('lualine').setup{
			options = c
		}
	end
}
