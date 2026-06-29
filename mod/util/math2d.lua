local Math2D = {}

----------------------------------------------------
-- Расстояние между двумя точками
----------------------------------------------------

function Math2D.distance(a, b)

    local dx = b.x - a.x
    local dy = b.y - a.y

    return math.sqrt(dx * dx + dy * dy)

end

----------------------------------------------------
-- Квадрат расстояния
----------------------------------------------------

function Math2D.distance_squared(a, b)

    local dx = b.x - a.x
    local dy = b.y - a.y

    return dx * dx + dy * dy

end

----------------------------------------------------
-- Длина вектора
----------------------------------------------------

function Math2D.length(x, y)

    return math.sqrt(x * x + y * y)

end

----------------------------------------------------
-- Нормализованный вектор
----------------------------------------------------

function Math2D.normalize(x, y)

    local len = Math2D.length(x, y)

    if len == 0 then
        return 0, 0
    end

    return x / len, y / len

end

return Math2D