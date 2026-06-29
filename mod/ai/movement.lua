local Player = require("ai.player")

local Movement = {}

----------------------------------------------------
-- Получить позицию игрока
----------------------------------------------------

function Movement.get_position()

    local player = Player.get()

    if not player then
        return nil
    end

    return player.position

end

----------------------------------------------------
-- Остановить игрока
----------------------------------------------------

function Movement.stop()

    local player = Player.get()

    if not player then
        return
    end

    player.walking_state = {
        walking = false,
        direction = player.walking_state.direction
    }

end

----------------------------------------------------
-- Начать движение
----------------------------------------------------

function Movement.walk(direction)

    local player = Player.get()

    if not player then
        return
    end

    player.walking_state = {
        walking = true,
        direction = direction
    }

end

----------------------------------------------------
-- Определить направление
----------------------------------------------------

function Movement.direction(from, to)

    local dx = to.x - from.x
    local dy = to.y - from.y

    local DEAD_ZONE = 0.2

    ------------------------------------------------
    -- Вертикаль
    ------------------------------------------------

    if math.abs(dx) < DEAD_ZONE then

        if dy > 0 then
            return defines.direction.south
        else
            return defines.direction.north
        end

    end

    ------------------------------------------------
    -- Горизонталь
    ------------------------------------------------

    if math.abs(dy) < DEAD_ZONE then

        if dx > 0 then
            return defines.direction.east
        else
            return defines.direction.west
        end

    end

    ------------------------------------------------
    -- Диагонали
    ------------------------------------------------

    if dx > 0 and dy < 0 then
        return defines.direction.northeast
    end

    if dx > 0 and dy > 0 then
        return defines.direction.southeast
    end

    if dx < 0 and dy > 0 then
        return defines.direction.southwest
    end

    return defines.direction.northwest

end

return Movement