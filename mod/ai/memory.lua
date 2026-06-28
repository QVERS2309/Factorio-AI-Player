local Logger = require("util.logger")

local Memory = {}

function Memory.init()

    storage.ai = storage.ai or {

        version = "0.0.3",

        state = "idle",

        player = {
            position = nil
        },

        target = {
            entity = nil,
            position = nil,
            type = nil
        },

        world = {
            iron = nil
        }

    }

    Logger.info("Memory initialized")

end

return Memory