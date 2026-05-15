local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 22000)
setConditionFormula(condition, 0.7, -56, 0.7, -56)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
if not isInArea(getCreaturePosition(cid), {x = 2588 , y = 2100 , z = 6}, {x = 2700, y = 2412 , z = 7}) then
 return doCombat(cid, combat, var)
end
end