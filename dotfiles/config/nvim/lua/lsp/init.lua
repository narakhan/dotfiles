local u = require("config")
local telescope = require('telescope')

local lsp = vim.lsp

local border_opts = { border = "single", focusable = false, scope = "line" }

vim.diagnostic.config({ virtual_text = false, float = border_opts })

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function()
    lsp.buf.formatting({
        filter = function(clients)
            return vim.tbl_filter(function(client)
                if client.name == "eslint" then
                    return true
                end
                if client.name == "null-ls" then
                    return not u.table.some(clients, function(_, other_client)
                        return other_client.name == "eslint"
                    end)
                end
            end, clients)
        end,
    })
end
local on_attach = function(client, bufnr)
    -- commands
    u.buf_command(bufnr, "LspHover", vim.lsp.buf.hover)
    u.buf_command(bufnr, "LspDiagPrev", vim.diagnostic.goto_prev)
    u.buf_command(bufnr, "LspDiagNext", vim.diagnostic.goto_next)
    u.buf_command(bufnr, "LspDiagLine", vim.diagnostic.open_float)
    u.buf_command(bufnr, "LspDiagQuickfix", vim.diagnostic.setqflist)
    u.buf_command(bufnr, "LspSignatureHelp", vim.lsp.buf.signature_help)
    u.buf_command(bufnr, "LspTypeDef", vim.lsp.buf.type_definition)
    u.buf_command(bufnr, "LspRangeAct", vim.lsp.buf.range_code_action)

    u.buf_command(bufnr, "LspDef", require('telescope.builtin').lsp_definitions)
    u.buf_command(bufnr, "LspRef", require('telescope.builtin').lsp_references)
    u.buf_command(bufnr, "LspSym", require('telescope.builtin').lsp_workspace_symbols)
    u.buf_command(bufnr, "LspImp", require('telescope.builtin').lsp_implementations)
    u.buf_command(bufnr, "LspAct", vim.lsp.buf.code_action)
    u.buf_command(bufnr, "LspFormat", lsp_formatting)
    -- not sure why this is necessary?
    -- u.buf_command(bufnr, "LspRename", function()
    --     vim.lsp.buf.rename()
    -- end)
    u.buf_command(bufnr, "LspRename", vim.lsp.buf.rename)

    -- Bindings
    u.buf_map(bufnr, "n", "K", ":LspHover<CR>")
    u.buf_map(bufnr, "n", "[e", ":LspDiagPrev<CR>")
    u.buf_map(bufnr, "n", "]e", ":LspDiagNext<CR>")
    u.buf_map(bufnr, "n", "ga", ":LspAct<CR>")
    u.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    u.buf_map(bufnr, "n", "gh", ":LspTypeDef<CR>")
    u.buf_map(bufnr, "n", "gr", ":LspRef<CR>")
    u.buf_map(bufnr, "n", "gs", ":LspSignatureHelp<CR>")
    u.buf_map(bufnr, "v", "ga", ":LspRangeAct<CR>")
    u.buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    u.buf_map(bufnr, "n", "<leader>f", ':LspFormat<CR>')
    u.buf_map(bufnr, "n", "<leader>r", ":LspRename<CR>")

    require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

for _, server in ipairs({
    "null-ls",
    "pyright",
}) do
    require("lsp." .. server).setup(on_attach, capabilities)
end
