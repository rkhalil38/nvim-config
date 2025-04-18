require("romuluskhalil.config.lazy")
require("romuluskhalil.config.remap")
require("romuluskhalil.config.set")

function StatusWordCount()
    local wc = vim.fn.wordcount()
    if vim.fn.mode() == 'v' or vim.fn.mode() == 'V' or vim.fn.mode() == 'CTRL-V' then
	return wc["visual_words"] or 0
    else
	return wc["words"]
    end
end
