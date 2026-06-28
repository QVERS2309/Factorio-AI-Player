local Logger = require("util.logger")
local Goals = require("ai.goals")

local Planner = {}

----------------------------------------------------
-- Планирование
----------------------------------------------------

function Planner.update(memory)

    local goal = Goals.get(memory)

    if not goal then
        return
    end

    ----------------------------------------------------
    -- Добыча ресурсов
    ----------------------------------------------------

    if goal.type == "mine" then

        memory.target.type = goal.resource
        memory.target.entity = goal.target
        memory.target.position = goal.target.position

        Logger.info("Plan created: Mine " .. goal.resource)

    end

end

return Planner