local config = {
    -- [itemid] = minReborn
    [2400] = 5, -- Przyklad: Magic Sword wymaga 5 rebornow
}

function onEquip(cid, item, slot)
    local minReborn = config[item.itemid]
    if not minReborn then
        return true
    end
    
    if getPlayerReborn(cid) < minReborn then
        doPlayerSendCancel(cid, "Musisz miec co najmniej " .. minReborn .. " rebornow, aby uzywac tej broni.")
        return false
    end
    
    return true
end

function onDeEquip(cid, item, slot)
    return true
end
