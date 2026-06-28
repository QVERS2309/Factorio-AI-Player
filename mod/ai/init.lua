local Brain = require("ai.brain")
local Memory = require("ai.memory")

require("ai.player")
require("ai.world")
require("ai.knowledge")

local AI = {}

function AI.init()

    Memory.init()
    Brain.init()

end

function AI.update(tick)

    Brain.update(tick)

end

return AI