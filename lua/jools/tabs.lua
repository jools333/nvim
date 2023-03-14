
local setup, bufferline = pcall(require, "bufferline")
if not setup then
	return
end

bufferline.setup{
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}}
    }
}
