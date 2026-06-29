local Directions = {}

----------------------------------------------------
-- Поворот вправо (45°)
----------------------------------------------------

local RIGHT = {

    [defines.direction.north] = defines.direction.northeast,
    [defines.direction.northeast] = defines.direction.east,
    [defines.direction.east] = defines.direction.southeast,
    [defines.direction.southeast] = defines.direction.south,
    [defines.direction.south] = defines.direction.southwest,
    [defines.direction.southwest] = defines.direction.west,
    [defines.direction.west] = defines.direction.northwest,
    [defines.direction.northwest] = defines.direction.north

}

----------------------------------------------------
-- Поворот влево (45°)
----------------------------------------------------

local LEFT = {

    [defines.direction.north] = defines.direction.northwest,
    [defines.direction.northwest] = defines.direction.west,
    [defines.direction.west] = defines.direction.southwest,
    [defines.direction.southwest] = defines.direction.south,
    [defines.direction.south] = defines.direction.southeast,
    [defines.direction.southeast] = defines.direction.east,
    [defines.direction.east] = defines.direction.northeast,
    [defines.direction.northeast] = defines.direction.north

}

----------------------------------------------------
-- Разворот на 180°
----------------------------------------------------

local OPPOSITE = {

    [defines.direction.north] = defines.direction.south,
    [defines.direction.northeast] = defines.direction.southwest,
    [defines.direction.east] = defines.direction.west,
    [defines.direction.southeast] = defines.direction.northwest,
    [defines.direction.south] = defines.direction.north,
    [defines.direction.southwest] = defines.direction.northeast,
    [defines.direction.west] = defines.direction.east,
    [defines.direction.northwest] = defines.direction.southeast

}

----------------------------------------------------
-- Повернуть вправо
----------------------------------------------------

function Directions.rotate_right(direction)

    return RIGHT[direction] or direction

end

----------------------------------------------------
-- Повернуть влево
----------------------------------------------------

function Directions.rotate_left(direction)

    return LEFT[direction] or direction

end

----------------------------------------------------
-- Развернуться
----------------------------------------------------

function Directions.opposite(direction)

    return OPPOSITE[direction] or direction

end

return Directions