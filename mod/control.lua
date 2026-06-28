local AI = require("ai.init")

script.on_init(function()
    AI.init()
end)

script.on_event(defines.events.on_tick, function(event)
    AI.update(event.tick)
end)