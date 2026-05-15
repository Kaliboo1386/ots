-- >> Small config section --
local outfits = { 331, 332, 319, 303, 306, 309, 304 }
local outfitMale =
{
lookType = 122,
lookHead = 129,
lookBody = 79,
lookLegs = 3,
lookFeet = 81,
lookAddons = 0
}

local outfitFemale =
{
lookType = 122,
lookHead = 129,
lookBody = 53,
lookLegs = 92,
lookFeet = 79,
lookAddons = 0
}

local cointype = 2152 -- Id of the coin the spell will use (2148 = gold coin, 2152 = platinum coin, 2160 = crystal coin) --
local tbcw = 2000 -- coin wasting time interval (miliseconds) --
local ncws = 2 -- number of coins used up during time interval -- zmienilem
local ncni = 10 -- number of coins needed to trigger the transformation --
local stcn = 20 -- number of coins needed to execute script (must be higher than ncni value) --
local warn = 1 -- warns player when runing short on coins, 1 = yes --
local cwar = 20 -- number of coins that triggers the warnings --

local bmaineff = CONST_ME_YELLOW_RINGS
local bsecondeff = CONST_ME_BLOCKHIT
local bflingeff = CONST_ANI_SMALLHOLY
local blandeff = CONST_ME_HOLYAREA
local bringwaste = CONST_ME_FIREWORK_YELLOW
local bringabsorb = CONST_ME_MAGIC_GREEN

local gmaineff = CONST_ME_EXPLOSIONAREA
local gsecondeff = CONST_ME_FIREAREA
local gflingeff = CONST_ANI_FIRE
local glandeff = CONST_ME_FIREWORK_RED
local gringwaste = CONST_ME_FIREWORK_RED
local gringabsorb = CONST_ME_MAGIC_RED

-- Small config section << --

local condition1 = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition1, CONDITION_PARAM_TICKS, -1)
setConditionParam(condition1, CONDITION_PARAM_SKILL_FIST, 120)
setConditionParam(condition1, CONDITION_PARAM_SKILL_FISHING, 120)
setConditionParam(condition1, CONDITION_PARAM_SKILL_CLUB, 120)
setConditionParam(condition1, CONDITION_PARAM_SKILL_SWORD, 120)
setConditionParam(condition1, CONDITION_PARAM_SKILL_AXE, 120)
setConditionParam(condition1, CONDITION_PARAM_SKILL_DISTANCE, 120)
setConditionParam(condition1, CONDITION_PARAM_SKILL_SHIELD, 120)
setConditionParam(condition1, CONDITION_PARAM_SKILL_FISHING, 120)
setConditionParam(condition1, CONDITION_PARAM_STAT_MAGICPOINTS, 120)
setConditionParam(condition1, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 180)
setConditionParam(condition1, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 180)

local condition2 = createConditionObject(CONDITION_HASTE)
setConditionParam(condition2, CONDITION_PARAM_TICKS, -1)
setConditionFormula(condition2, 2.5, 0, 3.0, 0)

local condition3 = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition3, CONDITION_PARAM_TICKS, -1)
setConditionParam(condition3, CONDITION_PARAM_SKILL_FIST, 120)
setConditionParam(condition3, CONDITION_PARAM_SKILL_FISHING, 120)
setConditionParam(condition3, CONDITION_PARAM_SKILL_CLUB, 120)
setConditionParam(condition3, CONDITION_PARAM_SKILL_SWORD, 120)
setConditionParam(condition3, CONDITION_PARAM_SKILL_AXE, 120)
setConditionParam(condition3, CONDITION_PARAM_SKILL_DISTANCE, 120)
setConditionParam(condition3, CONDITION_PARAM_SKILL_SHIELD, 120)
setConditionParam(condition3, CONDITION_PARAM_SKILL_FISHING, 120)
setConditionParam(condition3, CONDITION_PARAM_STAT_MAGICPOINTS, 120)
setConditionParam(condition3, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 195)
setConditionParam(condition3, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 195)

