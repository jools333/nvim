-- local setup, outline = pcall(require, "symbols-outline")
-- if not setup then
--   return
-- end
--
-- outline.setup({
--     position = "left",
--     width = 15,
--     highlight_hovered_item = true,
--     auto_preview = true,
-- })
--
--
-- local function open_symbols_tree(data)
--     vim.defer_fn(function()
--         require("symbols-outline").open_outline()
--     end, 500)
-- end
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_symbols_tree })

local setup, outline = pcall(require, "aerial")
if not setup then
  return
end

outline.setup({
    layout = {
        max_width = { 50 },
        width = nil,
        min_width = 50,
        default_direction = "left",
        placement = "global",
        preserve_equality = false,
    },
    open_automatic = true,
    attach_mode = "global",
})
