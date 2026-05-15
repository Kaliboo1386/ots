local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 12)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)


function onGetFormulaValues(cid, level, maglevel)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local levelTotal = (level + (350000 * getPlayerStorageValue(cid, 3000)) )	
		return -(maglevel * 30 *80+ levelTotal*13) -(maglevel *80* 30 + levelTotal*15)
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local  levelTotal =  level 
		return -(maglevel *80* 30  + levelTotal*13), -(maglevel *80* 30+ levelTotal*15)
	end
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
