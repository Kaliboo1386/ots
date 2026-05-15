local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

function onGetFormulaValues(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal *51 + levelTotal*17), -(skillTotal * 59 + levelTotal*18)
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal *51  + levelTotal*17), -(skillTotal *59  + levelTotal*18)
	end
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
	if not checkReborn(cid, 1) then
		return false
	end
	
	return doCombat(cid, combat, var)
end