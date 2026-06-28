local Logger = {}

function Logger.info(message)
    log("[FactorioAIPlayer] " .. message)

    if game then
        game.print("[AI] " .. message)
    end
end

return Logger