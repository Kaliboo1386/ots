if not REBORN_SYSTEM then
   REBORN_SYSTEM = {}
end


REBORN_SYSTEM.config = {
                          ["Exhaust"] = { type = "minute", value = 1 },
						  ["Reborn"] = { 
						                 ["Normal"] =  { 
										                 requiredLevel = 400000,
														 startLevel = 50,
														 startExperience = 1847300,
														 teleportPosition = { x = 95, y = 117, z = 7 },
														 magicEffect = CONST_ME_MAGIC_GREEN,
												       },
							             [1] =  {
										          requiredLevel = 400000,
												  startLevel = 50,
												  startExperience = 1847300,
												  teleportPosition = { x = 95, y = 117, z = 7 },
												  magicEffect = CONST_ME_MAGIC_GREEN,
												  rewards = { 
												              { type = "health", value = 50 },
															  { type = "mana", value = 50 },
															  { type = "item", itemid = 2463, count = 1 },
															  { type = "item", itemid = 2467, count = 1 }
															}
												},
				             [2] =  {
										          requiredLevel = 400000,
												  startLevel = 50,
												  startExperience = 1847300,
												  teleportPosition = { x = 95, y = 117, z = 7 },
												  magicEffect = CONST_ME_MAGIC_GREEN,
												  rewards = { 
												              { type = "health", value = 50 },
															  { type = "mana", value = 50 },
															  { type = "item", itemid = 2463, count = 1 },
															  { type = "item", itemid = 2467, count = 1 }
															}
												},
							             [5] =  {
										          requiredLevel = 400000,
												  startLevel = 50,
												  startExperience = 1847300,
												  teleportPosition = { x = 95, y = 117, z = 7 },
												  magicEffect = CONST_ME_MAGIC_RED,
												  _broadcastMessage = true,
												  rewards = { 
												              { type = "health", value = 100 },
															  { type = "mana", value = 100 },
															  { type = "item", itemid = 2487, count = 1 },
															  { type = "item", itemid = 2488, count = 1 }
															}
												},		
							             [10] =  {
										          requiredLevel = 400000,
												  startLevel = 50,
												  startExperience = 1847300,
												  teleportPosition = { x = 95, y = 117, z = 7 },
												  magicEffect = CONST_ME_MAGIC_RED,
												  _broadcastMessage = true,
												  rewards = { 
												              { type = "health", value = 200 },
															  { type = "mana", value = 200 },
															  { type = "item", itemid = 2195, count = 1 }
															}
												},												
									   }
					  }

REBORN_SYSTEM.exhaustStorage = 3001


function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function REBORN_SYSTEM:getRebornTableByValue(value)
     local t = self.config["Reborn"][value]
	 if not t then
	    return self.config["Reborn"]["Normal"]
	 end
	 return t
end

function REBORN_SYSTEM:setExhaust(cid)
    local t = self.config["Exhaust"]
	
	local method = t.type
	local duration = t.value
	
	local interval = duration
    if string.find(method, "msecond") then
       interval = duration
    elseif string.find(method, "second") then
	   interval = duration
    elseif string.find(method, "minute") then
	   interval = duration * 60
    elseif string.find(method, "hour") then 
	   interval = duration * 1000 * 60 * 60
    end 
    
	
	doPlayerSetStorageValue(cid, self.exhaustStorage, interval + os.time())
end

function REBORN_SYSTEM:getExhaustString(cid)
    local value = getPlayerStorageValue(cid, self.exhaustStorage)
	if value < os.time() then
	   return false
	end
	
	  local time_left = value - os.time()
  local days = math.floor(time_left/86400)
  local remaining = time_left % 86400
  local hours = math.floor(remaining/3600)
  remaining = remaining % 3600
  local minutes = math.floor(remaining/60)
  remaining = remaining % 60
  local seconds = remaining
  
  str = ""
  
  local isStarted = false
  
  if days > 0 then
     str = str .. days .. " dni"
	 isStarted = true
  end
  
  if hours > 0 then
     if isStarted then
	    str = str .. ", "
	 end
	 str = str .. hours .. " godzin"
	 isStarted = true
  end

  if minutes > 0 then
     if isStarted then
	    str = str .. ", "
	 end
	 str = str .. minutes .. " minut"
	 isStarted = true
  end
  
  if seconds > 0 then
     if days == 0 and hours == 0 and minutes == 0 then
	    str = seconds .. " sekund"
	 end
  end
  
   str = str .. "."
   return str
end

function REBORN_SYSTEM:recalculateBonuses(cid)
    local rebornLevel = getPlayerReborn(cid)
    local totalHealth = 0
    local totalMana = 0
    
    -- Sum up all rewards from 1 to current reborn level
    for i = 1, rebornLevel do
        local t = self.config["Reborn"][i]
        if t and t.rewards then
            for _, v in pairs(t.rewards) do
                if v.type == "health" then
                    totalHealth = totalHealth + v.value
                elseif v.type == "mana" then
                    totalMana = totalMana + v.value
                end
            end
        end
    end
    
    doPlayerSetRebornHealth(cid, totalHealth)
    doPlayerSetRebornMana(cid, totalMana)
    return totalHealth, totalMana
end

function REBORN_SYSTEM:addRewards(cid, t)
   if not t then
      return nil
   end
   
   local health = 0
   local mana = 0
   local items = {}
   for i, v in pairs(t) do
       if v.type == "health" then
	      health = health + v.value
	   elseif v.type == "mana" then
	      mana = mana + v.value
	   elseif v.type == "item" then
	      if not items[v.itemid] then
		     items[v.itemid] = 0
		  end
		  items[v.itemid] = items[v.itemid] + v.count
	   end
   end
   
   local str = "Otrzymales"
   
   if health > 0 then
      str = str .. " " .. health .. " maxymalnego zdrowia"
   end
   
   if mana > 0 then
      if health > 0 then
	     str = str .. ","
	  end
	  str = str .. " " .. mana .. " maxymalnej many"
   end
   
   local itemsCount = tablelength(items)
   if itemsCount > 0 then
      if health > 0 or mana > 0 then
	     str = str .. ","
	  end
	  str = str .. " "
	  
	  local index = 1
	  for i, v in pairs(items) do
	      doPlayerAddItem(cid, i, v)
		  str = str .. v .. "x " .. getItemNameById(i)
		  if index < itemsCount then
		     str = str .. ", "
		  end
		  index = index + 1
	  end
   end

   str = str .. "."   
   
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, str)
   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, str)
end
	 