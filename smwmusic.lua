smwmusic = {}

title_music_smw = love.audio.newSource("music/smw/title.ogg", "stream")
overworld_music_edit_smw = love.audio.newSource("music/smw/edit/overworld_edit.ogg", "stream")
overworld_music_day_smw = love.audio.newSource("music/smw/day/overworld.ogg", "stream")

function smwmusic:update(dt)

if gamestate == "init_menu" then
title_music_smw:play()
else
title_music_smw:stop()
end

	if bg == 1 and editor_state == 1 then
	overworld_music_edit_smw:play()
	overworld_music_edit_smw:setVolume(1)
	overworld_music_day_smw:play()
	overworld_music_day_smw:setVolume(0)
	elseif bg == 1 and editor_state == 0 then
	overworld_music_edit_smw:play()
	overworld_music_edit_smw:setVolume(0)
	overworld_music_day_smw:play()
	overworld_music_day_smw:setVolume(1)
	end

end
return smwmusic