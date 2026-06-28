local Logger = require("util.logger")
local Player = require("ai.player")
local World = require("ai.world")

local Brain = {}

function Brain.init()
    Logger.info("Brain initialized")
end

function Brain.update(tick)

    if tick % 600 ~= 0 then
        return
    end

    local position = Player.get_position()

    if not position then
        return
    end

    Logger.info(
        string.format(
            "Player: %.1f %.1f",
            position.x,
            position.y
        )
    )

    local iron = World.find_nearest_iron(position)

    if iron then

        Logger.info(
            string.format(
                "Iron: %.1f %.1f",
                iron.position.x,
                iron.position.y
            )
        )

    end

end

return Brain