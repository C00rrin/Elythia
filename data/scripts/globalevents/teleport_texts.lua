local effects = {
    --{position = Position(32369, 32241, 7), text = 'Welcome to the Best, Elythia!', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32342, 32220, 7), text = 'Blackstone Island', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32341, 32220, 7), text = 'Fishing Island', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32343, 32218, 7), text = 'Coming soon', effect = CONST_ME_GROUNDSHAKER},    
    --{position = Position(1116, 1092, 7), text = 'ENTER', effect = CONST_ME_GROUNDSHAKER},
    --{position = Position(1114, 1096, 7), text = 'EXIT', effect = CONST_ME_GROUNDSHAKER},  
}

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(4550)
animatedText:register()