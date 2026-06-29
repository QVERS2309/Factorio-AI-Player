local Pathfinding = require("ai.pathfinding")
local Movement = require("ai.movement")

local Navigation = {}

----------------------------------------------------
-- Константы
----------------------------------------------------

local ARRIVAL_DISTANCE = 0.5

----------------------------------------------------
-- Внутреннее состояние
----------------------------------------------------

Navigation.target = nil
Navigation.active = false

----------------------------------------------------
-- Установить цель
----------------------------------------------------

function Navigation.set_target(position)

    if not position then
        return
    end

    Navigation.target = {
        x = position.x,
        y = position.y
    }

    Navigation.active = true

end

----------------------------------------------------
-- Есть ли активная цель
----------------------------------------------------

function Navigation.has_target()

    return Navigation.active and Navigation.target ~= nil

end

----------------------------------------------------
-- Получить цель
----------------------------------------------------

function Navigation.get_target()

    return Navigation.target

end

----------------------------------------------------
-- Очистить цель
----------------------------------------------------

function Navigation.clear_target()

    Navigation.target = nil
    Navigation.active = false

end

----------------------------------------------------
-- Получить расстояние
----------------------------------------------------

local function distance(a, b)

    local dx = b.x - a.x
    local dy = b.y - a.y

    return math.sqrt(dx * dx + dy * dy)

end

----------------------------------------------------
-- Остановить движение
----------------------------------------------------

function Navigation.stop()

    Movement.stop()

    Navigation.clear_target()

end

----------------------------------------------------
-- Обновление
----------------------------------------------------

function Navigation.update(tick)

    if not Navigation.active then
        return true
    end

    local position = Movement.get_position and Movement.get_position()

    -- Совместимость с текущей версией
    if not position then
        local Player = require("ai.player")
        local player = Player.get()

        if not player then
            return false
        end

        position = player.position

        local direction_override = Pathfinding.find_direction(
            player,
            Navigation.target,
            tick
        )

        if distance(position, Navigation.target) <= ARRIVAL_DISTANCE then

            Navigation.stop()

            return true

        end

        Movement.walk(
            direction_override or
            Movement.direction(position, Navigation.target)
        )

        return false
    end

    local direction_override = Pathfinding.find_direction(
        nil,
        Navigation.target,
        tick
    )

    if distance(position, Navigation.target) <= ARRIVAL_DISTANCE then

        Navigation.stop()

        return true

    end

    Movement.walk(
        direction_override or
        Movement.direction(position, Navigation.target)
    )

    return false

end

return Navigation