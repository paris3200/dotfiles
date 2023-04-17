local M = {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  event = "VeryLazy",
}

function M.config()
  require('neorg').setup {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.norg.concealer"] = { -- Adds pretty icons to your documents
        config = {
          icon_preset = "diamond",
        }
      },
      ["core.norg.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
          },
          default_workspace = "notes",
        },
      },
    }
  }
end

return M
