local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_LIGHT)
setConditionParam(condition, CONDITION_PARAM_LIGHT_LEVEL, 6)
setConditionParam(condition, CONDITION_PARAM_LIGHT_COLOR, 215)
setConditionParam(condition, CONDITION_PARAM_TICKS, (6 * 60 + 10) * 1000)
setCombatCondition(combat, condition)

local config = 
{
	[0] = {x = -1, y =  0, distanceId = 4, delay = 0},
	[1] = {x =  1, y =  0, distanceId = 4, delay = 0},
	[2] = {x =  0, y = -1, distanceId = 4, delay = 0},
	[3] = {x =  0, y =  1, distanceId = 4, delay = 0},
	[4] = {x = -2, y =  0, distanceId = 4, delay = 1000},
	[5] = {x =  2, y =  0, distanceId = 4, delay = 1000},
	[6] = {x =  0, y = -2, distanceId = 4, delay = 1000},
	[7] = {x =  0, y =  2, distanceId = 4, delay = 1000}
}
function onCastSpell(cid, var)
		for i = 0, #config do
		local targetPos = {x = getThingPosition(cid).x + config[i].x, y = getThingPosition(cid).y + config[i].y, z = getThingPosition(cid).z, }
		addEvent(doSendDistanceShoot, config[i].delay, getThingPosition(cid), targetPos, config[i].distanceId)
	end
	return doSendMagicEffect(getThingPosition(cid), 28) and doCombat(cid, combat, var)
end
