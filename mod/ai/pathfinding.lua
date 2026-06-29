local Sensors = require("ai.sensors")
local Stuck = require("ai.stuck")
local Directions = require("util.directions")
local Movement = require("ai.movement")

local Pathfinding = {}

----------------------------------------------------
-- Найти направление к цели
----------------------------------------------------

local function target_direction(position, target)

    return Movement.direction(position, target)

end

----------------------------------------------------
-- Поиск направления
----------------------------------------------------

function Pathfinding.find_direction(player, target, tick)

    if not player then
        return nil
    end

    if not target then
        return nil
    end

    local position = player.position

    ------------------------------------------------
    -- Основное направление
    ------------------------------------------------

    local dir = target_direction(position, target)

    ------------------------------------------------
    -- Если путь свободен —
    -- идём прямо
    ------------------------------------------------

    if Sensors.is_walkable_direction(position, dir) then
        return dir
    end

    ------------------------------------------------
    -- Пробуем вправо
    ------------------------------------------------

    local right = Directions.rotate_right(dir)

    if Sensors.is_walkable_direction(position, right) then
        return right
    end

    ------------------------------------------------
    -- Пробуем влево
    ------------------------------------------------

    local left = Directions.rotate_left(dir)

    if Sensors.is_walkable_direction(position, left) then
        return left
    end

    ------------------------------------------------
    -- Пока сдаёмся
    ------------------------------------------------

    return dir

end

return Pathfinding