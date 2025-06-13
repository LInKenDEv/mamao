local MyButton = _G.MainTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://mamao-five.vercel.app/api/Hub/V1/scripts=infiniteYield"))()
    end,
    Flag = "owasa"
})
