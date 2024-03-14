return {
	"rebelot/heirline.nvim",
	opts = function(_, opts)
		local status = require("astronvim.utils.status")
		local get_hlgroup = require("astronvim.utils").get_hlgroup
		local status_hl = get_hlgroup("StatusLine")
		local hl = { fg = status_hl.fg ,bg = status_hl.bg }
		opts.statusline = {
			status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
			status.component.nav({ hl = hl, scrollbar = false, ruler = {}, percentage = {}, padding = { right = 1 } }),
			status.component.file_info { hl = hl, filetype = false, filename = {}, file_modified = false },
			status.component.diagnostics(),
			-- status.component.git_branch(),
			status.component.fill(),
			-- status.component.lsp(),
			-- status.component.treesitter(),
			status.component.mode({ surround = { separator = "right" } }),
		}
		opts.tabline[2] = status.heirline.make_buflist({
			{
				provider = " ",
				hl = function(self)
					if self.is_visible then
						return { standout = true }
					else
						return {}
					end
				end,
			},
			status.component.tabline_file_info({
				hl = function(self)
					if self.is_visible then
						return { standout = true }
					else
						return {}
					end
				end,
				close_button = false,
			}),
		})
		return opts
	end,
}
