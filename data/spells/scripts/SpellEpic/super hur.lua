local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 24)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, TRUE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0, -300000, 6.0, -40)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