function superform1(param)
if param.crca == 1 then
local pos = getCreaturePosition(param.cid)
local sex = getPlayerSex(param.cid)
local nha = {x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}
local sha = {x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}
local wha = {x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}
local eha = {x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}
local nwa = {x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}
local nea = {x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}
local sea = {x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}
local swa = {x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}

-- if sex == 1 then
doSendMagicEffect(pos, bmaineff)
doSendMagicEffect(pos, bsecondeff)
doSendDistanceShoot(pos, nha, bflingeff)
doSendDistanceShoot(pos, sha, bflingeff)
doSendDistanceShoot(pos, wha, bflingeff)
doSendDistanceShoot(pos, eha, bflingeff)
doSendDistanceShoot(pos, nwa, bflingeff)
doSendDistanceShoot(pos, nea, bflingeff)
doSendDistanceShoot(pos, sea, bflingeff)
doSendDistanceShoot(pos, swa, bflingeff)
doSendMagicEffect(nha, blandeff)
doSendMagicEffect(sha, blandeff)
doSendMagicEffect(wha, blandeff)
doSendMagicEffect(eha, blandeff)
doSendMagicEffect(nwa, blandeff)
doSendMagicEffect(nea, blandeff)
doSendMagicEffect(sea, blandeff)
doSendMagicEffect(swa, blandeff)
if not(isInArray({1,2},getPlayerStorageValue(param.cid, playerTeam))) then
if not(isInArray(outfits, getCreatureOutfit(param.cid).lookType)) then
if sex == 1 then
doSetCreatureOutfit(param.cid, outfitMale, -1)
else
doSetCreatureOutfit(param.cid, outfitFemale, -1)
end
end
end


--if not(isInArray(outfits, getCreatureOutfit(param.cid).lookType)) then
--if sex == 1 then
-- doSetCreatureOutfit(param.cid, outfitMale, -1)
--else
-- doSetCreatureOutfit(param.cid, outfitFemale, -1)
--end
--end
-- else
-- doSendMagicEffect(pos, gmaineff)
-- doSendMagicEffect(pos, gsecondeff)
-- doSendDistanceShoot(pos, nha, gflingeff)
-- doSendDistanceShoot(pos, sha, gflingeff)
-- doSendDistanceShoot(pos, wha, gflingeff)
-- doSendDistanceShoot(pos, eha, gflingeff)
-- doSendDistanceShoot(pos, nwa, gflingeff)
-- doSendDistanceShoot(pos, nea, gflingeff)
-- doSendDistanceShoot(pos, sea, gflingeff)
-- doSendDistanceShoot(pos, swa, gflingeff)
-- doSendMagicEffect(nha, glandeff)
-- doSendMagicEffect(sha, glandeff)
-- doSendMagicEffect(wha, glandeff)
-- doSendMagicEffect(eha, glandeff)
-- doSendMagicEffect(nwa, glandeff)
-- doSendMagicEffect(nea, glandeff)
-- doSendMagicEffect(sea, glandeff)
-- doSendMagicEffect(swa, glandeff)
-- if not(isInArray(outfits, getCreatureOutfit(param.cid).lookType)) then
-- doSetCreatureOutfit(param.cid, outfitFemale, -1)
-- end
-- end
if getPlayerItemCount(param.cid, 9003) > 0 then
doAddCondition(param.cid, condition3)
--setConditionParam(condition1, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 195)
--setConditionParam(condition1, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 195)
else
doAddCondition(param.cid, condition1)
--setConditionParam(condition1, CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT, 180)
--setConditionParam(condition1, CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT, 180)
end

-- doAddCondition(param.cid, condition1)
doAddCondition(param.cid, condition2)

-- local mhp = getCreatureMaxHealth(param.cid)
-- local mma = getPlayerMaxMana(param.cid)
-- local chp = getCreatureHealth(param.cid)
-- local cma = getPlayerMana(param.cid)

-- local dhp = mhp - chp
-- local dma = mma - cma

--doCreatureAddHealth(param.cid, dhp)
--doPlayerAddMana(param.cid, dma)

