return {
	"ahmedkhalf/project.nvim",
	init = function()
		require("project_nvim").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			patterns = {
				".git",
				"_darcs",
				".hg",
				".bzr",
				".svn",
				"Makefile",
				"package.json",
				"docker-compose.yml",
				"lazy-lock.json",
			},
		})
	end,
}
