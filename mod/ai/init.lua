local Brain = require("ai.brain")
local Memory = require("ai.memory")
local Navigation = require("ai.navigation")
local Controller = require("ai.controller")

require("ai.player")
require("ai.world")
require("ai.knowledge")

local AI = {}

----------------------------------------------------
-- Инициализация
----------------------------------------------------

function AI.init()

    Memory.init()
    Brain.init()

end

----------------------------------------------------
-- Обновление
----------------------------------------------------

function AI.update(tick)

    if not Controller.is_enabled() then

        if Navigation.has_target() then
            Navigation.stop()
        end

        return

    end

    Navigation.update(tick)

    Brain.update(tick)

end

return AI