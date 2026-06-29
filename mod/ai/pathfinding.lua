local Stuck = require("ai.stuck")

local Pathfinding = {}

----------------------------------------------------
-- Инициализация
----------------------------------------------------

function Pathfinding.init()

    Stuck.reset()

end

----------------------------------------------------
-- Найти направление обхода
----------------------------------------------------

function Pathfinding.find_direction(player, target, tick)

    if not player then
        return nil
    end

    if not target then
        return nil
    end

    ----------------------------------------------------
    -- Проверка застревания
    ----------------------------------------------------

    if Stuck.update(player.position, tick) then

        -- Пока только сообщаем Navigation,
        -- что особого направления нет.
        -- Здесь позже появится обход препятствий.

        return nil

    end

    return nil

end

return Pathfinding