doPlayerRemoveItem(param.cid, cointype, ncni)

param.crcb = 1
param.sex = sex
setPlayerStorageValue(param.cid, 50780, 1)
addEvent(superform2, 2, param)
end
end

function superform2(param)
if param.crca == 1 and param.crcb == 1 and isCreature(param.cid) == TRUE and getPlayerStorageValue(param.cid, 50780) == 1 then
local pos = getCreaturePosition(param.cid)
if getPlayerItemCount(param.cid, 2141) == 10 then
doPlayerRemoveItem(param.cid, cointype, ncws)
end
if param.sex == 1 then
-- if not(isInArray(outfits, getCreatureOutfit(param.cid).lookType)) then
-- doSetCreatureOutfit(param.cid, outfitMale, -1)
-- end
doSendMagicEffect(pos, bringwaste)
doSendMagicEffect(pos, bringabsorb)
else
-- if not(isInArray(outfits, getCreatureOutfit(param.cid).lookType)) then
-- doSetCreatureOutfit(param.cid, outfitMale, -1)
-- end
doSendMagicEffect(pos, gringwaste)
doSendMagicEffect(pos, gringabsorb)
end

local goldleft = getPlayerItemCount(param.cid, cointype)

if goldleft < cwar and warn == 1 then
doPlayerSendTextMessage(param.cid, MESSAGE_STATUS_CONSOLE_RED, "Coins left: " ..goldleft.. ".")
end

if goldleft < ncws then
param.crca = 0
param.crcb = 0
setPlayerStorageValue(param.cid, 50780, 0)
doPlayerSendTextMessage(param.cid, MESSAGE_EVENT_DEFAULT, "Your ring has been discharged!")
doPlayerRemoveItem(param.cid, 2139, 1)
local pos = getCreaturePosition(param.cid)

local nha = {x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}
local sha = {x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}
local wha = {x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}
local eha = {x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}

local nwa = {x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}
local nea = {x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}
local sea = {x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}
local swa = {x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}

doRemoveCondition(param.cid, CONDITION_OUTFIT)
doRemoveCondition(param.cid, CONDITION_ATTRIBUTES)
doRemoveCondition(param.cid, CONDITION_HASTE)

-- if param.sex == 1 then
doSendMagicEffect(pos, bmaineff)
doSendMagicEffect(pos, bsecondeff)
doSendDistanceShoot(pos, nha, bflingeff)
doSendDistanceShoot(pos, sha, bflingeff)
doSendDistanceShoot(pos, wha, bflingeff)
doSendDistanceShoot(pos, eha, bflingeff)
doSendDistanceShoot(pos, nwa, bflingeff)
doSendDistanceShoot(pos, nea, bflingeff)
doSendDistanceShoot(pos, sea, bflingeff)
doSendDistanceShoot(pos, swa, bflingeff)
doSendMagicEffect(nha, blandeff)
doSendMagicEffect(sha, blandeff)
doSendMagicEffect(wha, blandeff)
doSendMagicEffect(eha, blandeff)
doSendMagicEffect(nwa, blandeff)
doSendMagicEffect(nea, blandeff)
doSendMagicEffect(sea, blandeff)
doSendMagicEffect(swa, blandeff)
-- else
-- doSendMagicEffect(pos, gmaineff)
-- doSendMagicEffect(pos, gsecondeff)
-- doSendDistanceShoot(pos, nha, gflingeff)
-- doSendDistanceShoot(pos, sha, gflingeff)
-- doSendDistanceShoot(pos, wha, gflingeff)
-- doSendDistanceShoot(pos, eha, gflingeff)
-- doSendDistanceShoot(pos, nwa, gflingeff)
-- doSendDistanceShoot(pos, nea, gflingeff)
-- doSendDistanceShoot(pos, sea, gflingeff)
-- doSendDistanceShoot(pos, swa, gflingeff)
-- doSendMagicEffect(nha, glandeff)
-- doSendMagicEffect(sha, glandeff)
-- doSendMagicEffect(wha, glandeff)
-- doSendMagicEffect(eha, glandeff)
-- doSendMagicEffect(nwa, glandeff)
-- doSendMagicEffect(nea, glandeff)
-- doSendMagicEffect(sea, glandeff)
-- doSendMagicEffect(swa, glandeff)
-- end
else
addEvent(superform2, tbcw, param)
end
end
end

