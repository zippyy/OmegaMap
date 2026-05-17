-- OmegaMap compatibility shims for Midnight / future WoW clients

local _, addonTable = ...

-- Lua 5.1 compatibility helpers removed in newer clients
if not getn then
    getn = table.getn or function(t)
        return #t
    end
end

if not tinsert then
    tinsert = table.insert
end

if not tremove then
    tremove = table.remove
end

-- Defensive wrappers for map APIs that may briefly return nil during loading
OmegaMap_GetBestMapForPlayer = OmegaMap_GetBestMapForPlayer or function()
    if C_Map and C_Map.GetBestMapForUnit then
        return C_Map.GetBestMapForUnit("player")
    end
    return nil
end

OmegaMap_GetPlayerPosition = OmegaMap_GetPlayerPosition or function(mapID)
    if not mapID then
        return nil
    end

    if C_Map and C_Map.GetPlayerMapPosition then
        return C_Map.GetPlayerMapPosition(mapID, "player")
    end

    return nil
end
