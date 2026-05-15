local holyWaveArea = {
	createCombatArea({
		{0, 1, 0},
		{1, 2, 1},
		{0, 1, 0}
	}),
	createCombatArea({
		{0, 1, 1, 1, 0},
		{1, 1, 0, 1, 1},
		{1, 0, 2, 0, 1},
		{1, 1, 0, 1, 1},
		{0, 1, 1, 1, 0}
	}),
	createCombatArea({
		{0, 0, 1, 1, 1, 0, 0},
		{0, 1, 0, 0, 0, 1, 0},
		{1, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 2, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 1},
		{0, 1, 0, 0, 0, 1, 0},
		{0, 0, 1, 1, 1, 0, 0}
	}),
	createCombatArea({
		{0, 0, 1, 1, 1, 1, 1, 0, 0},
		{0, 1, 1, 0, 0, 0, 1, 1, 0},
		{1, 1, 0, 0, 0, 0, 0, 1, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 0, 0, 0, 2, 0, 0, 0, 1},
		{1, 0, 0, 0, 0, 0, 0, 0, 1},
		{1, 1, 0, 0, 0, 0, 0, 1, 1},
		{0, 1, 1, 0, 0, 0, 1, 1, 0},
		{0, 0, 1, 1, 1, 1, 1, 0, 0}
	})
}
 
local groundshakerCircleArea = {
	createCombatArea({
		{1, 1, 0, 2},
	}),
	createCombatArea({
		{1, 1, 0, 0},
		{0, 0, 0, 2},
	}),
	createCombatArea({
		{0, 1, 0, 0},
		{0, 0, 0, 0},
		{0, 0, 0, 2},
	}),
	createCombatArea({
		{1, 0},
		{1, 0},
		{0, 0},
		{0, 2},
	}),
	createCombatArea({
		{1},
		{1},
		{0},
		{2},
	}),
	createCombatArea({
		{0, 1},
		{0, 1},
		{0, 0},
		{2, 0},
		{0, 0},
		{0, 0},
		{0, 0}
	}),
	createCombatArea({
		{0, 0, 1},
		{0, 0, 0},
		{2, 0, 0},
	}),
	createCombatArea({
		{0, 0, 1, 1},
		{2, 0, 0, 0},
	}),
	createCombatArea({
		{2, 0, 1, 1},
	}),
	createCombatArea({
		{2, 0, 0, 0},
		{0, 0, 1, 1},
	}),
	createCombatArea({
		{2, 0, 0},
		{0, 0, 0},
		{0, 0, 1},
	}),
	createCombatArea({
		{2, 0},
		{0, 0},
		{0, 1},
		{0, 1}
	}),
	createCombatArea({
		{2},
		{0},
		{1},
		{1}
	}),
	createCombatArea({
		{0, 2},
		{0, 0},
		{1, 0},
		{1, 0}
	}),
	createCombatArea({
		{0, 0, 2},
		{0, 0, 0},
		{1, 0, 0},
	}),
	createCombatArea({
		{0, 0, 0, 2},
		{1, 1, 0, 0},
	})
}
 
 
 
function onTargetTile1(cid, pos)
	doSendDistanceShoot(getCreaturePosition(cid), pos, CONST_ANI_WHIRLWINDCLUB)
end
 
local holyWave = {}
for k, area in ipairs(holyWaveArea) do
	holyWave[k] = createCombatObject()
	setCombatParam(holyWave[k], COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
	setCombatFormula(holyWave[k], COMBAT_FORMULA_SKILL, 0, -90, 1.20, -50)
 
	setCombatArea(holyWave[k], area)
 
	_G["callback1" .. k] = onTargetTile1
	setCombatCallback(holyWave[k], CALLBACK_PARAM_TARGETTILE, "callback1" .. k)
end
 
function onTargetTile2(cid, pos)
	doSendDistanceShoot(getCreaturePosition(cid), pos, CONST_ANI_WHIRLWINDSWORD)
end
 
local groundshakerCircle = {}
for k, area in ipairs(groundshakerCircleArea) do
	groundshakerCircle[k] = createCombatObject()
	setCombatParam(groundshakerCircle[k], COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
	setCombatParam(groundshakerCircle[k], COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
	setCombatFormula(groundshakerCircle[k], COMBAT_FORMULA_SKILL, 2.55, -100, 2.60, -200)
 
	setCombatArea(groundshakerCircle[k], area)
 
	_G["callback2" .. k] = onTargetTile2
	setCombatCallback(groundshakerCircle[k], CALLBACK_PARAM_TARGETTILE, "callback2" .. k)
end
 
 
local function castSpellDelay(p)
	doCombat(unpack(p))
end
 
function onCastSpell(cid, var)
	for k, area in ipairs(holyWave) do
		addEvent(castSpellDelay, 150 * k, {cid, holyWave[k], var})
	end
 
	local i = 0
	for k, combat in ipairs(groundshakerCircle) do
		addEvent(castSpellDelay, #holyWave * 150 + #groundshakerCircle * 100 * i + 100 * k, {cid, combat, var})
	end
 
	return LUA_NO_ERROR
end