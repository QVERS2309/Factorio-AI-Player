local Logger = require("util.logger")

local Actions = {}

----------------------------------------------------
-- Идти к точке
----------------------------------------------------

function Actions.move_to(position)

    if not position then
        return
    end

    Logger.info(
        string.format(
            "Moving to %.1f %.1f",
            position.x,
            position.y
        )
    )

end

----------------------------------------------------
-- Добывать
----------------------------------------------------

function Actions.mine(target)

    if not target then
        return
    end

    Logger.info("Mining")

end

return Actions