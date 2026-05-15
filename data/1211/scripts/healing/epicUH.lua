local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 13)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	
		min = (level + (400000 * getPlayerStorageValue(cid, 3000)) ) * 19.8 + 2000000
		max = (level + (400000 * getPlayerStorageValue(cid, 3000)) ) * 23 + 2000000
	
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	if(getPlayerStorageValue(cid, 3000) >= 50) then
		return doCombat(cid, combat, var)
	else 
		doPlayerSendCancel(cid,  "Uzyskaj 50 reborn!")
		return false
	end
	
end