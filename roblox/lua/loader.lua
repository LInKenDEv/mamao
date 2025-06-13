-- Main loader script in Roblox
local base = "https://mamao-five.vercel.app/api/Hub/V1/"

-- Load and execute Window script (this sets up _G.Window and _G.Rayfield)
loadstring(game:HttpGet(base .. "Window"))()

-- Load and execute Tabs script (this sets up _G.MainTab)
loadstring(game:HttpGet(base .. "Tabs"))()

-- Load other components
loadstring(game:HttpGet(base .. "Sections"))()
loadstring(game:HttpGet(base .. "Dividers"))()
loadstring(game:HttpGet(base .. "Toggles"))()
loadstring(game:HttpGet(base .. "Visibility"))()

-- Rayfield:LoadConfiguration() should be inside one of the scripts (probably Visibility.lua)
