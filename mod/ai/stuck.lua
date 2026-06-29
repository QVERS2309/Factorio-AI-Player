local Stuck = {}

----------------------------------------------------
-- Константы
----------------------------------------------------

local CHECK_INTERVAL = 60      -- проверяем раз в секунду
local MIN_DISTANCE = 0.20      -- минимальное смещение
local MAX_STUCK_CHECKS = 3     -- через 3 секунды считаем, что застряли

----------------------------------------------------
-- Состояние
----------------------------------------------------

Stuck.last_position = nil
Stuck.last_tick = 0
Stuck.counter = 0

----------------------------------------------------
-- Сброс
----------------------------------------------------

function Stuck.reset()

    Stuck.last_position = nil
    Stuck.last_tick = 0
    Stuck.counter = 0

end

----------------------------------------------------
-- Расстояние
----------------------------------------------------

local function distance(a, b)

    local dx = b.x - a.x
    local dy = b.y - a.y

    return math.sqrt(dx * dx + dy * dy)

end

----------------------------------------------------
-- Проверка
----------------------------------------------------

function Stuck.update(position, tick)

    if not position then
        return false
    end

    if not Stuck.last_position then

        Stuck.last_position = {
            x = position.x,
            y = position.y
        }

        Stuck.last_tick = tick

        return false

    end

    if tick - Stuck.last_tick < CHECK_INTERVAL then
        return false
    end

    local moved = distance(position, Stuck.last_position)

    Stuck.last_position = {
        x = position.x,
        y = position.y
    }

    Stuck.last_tick = tick

    if moved < MIN_DISTANCE then
        Stuck.counter = Stuck.counter + 1
    else
        Stuck.counter = 0
    end

    return Stuck.counter >= MAX_STUCK_CHECKS

end

return Stuck