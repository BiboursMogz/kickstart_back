local lspconfig = require('lspconfig');
local configs = require('lspconfig.configs');
local util = require('lspconfig.util');

vim.wo.colorcolumn = "120";

-- Check if the config is already defined (useful when reloading this file)
if not configs.delphi_lsp then
	configs.delphi_lsp = {
		default_config = {
			cmd = {'C:\\Program Files (x86)\\Embarcadero\\Studio\\21.0\\bin\\DelphiLSP.exe'},
		filetypes = {'pascal'},
			root_dir = util.root_pattern('*.delphilsp.json'),
			init_options = {
				-- From: https://docwiki.embarcadero.com/RADStudio/Alexandria/en/Using_DelphiLSP_Code_Insight_with_Other_Editors
				serverType = "controller",
				agentCount = 2,
				returnDccFlags = false,
				returnHoverModel = false,
				storeProjectSettings = false,
				enableFileWatcher = true,
			},
		},
	};
end;

local function find_delphi_lsp_settingfile()
	local a = util.root_pattern('*.delphilsp.json');
	local b = a(util.path.sanitize(vim.loop.cwd()))
	if b == nil then
		return '';
	end;
	local c = vim.split(vim.fn.glob(b .. '/*'), '\n')
	for _, d in pairs(c) do
		if string.find(d, 'delphilsp') then
			return 'file:///' .. util.path.sanitize(d)
		end;
	end;
	return '';
end;

lspconfig.delphi_lsp.setup{
	settings = {
		settingsFile = find_delphi_lsp_settingfile(),
	},
	capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(_, bufnr)
		local nmap = function(keys, func, desc)
			if desc then desc = 'LSP: ' .. desc end
			vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
		end

		nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
		nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

		-- See `:help K` for why this keymap
		nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

		-- Lesser used LSP functionality
		nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	end,
}

