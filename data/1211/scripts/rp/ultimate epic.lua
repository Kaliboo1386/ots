local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 49)


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
		return -(skillTotal * 40 + levelTotal*6), -(skillTotal * 47 + levelTotal*9.5)
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 40  + levelTotal*6), -(skillTotal * 47  + levelTotal*9.5)
	end
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end