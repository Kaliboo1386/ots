local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 34)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -192.6, -330, -195.3, -390)

arr = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0},
{0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0},
{1, 1, 0, 1, 1, 3, 1, 1, 0, 1, 1},
{0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0},
{0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onGetFormulaValues(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 38 + levelTotal*9), -(skillTotal * 68 + levelTotal*11)
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 36  + levelTotal*7), -(skillTotal * 38  + levelTotal*11)
	end
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end