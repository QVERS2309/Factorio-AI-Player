local AI = require("ai.init")
local Controller = require("ai.controller")

script.on_init(function()
    AI.init()
end)

commands.add_command(
    "ai",
    "Toggle AI",
    function()

        Controller.toggle()

        local state = "DISABLED"

        if Controller.is_enabled() then
            state = "ENABLED"
        end

        game.print("[AI] " .. state)

    end
)

script.on_event(defines.events.on_tick, function(event)
    AI.update(event.tick)
end)