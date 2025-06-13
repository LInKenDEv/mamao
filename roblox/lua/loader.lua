-- ✅ Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ✅ Load Modular GUI Components
loadstring(game:HttpGet("https://your-vercel-url.vercel.app/api/Hub/V1/Window"))()
loadstring(game:HttpGet("https://your-vercel-url.vercel.app/api/Hub/V1/Tabs"))()
loadstring(game:HttpGet("https://your-vercel-url.vercel.app/api/Hub/V1/Toggles"))()

-- ✅ Load saved config
Rayfield:LoadConfiguration()
