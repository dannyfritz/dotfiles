return {
	"rebelot/heirline.nvim",
	opts = function(_, opts)
		local status = require("astronvim.utils.status")
		opts.tabline[2] = status.heirline.make_buflist({
			{
				provider = " ",
				hl = function(self)
					if self.is_visible then
						return { standout = true }
					else
						return { }
					end
				end,
			},
			status.component.tabline_file_info({
				hl = function(self)
					if self.is_visible then
						return { standout = true }
					else
						return { }
					end
				end,
				close_button = false,
			}),
		})
		return opts
	end,
}
