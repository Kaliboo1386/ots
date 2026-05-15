local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 36)

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
	if(getPlayerReborn(cid) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerReborn(cid)) )	
		return -(skillTotal * 36 + levelTotal*7), -(skillTotal * 38 + levelTotal*11)
	end
	
	if(getPlayerReborn(cid) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 36  + levelTotal*7), -(skillTotal * 38  + levelTotal*11)
	end
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end