local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 38)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)



function onGetFormulaValues(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (300000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 54 + levelTotal*3) -(skillTotal * 70 + levelTotal*7)
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 54  + levelTotal*3), -(skillTotal * 70+ levelTotal*7)
	end
end


setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
