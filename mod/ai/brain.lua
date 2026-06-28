local Logger = require("util.logger")

local Brain = {}

function Brain.init()
    Logger.info("Brain initialized")
end

function Brain.update(tick)
    if tick % 600 == 0 then
        Logger.info("Brain tick: " .. tick)
    end
end

return Brain