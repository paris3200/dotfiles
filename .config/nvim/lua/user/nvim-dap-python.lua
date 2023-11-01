local M = {
  "mfussenegger/nvim-dap-python",
  ft = "python",
}

function M.config()
  require('dap-python').setup("~/.virtualenvs/debugpy/bin/python")
  require("dap-python").test_runner = "pytest"
end

return M
