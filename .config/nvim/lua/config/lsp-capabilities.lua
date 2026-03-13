local M = {}

function M.get()
	local ok, blink = pcall(require, "blink.cmp")
	print("ok", ok)
	print("blink", blink)
	if ok then
		return blink.get_lsp_capabilities()
	end
	return vim.lsp.protocol.make_client_capabilities()
end

return M
