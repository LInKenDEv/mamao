-- Add a Toggle to the tab
local MyToggle = _G.MainTab:CreateToggle({
    Name = "Example Toggle",
    CurrentValue = false,
    Flag = "ExampleToggle",
    Callback = function(Value)
        print("Toggle is now:", Value)
    end,
})
