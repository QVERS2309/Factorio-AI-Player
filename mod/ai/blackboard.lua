local Blackboard = {}

----------------------------------------------------
-- Внутреннее хранилище
----------------------------------------------------

local data = {

    current_task = nil,

    target_position = nil,

    current_route = nil,

    current_state = "idle",

    selected_resource = nil,

    selected_entity = nil,

    danger = false

}

----------------------------------------------------
-- Записать значение
----------------------------------------------------

function Blackboard.set(key, value)

    data[key] = value

end

----------------------------------------------------
-- Получить значение
----------------------------------------------------

function Blackboard.get(key)

    return data[key]

end

----------------------------------------------------
-- Очистить значение
----------------------------------------------------

function Blackboard.clear(key)

    data[key] = nil

end

----------------------------------------------------
-- Полный сброс
----------------------------------------------------

function Blackboard.reset()

    data = {

        current_task = nil,

        target_position = nil,

        current_route = nil,

        current_state = "idle",

        selected_resource = nil,

        selected_entity = nil,

        danger = false

    }

end

return Blackboard