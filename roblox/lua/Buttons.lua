local MyButton = _G.MainTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://mamao-five.vercel.app/api/Hub/V1/scripts?name=infiniteYield"))()
    end,
    SectionParent = Section1
})

_G.MainTab:CreateButton({
    Name = "Shop",
    Callback = function()
        warn("no function")
    end,
    SectionParent = Section2
