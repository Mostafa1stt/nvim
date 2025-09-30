-- LSP Zero v3+ Setup
local lsp_zero = require('lsp-zero')

-- Optional: Preset recommended settings
lsp_zero.extend_lspconfig()

-- Mason & Mason-LSPConfig Setup
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'ocamllsp' },
  handlers = {
    lsp_zero.default_setup,
  },
})

-- Custom on_attach function with keymaps
local function attach_keymaps(bufnr)
  local opts = { buffer = bufnr }
  local map = vim.keymap.set

  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  map("n", "<leader>vd", vim.diagnostic.open_float, opts)
  map("n", "[d", vim.diagnostic.goto_next, opts)
  map("n", "]d", vim.diagnostic.goto_prev, opts)
  map("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  map("n", "<leader>vrr", vim.lsp.buf.references, opts)
  map("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

-- Attach keymaps once, via lsp_zero
lsp_zero.on_attach(function(client, bufnr)
  attach_keymaps(bufnr)
end)

-- Preferences
lsp_zero.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  }
})

-- Lua language server custom config
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

-- OCaml LSP config
vim.lsp.config("ocamllsp", {})

-- Enable servers explicitly
vim.lsp.enable({ "lua_ls", "ocamllsp" })

-- nvim-cmp setup (completion)
local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }
})

