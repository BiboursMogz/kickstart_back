local lspconfig = require('lspconfig');
local configs = require('lspconfig.configs');

-- Check if the config is already defined (useful when reloading this file)
if not configs.delphi_lsp then
	configs.delphi_lsp = {
		default_config = {
			cmd = {'C:\\Program Files (x86)\\Embarcadero\\Studio\\21.0\\bin\\DelphiLSP.exe'},
			filetypes = {'pascal'},
			root_dir = lspconfig.util.root_pattern('*.delphilsp.json'),
			init_options = {
				serverType = "controller",
				agentCount = 2,
				returnDccFlags = true,
				returnHoverModel = false,
				storeProjectSettings = false,
				enableFileWatcher = true,
			},
		},
	}
end;

lspconfig.delphi_lsp.setup{
	settings = {
		settingsFile = 'file:///C:/Users/Bibours/Documents/codes/delphi/AutoFicheTemps/AutoFicheTemps.delphilsp.json',
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

return {};
