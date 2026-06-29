local Stuck = {}

----------------------------------------------------
-- Константы
----------------------------------------------------

local CHECK_INTERVAL = 60       -- проверка раз в секунду
local MIN_DISTANCE = 0.20       -- минимальное смещение
local MAX_CHECKS = 3            -- через 3 проверки считаем, что застрял

----------------------------------------------------
-- Состояние
----------------------------------------------------

Stuck.last_position = nil
Stuck.last_check_tick = nil
Stuck.counter = 0

----------------------------------------------------
-- Сброс
----------------------------------------------------

function Stuck.reset()

    Stuck.last_position = nil
    Stuck.last_check_tick = nil
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

    if not position or not tick then
        return false
    end

    ------------------------------------------------
    -- Первый запуск
    ------------------------------------------------

    if Stuck.last_position == nil then

        Stuck.last_position = {
            x = position.x,
            y = position.y
        }

        Stuck.last_check_tick = tick

        return false

    end

    ------------------------------------------------
    -- Ждём следующую проверку
    ------------------------------------------------

    if (tick - Stuck.last_check_tick) < CHECK_INTERVAL then
        return false
    end

    local moved = distance(position, Stuck.last_position)

    Stuck.last_position = {
        x = position.x,
        y = position.y
    }

    Stuck.last_check_tick = tick

    if moved < MIN_DISTANCE then
        Stuck.counter = Stuck.counter + 1
    else
        Stuck.counter = 0
    end

    return Stuck.counter >= MAX_CHECKS

end

return Stuck