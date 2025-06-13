local MyButton = _G.MainTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://mamao-five.vercel.app/api/Hub/V1/scripts?name=infiniteYield"))()
    end,
    Flag = "owasa"
})

_G.MainTab:CreateButton({
	Name = "RemoteSpy",
	Callback = function()
		loadstring(game:HttpGet("https://mamao-five.vercel.app/api/Hub/V1/scripts?name=RemoteSpy"))()
	end,
})
