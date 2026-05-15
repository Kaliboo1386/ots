------STORAGE-------
------100 do 104-------
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local item1 = 6543
local item2 = 6542
local item3 = 6544
local item4 = 6545
local item5 = 11367
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'help')) then
selfSay('Jesli potrzebujesz podstawowych informacji wpisz temat ktory cie interesuje.(start,exp,bot,inne)', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'start')) then
selfSay('Zanim zaczniesz przygade z nami musisz zaopatrzyc sie w podstawowe uzbrojenie znajdziesz je w teleporcie ,,Items"', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'start') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,100) > 0) then
selfSay('Wykonales juz ta misje.', cid)
else
if(doPlayerRemoveItem(cid, item1, 30) == TRUE) then
setPlayerStorageValue(cid,100,1)
doPlayerAddExperience(cid,192000000000000)
selfSay('No dziekuje Ci za te jajka. (otrzymales sporo pkt doswiadczenia)', cid)
else
selfSay('Potrzebuje 30 niebieskich jajek..', cid)
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'Exp')) then
selfSay('Zacznij Expic w teleporcie ,,Start"  wez Vip acces, gdzie dalej expic? Info na naszym forum dzial poradniki', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'Exp') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,100) < 1) then
selfSay('Najpierw przynies mi 30 niebieskich jajek.', cid)
else
if (getPlayerStorageValue(cid,101) > 0) then
selfSay('Wykonales juz ta misje.', cid)
else
if(doPlayerRemoveItem(cid, item2, 30) == TRUE) then
setPlayerStorageValue(cid,101,1)
doPlayerAddExperience(cid,192000000000000)
selfSay('Dzieki za jajka (otrzymujesz za nie pkt doswiadczenia)', cid)
else
selfSay('Potrzebuje 30 zielonych jajek..', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'misja3')) then
selfSay('Bede potrzebowal jeszcze 30 zielonych jajek.jak przyniesziesz wpisz : zielone jajka', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'zielone jajka') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,101) < 1) then
selfSay('Najpierw przynies mi 30 niebieskich jajek i 30 czerwonych.', cid)
else
if (getPlayerStorageValue(cid,102) > 0) then
selfSay('Wykonales juz ta misje.', cid)
else
if(doPlayerRemoveItem(cid, item3, 30) == TRUE) then
setPlayerStorageValue(cid,102,1)
doPlayerAddExperience(cid,192000000000000, 1, 1)
selfSay('No bardzo ladne jajeczka , dziekuje. (otrzymales znowu sporo pkt doswiadczenia)', cid)
else
selfSay('Potrzebuje 30 czerwonych jajek..', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'misja4')) then
selfSay('Przynies mi 30 sztuk fioletowych jajek.. jak przyniesziesz wpisz : fioletowe jajka', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'fioletowe jajka') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,102) < 1) then
selfSay('Wykonaj moje poprzednie polecenia..', cid)
else
if (getPlayerStorageValue(cid,103) > 0) then
selfSay('Wykonales juz ta misje.', cid)
else
if(doPlayerRemoveItem(cid, item4, 30) == TRUE) then
setPlayerStorageValue(cid,103,1)
doPlayerAddExperience(cid,192000000000000, 1, 1)
selfSay('No tyle jajek mi wystarczy (otrzymales dodatkowo pkt doswiadczenia)', cid)
else
selfSay('Za malo tych jajek..', cid)
end
end
end
return true
end
----------------------------------------------------------
if(msgcontains(msg, 'misja5')) then
selfSay('Znajdz 50 United Rules. jak zdobedziesz wpisz : United Rules', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'United Rules') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,103) < 1) then
selfSay('Przynies najpierw mi jajka..', cid)
else
if (getPlayerStorageValue(cid,104) > 0) then
selfSay('Wykonales juz ta misje.', cid)
else
if(doPlayerRemoveItem(cid, item5, 50) == TRUE) then
setPlayerStorageValue(cid,104,1)
doPlayerAddExperience(cid,192000000000000, 1, 1)
doPlayerAddItem(cid, 7885, 1)
setPlayerStorageValue(cid, PRESENT_STORAGE, 1) 
selfSay('Ooo dziekuje bardzo. Mam juz wszystko co mi potrzebne do podrozy. Masz tutaj Magiczne spodnie (otrzymales Jedyne Magiczne Spodnie i pkt doswiadczenia)', cid)
else
selfSay('Potrzebuje 50 United Rule', cid)
end
end
end
return true
end
----------------------------------------------------------


----------------------------------------------------------
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  