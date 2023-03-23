
local setup, bufferline = pcall(require, "bufferline")
if not setup then
	return
end

bufferline.setup{
    options = {
        offsets = {
            {filetype = "NvimTree", text = "", padding = 1},
            {filetype = "Outline", text = "", padding = 1},
            {filetype = "aerial", text = "", padding = 1},
        }
    }
}
