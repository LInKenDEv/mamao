-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the Window
local Window = Rayfield:CreateWindow({
    Name = "Mamamo hub",
    LoadingTitle = "Mamamo Hub",
    LoadingSubtitle = "by binebinilobyou",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "mamamoHub",
       FileName = "MyRayfieldConfig"
    },
    Discord = {
       Enabled = false,
       Invite = "",
       RememberJoins = false
    },
    KeySystem = false,
    KeySettings = {
       Title = "Perd's GUI Key",
       Subtitle = "Key System",
       Note = "Ask Perd for the key",
       FileName = "PerdKeyFile",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = "1234"
    }
})

_G.Rayfield = Rayfield
_G.Window = Window
