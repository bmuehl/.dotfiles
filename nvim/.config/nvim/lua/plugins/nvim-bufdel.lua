local setup, bufdel = pcall(require, "bufdel")
if not setup then
	return
end

bufdel.setup({
	next = "tabs",
	quit = true, -- quit Neovim when last buffer is closed
})