function onEquip(cid, item, slot)
local param = {cid = cid, item = item, slot = slot}
local gold = getPlayerItemCount(cid, cointype)
if gold > stcn then
param.crca = 1
addEvent(superform1, 1, param)
end
return TRUE
end

function onDeEquip(cid, item, slot)
if isPlayer(cid) and getPlayerStorageValue(cid, 50780) == 1 then
doSetCreatureOutfit(cid, {lookType=88,lookHead=0,lookAddons=0,lookLegs=0,lookbody=0,lookFeet=0},43200000)
doRemoveCondition(cid, CONDITION_OUTFIT)
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
doRemoveCondition(cid, CONDITION_HASTE)

local pos = getCreaturePosition(cid)
setPlayerStorageValue(cid, 50780, 0)
local sex = getPlayerSex(cid)

local nha = {x = pos.x, y = pos.y - 3, z = pos.z, stackpos = 255}
local sha = {x = pos.x, y = pos.y + 3, z = pos.z, stackpos = 255}
local wha = {x = pos.x - 3, y = pos.y, z = pos.z, stackpos = 255}
local eha = {x = pos.x + 3, y = pos.y, z = pos.z, stackpos = 255}

local nwa = {x = pos.x - 2, y = pos.y - 2, z = pos.z, stackpos = 255}
local nea = {x = pos.x + 2, y = pos.y - 2, z = pos.z, stackpos = 255}
local sea = {x = pos.x + 2, y = pos.y + 2, z = pos.z, stackpos = 255}
local swa = {x = pos.x - 2, y = pos.y + 2, z = pos.z, stackpos = 255}

if sex == 1 then
doSendMagicEffect(pos, bmaineff)
doSendMagicEffect(pos, bsecondeff)
doSendDistanceShoot(pos, nha, bflingeff)
doSendDistanceShoot(pos, sha, bflingeff)
doSendDistanceShoot(pos, wha, bflingeff)
doSendDistanceShoot(pos, eha, bflingeff)
doSendDistanceShoot(pos, nwa, bflingeff)
doSendDistanceShoot(pos, nea, bflingeff)
doSendDistanceShoot(pos, sea, bflingeff)
doSendDistanceShoot(pos, swa, bflingeff)
doSendMagicEffect(nha, blandeff)
doSendMagicEffect(sha, blandeff)
doSendMagicEffect(wha, blandeff)
doSendMagicEffect(eha, blandeff)
doSendMagicEffect(nwa, blandeff)
doSendMagicEffect(nea, blandeff)
doSendMagicEffect(sea, blandeff)
doSendMagicEffect(swa, blandeff)
else
doSendMagicEffect(pos, gmaineff)
doSendMagicEffect(pos, gsecondeff)
doSendDistanceShoot(pos, nha, gflingeff)
doSendDistanceShoot(pos, sha, gflingeff)
doSendDistanceShoot(pos, wha, gflingeff)
doSendDistanceShoot(pos, eha, gflingeff)
doSendDistanceShoot(pos, nwa, gflingeff)
doSendDistanceShoot(pos, nea, gflingeff)
doSendDistanceShoot(pos, sea, gflingeff)
doSendDistanceShoot(pos, swa, gflingeff)
doSendMagicEffect(nha, glandeff)
doSendMagicEffect(sha, glandeff)
doSendMagicEffect(wha, glandeff)
doSendMagicEffect(eha, glandeff)
doSendMagicEffect(nwa, glandeff)
doSendMagicEffect(nea, glandeff)
doSendMagicEffect(sea, glandeff)
doSendMagicEffect(swa, glandeff)
end
end
return TRUE
end