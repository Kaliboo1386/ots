local spinAreas = {
	createCombatArea({
		{2, 1}
	}),
	createCombatArea({
		{2, 0},
		{0, 1}
	}),
	createCombatArea({
		{2},
		{1}
	}),
	createCombatArea({
		{0, 2},
		{1, 0}
	}),
	createCombatArea({
		{1, 2}
	}),
	createCombatArea({
		{1, 0},
		{0, 2}
	}),
	createCombatArea({
		{1},
		{2}
	}),
	createCombatArea({
		{0, 1},
		{2, 0}
	})
}
 
local spins = {}
for k, spinArea in ipairs(spinAreas) do
	spins[k] = createCombatObject()
	setCombatParam(spins[k], COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
	setCombatArea(spins[k], spinArea)
end
 
local reaction = createCombatObject()
setCombatParam(reaction, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(reaction, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
setCombatFormula(reaction, COMBAT_FORMULA_SKILL, 1.7, -50, 1.7, -50)
 
 
local reactionArea = createCombatArea({
	{1, 1, 1},
	{1, 2, 1},
	{1, 1, 1}
})
setCombatArea(reaction, reactionArea)
 
local function doEventCombat(p)
	local cid, combat, var = unpack(p)
	if isPlayer(cid) == TRUE then
		if var == FALSE then
			var = positionToVariant(getCreaturePosition(cid))
		end
	doCombat(cid, combat, var)
	end
end
 
function charge(p)
	local cid, occurTime = unpack(p)
	if isPlayer(cid) == TRUE then
		local var = positionToVariant(getCreaturePosition(cid))
		for k, spin in ipairs(spins) do
			addEvent(doEventCombat, occurTime, {cid, spin, var})
			occurTime = occurTime + k * 32
		end
	end
end
 
function effect(p)
	local cid, effect = unpack(p)
	if isPlayer(cid) == TRUE then
		doSendMagicEffect(getCreaturePosition(cid), effect)
	end
end
 
function onCastSpell(cid, var)
	local occurTime = 0
	for i = 1, 3 do
		addEvent(charge, occurTime, {cid, occurTime})
		addEvent(effect, occurTime, {cid, CONST_ME_YELLOWENERGY})
		occurTime = occurTime + i * #spins * 32
	end
 
	occurTime = occurTime + 200
	addEvent(doEventCombat, occurTime, {cid, reaction, FALSE})
	addEvent(effect, occurTime, {cid, CONST_ME_FIREAREA})
	return TRUE
end