local Player = require("ai.player")

local Sensors = {}

----------------------------------------------------
-- Размер шага
----------------------------------------------------

local STEP = 0.5

----------------------------------------------------
-- Получить игрока
----------------------------------------------------

local function get_player()

    return Player.get()

end

----------------------------------------------------
-- Получить поверхность
----------------------------------------------------

local function get_surface()

    local player = get_player()

    if not player then
        return nil
    end

    return player.surface

end

----------------------------------------------------
-- Позиция игрока
----------------------------------------------------

function Sensors.get_player_position()

    local player = get_player()

    if not player then
        return nil
    end

    return player.position

end

----------------------------------------------------
-- Проверка клетки
----------------------------------------------------

function Sensors.is_walkable(position)

    local surface = get_surface()

    if not surface then
        return false
    end

    ------------------------------------------------
    -- Ищем все объекты рядом с точкой
    ------------------------------------------------

    local entities = surface.find_entities_filtered{

        area = {
            {position.x - 0.25, position.y - 0.25},
            {position.x + 0.25, position.y + 0.25}
        }

    }

    ------------------------------------------------
    -- Проверяем найденные объекты
    ------------------------------------------------

    for _, entity in pairs(entities) do

        if entity.valid then

            ------------------------------------------------
            -- Игрок не считается препятствием
            ------------------------------------------------

            if entity.type ~= "character" then
                return false
            end

        end

    end

    return true

end

----------------------------------------------------
-- Следующая клетка
----------------------------------------------------

local function next_position(position, direction)

    local x = position.x
    local y = position.y

    if direction == defines.direction.north then

        y = y - STEP

    elseif direction == defines.direction.northeast then

        x = x + STEP
        y = y - STEP

    elseif direction == defines.direction.east then

        x = x + STEP

    elseif direction == defines.direction.southeast then

        x = x + STEP
        y = y + STEP

    elseif direction == defines.direction.south then

        y = y + STEP

    elseif direction == defines.direction.southwest then

        x = x - STEP
        y = y + STEP

    elseif direction == defines.direction.west then

        x = x - STEP

    elseif direction == defines.direction.northwest then

        x = x - STEP
        y = y - STEP

    end

    return {
        x = x,
        y = y
    }

end

----------------------------------------------------
-- Проверить направление
----------------------------------------------------

function Sensors.is_walkable_direction(position, direction)

    return Sensors.is_walkable(
        next_position(position, direction)
    )

end

return Sensors