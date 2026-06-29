local Logger = require("util.logger")
local Navigation = require("ai.navigation")

local Actions = {}

----------------------------------------------------
-- Идти к точке
----------------------------------------------------

function Actions.move_to(position)

    if not position then
        return true
    end

    ----------------------------------------------------
    -- Если цель еще не установлена
    ----------------------------------------------------

    if not Navigation.has_target() then

        Navigation.set_target(position)

        Logger.info(
            string.format(
                "Moving to %.1f %.1f",
                position.x,
                position.y
            )
        )

    end

    ----------------------------------------------------
    -- Обновляем движение
    ----------------------------------------------------

    return Navigation.update()

end

----------------------------------------------------
-- Остановиться
----------------------------------------------------

function Actions.stop()

    Navigation.stop()

end

----------------------------------------------------
-- Добыча (заготовка)
----------------------------------------------------

function Actions.mine(entity)

    if not entity then
        return
    end

    Logger.info("Mining...")

end

----------------------------------------------------
-- Строительство (заготовка)
----------------------------------------------------

function Actions.build(entity)

    if not entity then
        return
    end

    Logger.info("Building...")

end

----------------------------------------------------
-- Крафт (заготовка)
----------------------------------------------------

function Actions.craft(item)

    if not item then
        return
    end

    Logger.info("Crafting " .. item)

end

return Actions