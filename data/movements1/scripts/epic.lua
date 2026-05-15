


local upgrading = {

    getLevel = function (item)
        local name = string.explode(getItemName(item), '+')
        return (#name == 1) and 0 or math.abs(name[2])
    end,
}


function onEquip(cid, item, slot)
	if (isPlayer(cid) and getPlayerStorageValue(cid, 3000) > 1) then
		local tempvoc = getPlayerVocation(cid) -- get players voc and store it in temp --
		if tempvoc < 9 then
			setPlayerStorageValue(cid, 50784, getPlayerVocation(cid)) 
		end -- store players voc in storage for later use --
		
		local voc = {
			[{1,5,}] = 9,
			[{2,6,}] = 10,
			[{3,7,}] = 11,
			[{4,8,}] = 12
		}
		
		for k, v in pairs(voc) do
			if isInArray(k, tempvoc) then
				doPlayerSetVocation(cid, v)
				break
			end
		end
	
	
	
	
		
		level = upgrading.getLevel(item.uid)
		local conditions = {
			[CONDITION_PARAM_SKILL_FIST] 				= 140,
			[CONDITION_PARAM_SKILL_FISHING] 			= 140,
			[CONDITION_PARAM_SKILL_CLUB] 				= 140,
			[CONDITION_PARAM_SKILL_SWORD] 				= 140,
			[CONDITION_PARAM_SKILL_AXE] 				= 140,
			[CONDITION_PARAM_SKILL_DISTANCE] 			= 140,
			[CONDITION_PARAM_SKILL_SHIELD] 				= 140,
			[CONDITION_PARAM_SKILL_FISHING] 			= 140,
			[CONDITION_PARAM_STAT_MAGICPOINTS] 			= 140,
			[CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT]		= 260+(level*5),
			[CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT]		= 170+(level*5)
		}

		local condition2 = createConditionObject(CONDITION_HASTE)
		setConditionParam(condition2, CONDITION_PARAM_TICKS, -1)
		setConditionFormula(condition2, 2.5, 0, 3.0, 0)

		local condition = createConditionObject(CONDITION_ATTRIBUTES, -1)
		for param, value in pairs(conditions) do
			setConditionParam(condition, param, value)
		end
		
				
		doAddCondition(cid, condition) 
		setPlayerStorageValue(cid, 50782, 1)
	end
	return true
end

function onDeEquip(cid, item, slot)
	if (isPlayer(cid) and getPlayerStorageValue(cid, 3000) > 1) then
		setPlayerStorageValue(cid, 50781, 0)
		doPlayerSetVocation(cid, getPlayerStorageValue(cid, 50784))
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		setPlayerStorageValue(cid, 50782, 0)
	end	
	return true
end