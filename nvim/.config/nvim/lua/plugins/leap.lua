-- import leap plugin safely
local setup, leap = pcall(require, "leap")
if not setup then
	return
end

-- enable leap
leap.add_default_mappings()
