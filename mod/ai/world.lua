local World = {}

function World.find_nearest_iron(position)

    local surface = game.surfaces[1]

    local entities = surface.find_entities_filtered{
        position = position,
        radius = 100,
        name = "iron-ore"
    }

    if #entities == 0 then
        return nil
    end

    return entities[1]
end

return World