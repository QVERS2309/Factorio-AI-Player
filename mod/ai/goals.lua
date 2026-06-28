local Logger = require("util.logger")

local Goals = {}

----------------------------------------------------
-- Обновление целей
----------------------------------------------------

function Goals.update(memory)

    if memory.goal then
        return
    end

    local iron = memory.knowledge.resources.iron

    if iron then

        memory.goal = {

            type = "mine",

            resource = "iron",

            target = iron

        }

        Logger.info("Goal selected: Mine iron")

    end

end

----------------------------------------------------
-- Получить цель
----------------------------------------------------

function Goals.get(memory)

    return memory.goal

end

----------------------------------------------------
-- Очистить цель
----------------------------------------------------

function Goals.clear(memory)

    memory.goal = nil

end

return Goals