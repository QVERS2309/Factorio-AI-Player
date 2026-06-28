local Player = {}

function Player.get()
    return game.players[1]
end

function Player.get_position()
    local player = Player.get()

    if not player then
        return nil
    end

    return player.position
end

return Player