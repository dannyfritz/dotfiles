return {
	"rebelot/heirline.nvim",
	opts = function(_, opts)
		local status = require("astronvim.utils.status")
		local get_hlgroup = require("astronvim.utils").get_hlgroup
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
		opts.winbar = {
			init = function(self)
				self.bufnr = vim.api.nvim_get_current_buf()
			end,
			fallthrough = false,
			{
				status.component.separated_path({
					path_func = status.provider.filename({ modify = ":.:h" }),
					separator = "/",
				}),
				status.component.file_info({
					file_icon = false,
					file_modified = false,
					file_read_only = false,
					surround = false,
					update = "BufEnter",
				}),
			},
		}
		local status_hl = get_hlgroup("StatusLine")
		opts.statusline = {
			status.component.mode({ mode_text = { padding = { left = 1, right = 1 } } }),
			status.component.nav({
				hl = status_hl,
				scrollbar = false,
				ruler = {},
				percentage = {},
				padding = { right = 1 },
			}),
			status.component.diagnostics(),
			-- status.component.file_info({ hl = status_hl, filetype = false, filename = {}, file_modified = false }),
			-- status.component.git_branch(),
			status.component.fill(),
			-- status.component.lsp(),
			-- status.component.treesitter(),
			status.component.mode({ surround = { separator = "right" } }),
		}
		return opts
	end,
}
