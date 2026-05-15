local upgrading = {

    getLevel = function (item)
        local name = string.explode(getItemName(item), '+')
        return (#name == 1) and 0 or math.abs(name[2])
    end,
}

function onEquip(cid, item, slot)
	local level = upgrading.getLevel(item.uid)
	local conditions = {
		[CONDITION_PARAM_SKILL_FIST] 				= 120,
		[CONDITION_PARAM_SKILL_FISHING] 			= 120,
		[CONDITION_PARAM_SKILL_CLUB] 				= 120,
		[CONDITION_PARAM_SKILL_SWORD] 				= 120,
		[CONDITION_PARAM_SKILL_AXE] 				= 120,
		[CONDITION_PARAM_SKILL_DISTANCE] 			= 120,
		[CONDITION_PARAM_SKILL_SHIELD] 				= 120,
		[CONDITION_PARAM_SKILL_FISHING] 			= 120,
		[CONDITION_PARAM_STAT_MAGICPOINTS] 			= 120,
		[CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT] 	= 220+(level*7),
		[CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT] = 180+(level*7)
	}

	local condition2 = createConditionObject(CONDITION_HASTE)
	setConditionParam(condition2, CONDITION_PARAM_TICKS, -1)
	setConditionFormula(condition2, 2.5, 0, 3.0, 0)

	local condition = createConditionObject(CONDITION_ATTRIBUTES, -1)
	for param, value in pairs(conditions) do
		setConditionParam(condition, param, value)
	end
	setPlayerStorageValue(cid, 50789, 1)
	doAddCondition(cid, condition) 
	return true
end

function onDeEquip(cid, item, slot)
	return doRemoveCondition(cid, CONDITION_ATTRIBUTES) and setPlayerStorageValue(cid, 50789, 0)
end