local M = {}

M.defaults = {
  {
    name = "BufferKill",
    fn = function()
      require("../../../after/plugin/bufferline").buf_kill "bd"
    end
  }
}

return M
