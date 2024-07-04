local status, smooth = pcall(require, "smoothcursor")
if not status then
  return
end

smooth.setup({
  fancy = {
    enable = true,
  },
})
