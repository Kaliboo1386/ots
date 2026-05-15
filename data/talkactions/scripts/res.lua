function onSay(cid, words, param, channel)

	if (getPlayerStorageValue(cid, 3001) >0) then
		if (getPlayerReborn(cid) < 25) then
			doPlayerSetStorageValue(cid, 3001,0)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Your reborn lock was shortened to zero")
		end

		--if (getPlayerReborn(cid) < 26) then
		--	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Your reborn lock was shortened to zero")
		--	doPlayerSetStorageValue(cid, 3001,0)
		--elseif (getPlayerStorageValue(cid, 3001) >= os.time() and getPlayerStorageValue(cid, 3005) < 2) then
		--	if (getPlayerStorageValue(cid, 3005)>=1) then
		--		doPlayerSetStorageValue(cid, 3005, getPlayerStorageValue(cid, 3005) + 1)
		--	else
		--		doPlayerSetStorageValue(cid, 3005,1)
		--	end
		--	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Your reborn lock was shortened to zero")
		--	doPlayerSetStorageValue(cid, 3001,0)
		--end

		if (getPlayerStorageValue(cid, 3001) >0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Nastepny reborn: "..os.date("%H:%M:%S %d:%m:%Y", getPlayerStorageValue(cid, 3001)).."")
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Nie masz blokady resowej")
		end
		
	else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Nie masz blokady resowej")
	end
	


end  