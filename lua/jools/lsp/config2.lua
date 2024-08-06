local lsp = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = ' ',
        warn = ' ',
        hint = 'ﴞ ',
        info = ' '
    }
})

local on_attach = function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "ga", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vw", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  -- vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>va", "<cmd>LspUI code_action<CR>", opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>vr", ":LspUI rename<CR>", opts)
  vim.keymap.set("n", "<leader>vf", ":LspZeroFormat<CR>", opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

lsp.on_attach(on_attach)

lsp.nvim_workspace()
lsp.setup()


local lspconfig = require('lspconfig')
lspconfig.jedi_language_server.setup{}
-- lspconfig.clangd.setup{
--     on_attach = function(client, bufnr)
--         client.server_capabilities.signatureHelpProvider = false
--     end,
--      cmd = {
--          "clangd",
--          "--background-index",
--          "-j=12",
--          "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
--          "--clang-tidy",
--          "--clang-tidy-checks=*",
--          "--all-scopes-completion",
--          "--cross-file-rename",
--          "--completion-style=detailed",
--          "--header-insertion-decorators",
--          "--header-insertion=iwyu",
--          "--pch-storage=memory",
--        }
-- }

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
lspconfig['clangd'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "h", "c", "cpp", "cc", "objc", "objcpp"},
    flags = lsp_flags,
    cmd = {"clangd", "--background-index"},
    single_file_support = true,
    root_dir = lspconfig.util.root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
        )
})
