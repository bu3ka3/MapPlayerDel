local sampev = require 'samp.events'

function main()
    while not isSampAvailable() do wait(0) end -- проверка на запущенную игру
    mpd = false -- объявляем переменную для активации
    sampRegisterChatCommand('mappd', function() mpd = not mpd end)
    wait(-1)
end

function sampev.onPlayerStreamIn(id, team, model, pos, rot, color, fstyle)
	if mpd then
		return {id, team, model, pos, rot, -256, fstyle} -- выставляем color персонажа на -256
	end
end

-- Данная функция будет работать только при релоге, так как SAMP не успевает обратабывать запрос на уборку клистов и прочих вещей на радаре. 
-- Проще будет сделать автоматическое выключение иконок игроков на радаре при входе в игру.
