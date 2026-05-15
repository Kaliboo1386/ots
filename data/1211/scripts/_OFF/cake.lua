local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DROWNDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_CAKE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_CAKE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -60, -1, -60, 5, 5, 4, 7)
 
local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.8, 0, -0.8, 0)
setCombatCondition(combat, condition)
 
function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
endlocal combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DROWNDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_CAKE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_CAKE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -60, -1, -60, 5, 5, 4, 7)
 
local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.8, 0, -0.8, 0)
setCombatCondition(combat, condition)
 
function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end