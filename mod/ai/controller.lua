local Logger = require("util.logger")

local Controller = {}

----------------------------------------------------
-- Состояние AI
----------------------------------------------------

Controller.enabled = true

----------------------------------------------------
-- Включить AI
----------------------------------------------------

function Controller.enable()

    if Controller.enabled then
        return
    end

    Controller.enabled = true

    Logger.info("AI ENABLED")

end

----------------------------------------------------
-- Выключить AI
----------------------------------------------------

function Controller.disable()

    if not Controller.enabled then
        return
    end

    Controller.enabled = false

    Logger.info("AI DISABLED")

end

----------------------------------------------------
-- Переключить
----------------------------------------------------

function Controller.toggle()

    if Controller.enabled then
        Controller.disable()
    else
        Controller.enable()
    end

end

----------------------------------------------------
-- Проверка
----------------------------------------------------

function Controller.is_enabled()

    return Controller.enabled

end

return Controller