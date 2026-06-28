local Planner = {}

function Planner.choose_target(memory, iron)

    if memory.target.position then
        return
    end

    if not iron then
        return
    end

    memory.target.type = "iron-ore"

    memory.target.position = {
        x = iron.position.x,
        y = iron.position.y
    }

end

return Planner