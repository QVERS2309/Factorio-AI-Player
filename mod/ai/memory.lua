local Logger = require("util.logger")

local Memory = {}

function Memory.init()
    storage.ai = storage.ai or {
        version = "0.0.2",
        state = "idle"
    }

    Logger.info("Memory initialized")
end

return Memory