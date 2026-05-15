local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 52)

function onGetFormulaValues(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 37 + levelTotal*8), -(skillTotal * 40 + levelTotal*12)
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 37  + levelTotal*8), -(skillTotal * 40  + levelTotal*12)
	end
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")



arr = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}



local area = createCombatArea(arr)
setCombatArea(combat, area)



function onCastSpell(cid, var)
	if(getPlayerStorageValue(cid, 3000) >=45 and (getPlayerStorageValue(cid, 21777) ==1 or getPlayerStorageValue(cid, 30015) ==1)) then
		return doCombat(cid, combat, var)
	elseif (getPlayerStorageValue(cid, 3000) <45) then
		doPlayerSendCancel(cid,"Nie masz wystarczajaco rebornow.")
		return false
	else 
		doPlayerSendCancel(cid,"Musisz nauczyc sie tego czaru.")
		return false
	end
	
end