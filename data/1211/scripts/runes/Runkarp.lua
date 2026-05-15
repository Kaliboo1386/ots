local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat1, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, false)



function onGetFormulaValues1(cid, level, maglevel)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		min = (level + (400000 * getPlayerStorageValue(cid, 3000)) ) * 18.8 + 2000000
		max = (level + (400000 * getPlayerStorageValue(cid, 3000)) ) * 22+ 2000000
	else
		min = (level * 1 + maglevel * 4) * 18.8+ 2000000
		max = (level * 1 + maglevel * 4) * 22+ 2000000
	end
	
	return min, max
end

setCombatCallback(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")




function onGetFormulaValues2(cid, level, maglevel)

	if(getPlayerStorageValue(cid, 3000) > 0) then
		min = (level + (400000 * getPlayerStorageValue(cid, 3000))) * 14 + 3000000
		max = (level + (400000 * getPlayerStorageValue(cid, 3000))) * 14 + 3000000
	else
		min = level *14+ 3000000
		max = level *14+ 3000000
	end
	

setCombatCallback(combat2, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")




function onCastSpell(cid, var)

	doCombat(cid, combat1, var)
	doCombat(cid, combat2, var)

	return true
end