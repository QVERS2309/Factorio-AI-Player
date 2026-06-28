local Logger = require("util.logger")

local Knowledge = {}

----------------------------------------------------
-- Обновление знаний о мире
----------------------------------------------------

function Knowledge.update(memory)

    memory.knowledge = memory.knowledge or {}

    memory.knowledge.resources = {

        iron = memory.world.iron,
        copper = memory.world.copper,
        coal = memory.world.coal,
        stone = memory.world.stone

    }

end

----------------------------------------------------
-- Получить известный ресурс
----------------------------------------------------

function Knowledge.get_resource(memory, resource)

    if not memory.knowledge then
        return nil
    end

    if not memory.knowledge.resources then
        return nil
    end

    return memory.knowledge.resources[resource]

end

return Knowledge