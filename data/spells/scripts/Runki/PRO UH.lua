local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 13)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	if(getPlayerReborn(cid) > 0) then
		min = (level + (400000 * getPlayerReborn(cid)) ) * 18.8 + 2000000
		max = (level + (400000 * getPlayerReborn(cid)) ) * 22+ 2000000
		
	else
		min = (level * 1 + maglevel * 4) * 18.8+ 2000000
		max = (level * 1 + maglevel * 4) * 22+ 2000000
	end
	
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end