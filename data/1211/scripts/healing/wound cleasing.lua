local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		min = (level + (400000 * getPlayerStorageValue(cid, 3000)) ) * 8.8 + 2000000
		max = (level + (400000 * getPlayerStorageValue(cid, 3000)) ) * 12+ 2000000
		
	else
		min = (level * 1 + maglevel * 4) * 8.8+ 2000000
		max = (level * 1 + maglevel * 4) * 12+ 2000000
	end
	
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	
	return doCombat(cid, combat, var)
	
end