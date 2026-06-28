local Logger = require("util.logger")
local Player = require("ai.player")
local World = require("ai.world")

local Knowledge = require("ai.knowledge")
local Goals = require("ai.goals")
local Planner = require("ai.planner")
local Actions = require("ai.actions")

local Brain = {}

----------------------------------------------------
-- Observe
----------------------------------------------------

function Brain.observe(memory)

    local position = Player.get_position()

    if not position then
        return false
    end

    memory.player.position = position

    memory.world.iron = World.find_nearest_iron(position)
    memory.world.copper = World.find_nearest_copper(position)
    memory.world.coal = World.find_nearest_coal(position)
    memory.world.stone = World.find_nearest_stone(position)

    return true

end

----------------------------------------------------
-- Think
----------------------------------------------------

function Brain.think(memory)

    Knowledge.update(memory)

    if memory.target.position then
        memory.thought = "I have a target."
    else
        memory.thought = "Searching for work."
    end

    Logger.info(memory.thought)

end

----------------------------------------------------
-- Plan
----------------------------------------------------

function Brain.plan(memory)

    Goals.update(memory)
    Planner.update(memory)

end

----------------------------------------------------
-- Act
----------------------------------------------------

function Brain.act(memory)

    if not memory.target.position then

        Logger.info("No target")
        return

    end

    Actions.move_to(memory.target.position)

end

----------------------------------------------------
-- Init
----------------------------------------------------

function Brain.init()

    Logger.info("Brain initialized")

end

----------------------------------------------------
-- Update
----------------------------------------------------

function Brain.update(tick)

    if tick % 600 ~= 0 then
        return
    end

    local memory = storage.ai

    if not Brain.observe(memory) then
        return
    end

    Brain.think(memory)
    Brain.plan(memory)
    Brain.act(memory)

end

return Brain