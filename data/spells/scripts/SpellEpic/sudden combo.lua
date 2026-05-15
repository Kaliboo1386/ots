----------------------
-----Made by Mkshiwa-----
----------------------

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_BLOCKARMOR, FALSE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -14.5, 0, -22.6, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_BLOCKARMOR, FALSE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -17.5, 0, -22.6, 0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_BLOCKARMOR, FALSE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -17.5, 0, -20.6, 0)


local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end
local function onCastSpell2(parameters)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end
local function onCastSpell3(parameters)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell2, 150, parameters)
addEvent(onCastSpell3, 300, parameters)

return true
end