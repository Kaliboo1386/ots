local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)

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


local area = createCombatArea(AREA_CROSS5X5)
setCombatArea(combat, area)



function onCastSpell(cid, var)
	if(getPlayerStorageValue(cid, 3000) >=40 and getPlayerStorageValue(cid, 21777) ==1) then
		return doCombat(cid, combat, var)
	elseif (getPlayerStorageValue(cid, 3000) <40) then
		doPlayerSendCancel(cid,"Nie masz wystarczajaco rebornow.")
		return false
	else 
		doPlayerSendCancel(cid,"Musisz nauczyc sie tego czaru.")
		return false
	end
	
end