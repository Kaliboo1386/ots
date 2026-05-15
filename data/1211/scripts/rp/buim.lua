local acombat1 = createCombatObject()
local acombat2 = createCombatObject()
local acombat3 = createCombatObject()
local acombat4 = createCombatObject()
local acombat5 = createCombatObject()
local acombat6 = createCombatObject()
local acombat7 = createCombatObject()
local acombat8 = createCombatObject()

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 36)
function onGetFormulaValues1(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 44 + levelTotal*8.5)/2, -(skillTotal * 50 + levelTotal*11.5)/2
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 44  + levelTotal*7.5)/2, -(skillTotal * 50  + levelTotal*10.5)/2
	end
end

setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 39)
function onGetFormulaValues2(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 44 + levelTotal*7.5)/2, -(skillTotal * 50 + levelTotal*10.5)/2
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 44  + levelTotal*7.5)/2, -(skillTotal * 50  + levelTotal*10.5)/2
	end
end
setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")
 

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 39)
function onGetFormulaValues3(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 44 + levelTotal*7.5)/2, -(skillTotal * 50 + levelTotal*10.5)/2
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 44  + levelTotal*7.5)/2, -(skillTotal * 50  + levelTotal*10.5)/2
	end
end
setCombatCallback(combat3, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")
 

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 39)
function onGetFormulaValues4(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 44 + levelTotal*7.5)/2, -(skillTotal * 50 + levelTotal*10.5)/2
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 44  + levelTotal*7.5)/2, -(skillTotal * 50  + levelTotal*10.5)/2
	end
end
setCombatCallback(combat4, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues4")
 
local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 36)
function onGetFormulaValues5(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 44 + levelTotal*7.5)/2, -(skillTotal * 50 + levelTotal*10.5)/2
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 44  + levelTotal*7.5)/2, -(skillTotal * 50  + levelTotal*10.5)/2
	end
end
setCombatCallback(combat5, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues5")
 
local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat6, COMBAT_PARAM_EFFECT, 39)
function onGetFormulaValues6(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 44 + levelTotal*7.5)/2, -(skillTotal * 50 + levelTotal*10.5)/2
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 44  + levelTotal*7.5)/2, -(skillTotal * 50  + levelTotal*10.5)/2
	end
end
setCombatCallback(combat6, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues6")
 
local combat7 = createCombatObject()
setCombatParam(combat7, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat7, COMBAT_PARAM_EFFECT, 36)
function onGetFormulaValues7(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 44 + levelTotal*7.5)/2, -(skillTotal * 50 + levelTotal*10.5)/2
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 44  + levelTotal*7.5)/2, -(skillTotal * 50  + levelTotal*10.5)/2
	end
end
setCombatCallback(combat7, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues7")
 
local combat8 = createCombatObject()
setCombatParam(combat8, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat8, COMBAT_PARAM_EFFECT, 49)
function onGetFormulaValues8(cid, level, skill, attack, factor)
	if(getPlayerStorageValue(cid, 3000) > 0) then
		local skillTotal, levelTotal = skill + attack, (level + (400000 * getPlayerStorageValue(cid, 3000)) )	
		return -(skillTotal * 44 + levelTotal*7.5)/2, -(skillTotal * 50 + levelTotal*10.5)/2
	end
	
	if(getPlayerStorageValue(cid, 3000) < 1) then
		local skillTotal, levelTotal = skill + attack, level 
		return -(skillTotal * 44  + levelTotal*7.5)/2, -(skillTotal * 50  + levelTotal*10.5)/2
	end
end
setCombatCallback(combat8, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues8")
local condition = createConditionObject(CONDITION_DRUNK)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10)
setCombatCondition(combat1, condition)
setCombatCondition(combat2, condition)
setCombatCondition(combat3, condition)
setCombatCondition(combat4, condition)
setCombatCondition(combat5, condition)
setCombatCondition(combat6, condition)
setCombatCondition(combat7, condition)
setCombatCondition(combat8, condition)
 


arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 2, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
 
arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
 
arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}
 
