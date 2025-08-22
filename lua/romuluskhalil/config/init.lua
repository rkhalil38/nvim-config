require("romuluskhalil.config.lazy")
require("romuluskhalil.config.remap")
require("romuluskhalil.config.set")

-- set scroll off to 5
vim.opt.scrolloff = 5

-- required by obsidian.nvim
vim.opt.conceallevel = 1

function StatusWordCount()
    local wc = vim.fn.wordcount()
    if vim.fn.mode() == 'v' or vim.fn.mode() == 'V' or vim.fn.mode() == 'CTRL-V' then
	return wc["visual_words"] or 0
    else
	return wc["words"]
    end
end
