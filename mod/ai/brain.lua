local Logger = require("util.logger")
local Player = require("ai.player")
local World = require("ai.world")
local Planner = require("ai.planner")
local Actions = require("ai.actions")
local Knowledge = require("ai.knowledge")

local Brain = {}

----------------------------------------------------
-- Наблюдение
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
-- Размышление
----------------------------------------------------

function Brain.think(memory)

    Knowledge.update(memory)

end

----------------------------------------------------
-- Планирование
----------------------------------------------------

function Brain.plan(memory)

    local iron = Knowledge.get_resource(memory, "iron")

    Planner.choose_target(
        memory,
        iron
    )

end

----------------------------------------------------
-- Выполнение
----------------------------------------------------

function Brain.act(memory)

    if not memory.target.position then

        Logger.info("No target")
        return

    end

    Actions.move_to(memory.target.position)

end

----------------------------------------------------
-- Инициализация
----------------------------------------------------

function Brain.init()

    Logger.info("Brain initialized")

end

----------------------------------------------------
-- Главный цикл
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