-- Main loader script in Roblox
local base = "https://mamao-five.vercel.app/api/Hub/V1/"

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

_G.Window = loadstring(game:HttpGet(base .. "/Window.js"))()
_G.MainTab = loadstring(game:HttpGet(base .. "/Tabs.js"))()
loadstring(game:HttpGet(base .. "/Sections.js"))()
loadstring(game:HttpGet(base .. "/Dividers.js"))()
loadstring(game:HttpGet(base .. "/Toggles.js"))()
loadstring(game:HttpGet(base .. "/Visibility.js"))()

-- Rayfield:LoadConfiguration() should be inside one of the scripts (probably visibility.lua)
