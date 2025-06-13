-- Main loader script in Roblox
local base = "https://mamao-five.vercel.app/api/Hub/V1/"

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

_G.Window = loadstring(game:HttpGet(base .. "/Window"))()
_G.MainTab = loadstring(game:HttpGet(base .. "/Tabs"))()
loadstring(game:HttpGet(base .. "/Sections"))()
loadstring(game:HttpGet(base .. "/Dividers"))()
loadstring(game:HttpGet(base .. "/Toggles"))()
loadstring(game:HttpGet(base .. "/Visibility"))()

-- Rayfield:LoadConfiguration() should be inside one of the scripts (probably visibility.lua)
