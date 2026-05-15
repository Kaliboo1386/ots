local amount = 1
 
local ammunition = 
{
	[2544] = {dfx = CONST_ANI_ARROW}, 
	[7364] = {dfx = CONST_ANI_SNIPERARROW}, 
	[7365] = {dfx = CONST_ANI_ONYXARROW}, 
	[2543] = {dfx = CONST_ANI_BOLT}, 
	[7363] = {dfx = CONST_ANI_PIERCINGBOLT}, 
	[2547] = {dfx = CONST_ANI_POWERBOLT}, 
	[6529] = {dfx = CONST_ANI_INFERNALBOLT},
	[7838] = {dfx = CONST_ANI_FLASHARROW, efx = CONST_ME_ENERGYHIT, id = 2}, 
	[7839] = {dfx = CONST_ANI_SHIVERARROW, efx = CONST_ME_ICEATTACK, id = 3}, 
	[7840] = {dfx = CONST_ANI_FLAMMINGARROW, efx = CONST_ME_FIREATTACK, id = 4}, 
	[7850] = {dfx = CONST_ANI_EARTHARROW, efx = CONST_ME_SMALLPLANTS, id = 5}
}
 
local arr = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}
 
function onGetFormulaValues(cid, level, skill, attack, factor)
 local skill = getPlayerSkillLevel(cid, 4)
	return -(((skill + attack) / 1.5) * (level / 22)), -((skill + attack) * (level / 22))
end
 
local combat = {}
for i = 1, 5 do
    combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_NONE)
	setCombatArea(combat[i], createCombatArea(arr))
    _G["onGetFormulaValues" .. i] = onGetFormulaValues
    setCombatCallback(combat[i], CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues" .. i)
end
 
setCombatParam(combat[1], COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat[2], COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat[3], COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat[4], COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat[5], COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
 
function onCastSpell(cid, var)
local slot = getPlayerSlotItem(cid, CONST_SLOT_AMMO)
	local pPos, ammo = getCreaturePosition(cid), ammunition[slot.itemid]
		if(ammo) and(doRemoveItem(slot.uid, amount)) then
			animationShoot = ammo.dfx	
			if isInArray({7838, 7839, 7840, 7850}, slot.itemid) then
				animationHit = ammo.efx
				id = ammo.id
			else
				animationHit = CONST_ME_HITAREA
				id = 1
			end
			local poss = {
				{x=pPos.x-4, y=pPos.y, z=pPos.z},
				{x=pPos.x-4, y=pPos.y-1, z=pPos.z},
				{x=pPos.x-4, y=pPos.y-2, z=pPos.z},
				{x=pPos.x-3, y=pPos.y-3, z=pPos.z},
				{x=pPos.x-2, y=pPos.y-4, z=pPos.z},
				{x=pPos.x-1, y=pPos.y-4, z=pPos.z},
				{x=pPos.x, y=pPos.y-4, z=pPos.z},
				{x=pPos.x+1, y=pPos.y-4, z=pPos.z},
				{x=pPos.x+2, y=pPos.y-4, z=pPos.z},
				{x=pPos.x+3, y=pPos.y-3, z=pPos.z},
				{x=pPos.x+4, y=pPos.y-2, z=pPos.z},
				{x=pPos.x+4, y=pPos.y-1, z=pPos.z},
				{x=pPos.x+4, y=pPos.y, z=pPos.z},
				{x=pPos.x+4, y=pPos.y+1, z=pPos.z},
				{x=pPos.x+4, y=pPos.y+2, z=pPos.z},
				{x=pPos.x+3, y=pPos.y+3, z=pPos.z},
				{x=pPos.x+2, y=pPos.y+4, z=pPos.z},
				{x=pPos.x+1, y=pPos.y+4, z=pPos.z},
				{x=pPos.x, y=pPos.y+4, z=pPos.z},
				{x=pPos.x-1, y=pPos.y+4, z=pPos.z},
				{x=pPos.x-2, y=pPos.y+4, z=pPos.z},
				{x=pPos.x-3, y=pPos.y+3, z=pPos.z},
				{x=pPos.x-4, y=pPos.y+2, z=pPos.z},
				{x=pPos.x-4, y=pPos.y+1, z=pPos.z}
			}
			for i = 1, #poss do
				doSendDistanceShoot(pPos, poss[i], animationShoot)
				doSendMagicEffect(poss[i], animationHit)
			end
			doCombat(cid, combat[id], var)
		else
			doPlayerSendCancel(cid, "You need ".. amount .." of ammunition in your arrow slot")
			doSendMagicEffect(pPos, CONST_ME_POFF)
			return LUA_ERROR
		end
	return true
end