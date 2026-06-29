local Player = require("ai.player")

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
-- Получить расстояние
----------------------------------------------------

local function distance(a, b)

    local dx = b.x - a.x
    local dy = b.y - a.y

    return math.sqrt(dx * dx + dy * dy)

end

----------------------------------------------------
-- Определить направление
----------------------------------------------------

local function direction(from, to)

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

----------------------------------------------------
-- Остановить игрока
----------------------------------------------------

function Navigation.stop()

    local player = Player.get()

    if player then

        player.walking_state = {
            walking = false,
            direction = player.walking_state.direction
        }

    end

    Navigation.target = nil
    Navigation.active = false

end

----------------------------------------------------
-- Обновление
----------------------------------------------------

function Navigation.update(tick)

    if not Navigation.active then
        return true
    end

    local player = Player.get()

    if not player then
        return false
    end

    local position = player.position

    if distance(position, Navigation.target) <= ARRIVAL_DISTANCE then

        Navigation.stop()

        return true

    end

    player.walking_state = {

        walking = true,

        direction = direction(
            position,
            Navigation.target
        )

    }

    return false

end

return Navigation