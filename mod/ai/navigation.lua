local Pathfinding = require("ai.pathfinding")
local Movement = require("ai.movement")
local Math2D = require("util.math2d")

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

    local position = Movement.get_position()

    if not position then
        return false
    end

    ----------------------------------------------------
    -- Получить направление от Pathfinding
    ----------------------------------------------------

    local direction_override = Pathfinding.find_direction(
        nil,
        Navigation.target,
        tick
    )

    ----------------------------------------------------
    -- Проверка достижения цели
    ----------------------------------------------------

    if Math2D.distance(position, Navigation.target) <= ARRIVAL_DISTANCE then

        Navigation.stop()

        return true

    end

    ----------------------------------------------------
    -- Движение
    ----------------------------------------------------

    Movement.walk(

        direction_override or

        Movement.direction(
            position,
            Navigation.target
        )

    )

    return false

end

return Navigation