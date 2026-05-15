local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 4)

setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)




arr = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)




function onGetFormulaValues(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 58 + levelTotal*7), -(skillTotal * 58 + levelTotal*12)
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 58  + levelTotal*7), -(skillTotal * 58  + levelTotal*12)
	end
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end