local Player = require("ai.player")

local Sensors = {}

----------------------------------------------------
-- Позиция игрока
----------------------------------------------------

function Sensors.get_player_position()

    local player = Player.get()

    if not player then
        return nil
    end

    return player.position

end

----------------------------------------------------
-- Проверка клетки
----------------------------------------------------

function Sensors.is_walkable(position)

    if not position then
        return false
    end

    -- Пока всегда считаем клетку проходимой.
    -- Позже здесь появится реальная проверка мира.

    return true

end

return Sensors