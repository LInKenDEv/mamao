-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the Window
local Window = Rayfield:CreateWindow({
    Name = "Perd's Mobile GUI",
    LoadingTitle = "Perd's Hub",
    LoadingSubtitle = "by Perd",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "PerdHub", -- Change if you want to use a custom folder
       FileName = "MyRayfieldConfig"
    },
    Discord = {
       Enabled = false,
       Invite = "", -- Optional
       RememberJoins = false
    },
    KeySystem = false, -- Set true if you want a key system
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

-- Create a Tab
local MainTab = Window:CreateTab("Main", 4483362458) -- icon is optional

-- Add a Toggle to the tab
local MyToggle = MainTab:CreateToggle({
    Name = "Example Toggle",
    CurrentValue = false,
    Flag = "ExampleToggle", -- unique flag for saving
    Callback = function(Value)
        print("Toggle is now:", Value)
    end,
})

-- Load saved config at the end
Rayfield:LoadConfiguration()
