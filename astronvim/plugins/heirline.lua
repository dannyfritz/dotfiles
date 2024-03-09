return {
	"rebelot/heirline.nvim",
	opts = function(_, opts)
		local status = require("astronvim.utils.status")
		opts.tabline[2] = status.heirline.make_buflist({
			{
				provider = " ",
				hl = { fg = "buffer_bg", bg = "buffer_visible_bg" },
			},
			status.component.tabline_file_info({
				hl = function(self)
					local name = string.match(vim.g.colors_name, "astro")
					local fg = name and "buffer_fg"
					if self.is_visible then
						return { bg = "buffer_bg", bold = true }
					else
						return { fg = fg, bg = "buffer_visible_bg", italic = false, bold = false }
					end
				end,
				close_button = false,
			}),
		})
		return opts
	end,
}
