local Logger = require("util.logger")

local Memory = {}

function Memory.init()

    storage.ai = storage.ai or {

        version = "0.1.0",

        ----------------------------------------------------
        -- Состояние ИИ
        ----------------------------------------------------

        state = "idle",

        ----------------------------------------------------
        -- Игрок
        ----------------------------------------------------

        player = {

            position = nil,
            inventory = nil,
            health = nil,
            direction = nil

        },

        ----------------------------------------------------
        -- Текущая цель
        ----------------------------------------------------

        target = {

            entity = nil,
            position = nil,
            type = nil

        },

        ----------------------------------------------------
        -- Известный мир
        ----------------------------------------------------

        world = {

            iron = nil,
            copper = nil,
            coal = nil,
            stone = nil

        }

    }

    Logger.info("Memory initialized")

end

return Memory