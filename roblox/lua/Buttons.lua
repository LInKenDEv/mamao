local MyButton = _G.MainTab:CreateButton({
    Name = "Click Me!",
    Callback = function()
        print("Button was clicked!")
        -- You can replace the line above with any action, like teleport or give item
    end,
    Flag = "owasa" -- not necessary for buttons, but added for completeness
})
