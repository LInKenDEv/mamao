-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the Window
local Window = Rayfield:CreateWindow({
    Name = "Perd's Mobile GUI",
    LoadingTitle = "Perd's Hub",
    LoadingSubtitle = "by Perd",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "PerdHub",
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
