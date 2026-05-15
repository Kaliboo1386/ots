local combat = createCombatObject() 
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN) 
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0) 
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1) 

function onGetFormulaValues(cid, level, maglevel) 
	if(getPlayerStorageValue(cid, 3000) > 0) then
		min = (level + (400000 * getPlayerStorageValue(cid, 3000))) * 14 + 3000000
		max = (level + (400000 * getPlayerStorageValue(cid, 3000))) * 14 + 3000000
	else
		min = level *14+ 3000000
		max = level *14+ 3000000
	end
	

	
	
	return min, max
end 

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues") 

function onCastSpell(cid, var) 
return doCombat(cid, combat, var) 
end 