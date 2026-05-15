local amount = 100 -- amount of hp 
local times = 1 -- in sec 
local name = "Mana pet" -- monster name , make sure that the monster is convinced 
 local storage = 6745 -- player who have this storage will be able to use 
local combat = createCombatObject() 
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN) 
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, TRUE) 
  
local function heal(cid) 
            local p = getThingPos(cid) 
            local mana = false 
            if(#getCreatureSummons(cid) >= 1) then 
                for _,pid in ipairs(getCreatureSummons(cid)) do 
                    if string.lower(getCreatureName(pid)) == string.lower(name) then 
                        mana = true  
                        break 
                    end 
                end 
            end 
            if mana == true then 
                doCreatureAddMana(cid,amount) 
                doSendMagicEffect(getThingPos(cid),CONST_ME_MAGIC_BLUE) 
                addEvent(heal,times*1000,cid) 
                    for _,pid in ipairs(getCreatureSummons(cid)) do 
                        if string.lower(getCreatureName(pid)) == string.lower(name) then 
                            doSendMagicEffect(getThingPos(pid),CONST_ME_MAGIC_BLUE) 
                            doSendAnimatedText(getThingPos(pid),"Mana",math.random(1,255)) 
                            break 
                        end 
                    end 
            end 
            return true 
        end 
    local function check(cid) 
                local checked = 0 
                local place = { x=0,y=0,z=0} 
                local h = getThingPos(cid) 
                local frompos = {x=h.x-2,y=h.y-2,z=h.z} 
                local topos = {x=h.x+2,y=h.y+2,z=h.z} 
                for g = frompos.x,topos.x do 
                    for d = frompos.y,topos.y do 
                        local poss = {x=g,y=d,z=h.z} 
                        local tid = getTopCreature(poss).uid 
                        if isMonster(tid) or isPlayer(tid) or getTilePzInfo(poss) == TRUE or doTileQueryAdd(cid, poss) ~= 1 then 
                            checked = checked + 1 
                        else 
                            place.x = poss.x 
                            place.y = poss.y 
                            place.z = poss.z 
                            break 
                        end 
                    end 
                end 
                if checked >= 25 then 
                    return checked 
                elseif checked < 25 then 
                    return place 
                end 
                return true 
            end 
function onCastSpell(cid, var) 
    if getPlayerStorageValue(cid,storage) < 1 then 
        return doPlayerSendCancel(cid,"You cant use this") and doSendMagicEffect(getThingPos(cid),2) and false 
    end 
    local search = false 
    if(#getCreatureSummons(cid) >= 1) then 
        for _,pid in ipairs(getCreatureSummons(cid)) do 
            if string.lower(getCreatureName(pid)) == string.lower(name) then 
                search = true  
                break 
            end 
        end 
    end 
    if search == true then 
        doPlayerSendCancel(cid,"You already have a "..string.lower(name).." summoned.") 
        doSendMagicEffect(getThingPos(cid),2) 
        return false 
    else 
        local f = getThingPos(cid) 
        local pos = {x=f.x+1,y=f.y,z=f.z} 
        if not tonumber(check(cid)) then 
            doConvinceCreature(cid,doSummonCreature(string.lower(name), check(cid))) 
            heal(cid)  
            doCombat(cid,combat,var) 
  
        else 
            doPlayerSendCancel(cid,"You cant summon here.") 
            doSendMagicEffect(getThingPos(cid),2) 
        return false 
        end 
        return true 
    end 
  
    return true 
end  