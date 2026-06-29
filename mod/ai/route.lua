local Route = {}

----------------------------------------------------
-- Состояние маршрута
----------------------------------------------------

local route = {

    request_id = nil,

    waypoints = {},

    current_index = 1,

    finished = true

}

----------------------------------------------------
-- Новый маршрут
----------------------------------------------------

function Route.set(path)

    route.waypoints = path or {}

    route.current_index = 1

    route.finished = (#route.waypoints == 0)

end

----------------------------------------------------
-- Текущая точка
----------------------------------------------------

function Route.current()

    return route.waypoints[route.current_index]

end

----------------------------------------------------
-- Следующая точка
----------------------------------------------------

function Route.next()

    if route.finished then
        return nil
    end

    route.current_index = route.current_index + 1

    if route.current_index > #route.waypoints then

        route.finished = true

        return nil

    end

    return route.waypoints[route.current_index]

end

----------------------------------------------------
-- Маршрут завершён?
----------------------------------------------------

function Route.is_finished()

    return route.finished

end

----------------------------------------------------
-- Очистить маршрут
----------------------------------------------------

function Route.clear()

    route.request_id = nil

    route.waypoints = {}

    route.current_index = 1

    route.finished = true

end

----------------------------------------------------
-- ID запроса PathFinder
----------------------------------------------------

function Route.set_request(id)

    route.request_id = id

end

function Route.get_request()

    return route.request_id

end

return Route