local combat = createCombatObject() 
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN) 
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0) 
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1) 
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
function onGetFormulaValues(cid, level, maglevel) 
min = 50000 
max = 59000 

return min, max 
end 

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues") 

function onCastSpell(cid, var) 
return doCombat(cid, combat, var) 
end 
