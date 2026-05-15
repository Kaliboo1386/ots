local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 9779)


function onCastSpell(cid, var)
if not isInArea(getCreaturePosition(cid), {x = 2588 , y = 2100 , z = 6}, {x = 2700, y = 2412 , z = 7}) then
 return doCombat(cid, combat, var)
end
end