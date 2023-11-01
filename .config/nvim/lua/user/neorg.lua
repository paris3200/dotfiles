local M = {
  "nvim-neorg/neorg",
  run = ":Neorg sync-parsers",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  ft = "norg",
}

function M.config()
  require('neorg').setup {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.summary"] = {}, -- Loads default behaviour
      ["core.concealer"] = { -- Adds pretty icons to your documents
        config = {
          icon_preset = "diamond",
        }
      },
      ["core.dirman"] = { -- Manages Neorg workspaces
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