arr4 = {
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{1, 1, 0, 0, 0, 2, 0, 0, 0, 1, 1},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}
}

arr5 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

arr6 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

arr7 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

arr8 = {
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{1, 1, 0, 0, 0, 2, 0, 0, 0, 1, 1},
{1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}
}
 
local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
local area6 = createCombatArea(arr6)
local area7 = createCombatArea(arr7)
local area8 = createCombatArea(arr8)
setCombatArea(acombat1, area1)
setCombatArea(acombat2, area2)
setCombatArea(acombat3, area3)
setCombatArea(acombat4, area4)
setCombatArea(acombat5, area5)
setCombatArea(acombat6, area6)
setCombatArea(acombat7, area7)
setCombatArea(acombat8, area8)

function onTargetTile(cid, pos)
	doCombat(cid,combat1,positionToVariant(pos))
end

function onTargetTile2(cid, pos)
	doCombat(cid,combat2,positionToVariant(pos))
end

function onTargetTile3(cid, pos)
	doCombat(cid,combat3,positionToVariant(pos))
end

function onTargetTile4(cid, pos)
	doCombat(cid,combat4,positionToVariant(pos))
end

function onTargetTile5(cid, pos)
	doCombat(cid,combat5,positionToVariant(pos))
end

function onTargetTile6(cid, pos)
	doCombat(cid,combat6,positionToVariant(pos))
end

function onTargetTile7(cid, pos)
	doCombat(cid,combat7,positionToVariant(pos))
end

function onTargetTile8(cid, pos)
	doCombat(cid,combat8,positionToVariant(pos))
end

setCombatCallback(acombat1, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

setCombatCallback(acombat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")


setCombatCallback(acombat3, CALLBACK_PARAM_TARGETTILE, "onTargetTile3")


setCombatCallback(acombat4, CALLBACK_PARAM_TARGETTILE, "onTargetTile4")


setCombatCallback(acombat5, CALLBACK_PARAM_TARGETTILE, "onTargetTile5")


setCombatCallback(acombat6, CALLBACK_PARAM_TARGETTILE, "onTargetTile6")


setCombatCallback(acombat7, CALLBACK_PARAM_TARGETTILE, "onTargetTile7")


setCombatCallback(acombat8, CALLBACK_PARAM_TARGETTILE, "onTargetTile8")


local function onCastSpell1(parameters)
    doCombat(parameters.cid, acombat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    doCombat(parameters.cid, acombat2, parameters.var)
end
 
local function onCastSpell3(parameters)
    doCombat(parameters.cid, acombat3, parameters.var)
end
 
local function onCastSpell4(parameters)
    doCombat(parameters.cid, acombat4, parameters.var)
end
 
local function onCastSpell5(parameters)
    doCombat(parameters.cid, acombat5, parameters.var)
end

local function onCastSpell6(parameters)
    doCombat(parameters.cid, acombat6, parameters.var)
end
 
local function onCastSpell7(parameters)
    doCombat(parameters.cid, acombat7, parameters.var)
end
 
local function onCastSpell8(parameters)
    doCombat(parameters.cid, acombat8, parameters.var)
end





function onCastSpell(cid, var)
	if(getPlayerStorageValue(cid, 3000) >=45 and (getPlayerStorageValue(cid, 21777) ==1 or getPlayerStorageValue(cid, 30015) ==1)) then
		local parameters = { cid = cid, var = var}
		addEvent(onCastSpell1, 0, parameters)
		addEvent(onCastSpell2, 100, parameters)
		addEvent(onCastSpell3, 200, parameters)
		addEvent(onCastSpell4, 300, parameters)
		addEvent(onCastSpell5, 100, parameters)
		addEvent(onCastSpell6, 200, parameters)
		addEvent(onCastSpell7, 300, parameters)
		addEvent(onCastSpell8, 400, parameters)
		return true
	elseif (getPlayerStorageValue(cid, 3000) <45) then
		doPlayerSendCancel(cid,"Nie masz wystarczajaco rebornow.")
		return false
	else 
		doPlayerSendCancel(cid,"Musisz nauczyc sie tego czaru.")
		return false
	end
	
end