local Player = require("ai.player")
local Pathfinding = require("ai.pathfinding")
local Movement = require("ai.movement")
local Math2D = require("util.math2d")
local Route = require("ai.route")

local Navigation = {}

----------------------------------------------------
-- Константы
----------------------------------------------------

local ARRIVAL_DISTANCE = 0.5

----------------------------------------------------
-- Состояние
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
-- Есть цель?
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
-- Очистить
----------------------------------------------------

function Navigation.clear_target()

    Navigation.target = nil
    Navigation.active = false

end

----------------------------------------------------
-- Стоп
----------------------------------------------------

function Navigation.stop()

    Movement.stop()

    Navigation.clear_target()

end

----------------------------------------------------
-- Движение к точке
----------------------------------------------------

local function move_to(position, target, tick)

    local player = Player.get()

    if not player then
        return false
    end

    local direction = Pathfinding.find_direction(
        player,
        target,
        tick
    )

    if not direction then
        return false
    end

    Movement.walk(direction)

    return true

end

----------------------------------------------------
-- Обновление
----------------------------------------------------

function Navigation.update(tick)

    ----------------------------------------------------
    -- Движение по маршруту
    ----------------------------------------------------

    if not Route.is_finished() then

        local waypoint = Route.current()

        if waypoint then

            local position = Movement.get_position()

            if not position then
                return false
            end

            local target = waypoint.position or waypoint

            if Math2D.distance(position, target) <= ARRIVAL_DISTANCE then

                Route.next()

                waypoint = Route.current()

                if not waypoint then

                    Movement.stop()

                    return true

                end

                target = waypoint.position or waypoint

            end

            return move_to(position, target, tick)

        end

    end

    ----------------------------------------------------
    -- Обычное движение
    ----------------------------------------------------

    if not Navigation.active then
        return true
    end

    local position = Movement.get_position()

    if not position then
        return false
    end

    if Math2D.distance(position, Navigation.target) <= ARRIVAL_DISTANCE then

        Navigation.stop()

        return true

    end

    return move_to(
        position,
        Navigation.target,
        tick
    )

end

return Navigation