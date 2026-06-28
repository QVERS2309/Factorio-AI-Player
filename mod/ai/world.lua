local World = {}

local function find_resource(position, resource_name)

    local surface = game.surfaces[1]

    local entities = surface.find_entities_filtered{
        position = position,
        radius = 100,
        name = resource_name
    }

    if #entities == 0 then
        return nil
    end

    return entities[1]

end

----------------------------------------------------
-- Ресурсы
----------------------------------------------------

function World.find_nearest_iron(position)

    return find_resource(position, "iron-ore")

end

function World.find_nearest_copper(position)

    return find_resource(position, "copper-ore")

end

function World.find_nearest_coal(position)

    return find_resource(position, "coal")

end

function World.find_nearest_stone(position)

    return find_resource(position, "stone")

end

return World