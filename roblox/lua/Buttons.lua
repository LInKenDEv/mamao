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
        local button = ESPButton
        local loading = true

        -- Animate the button text in a coroutine
        coroutine.wrap(function()
            local frames = { "Loading", "Loading.", "Loading..", "Loading..." }
            local i = 1
            while loading do
                button:SetName(frames[i])
                i = i % #frames + 1
                task.wait(0.3)
            end
        end)()

        -- Load the ESP script
        local success, err = pcall(function()
            loadstring(game:HttpGet("haha nerd"))()
        end)

        -- Stop animation and update button text
        loading = false
        if success then
            button:SetName("Shop UI Toggled")
        else
            button:SetName("❌ Failed to Load")
            warn("Shop script load failed:", err)
        end
    end,
    SectionParent = Section2
})

