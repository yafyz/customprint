local RunService = game:GetService("RunService")
local rsCon
local hue
local hueToggle
local printLog = {}
local module = {}

module.initRainbow = coroutine.create(function()
    hueToggle = true
    while hueToggle do
        for i=1,100 do
            hue = Color3.fromHSV(i / 100, 1, 1)
            RunService.Heartbeat:Wait()
        end
    end
end)

function module.shutdownRainbow()
    hueToggle = false
end

function module.print(args)
    local filler
    for _=1, 5 do
        filler = (filler or "") .. string.char(math.floor(math.random() * 94 + 33))
    end
    if args["BeforeText"] then
        args["Text"] = args["BeforeText"] .. args["Text"]
    end
    local strfill = args["Text"] .. filler
    if args["IsWarn"] then
        warn(strfill)
    else
        print(strfill)
    end
    printLog[filler] = args
end

function module.init()
    wait()
    local devCon = game:GetService("CoreGui"):WaitForChild("DevConsoleMaster"):WaitForChild("DevConsoleWindow")
    rsCon = RunService.Heartbeat:Connect(function()
        if not (devCon:FindFirstChild("DevConsoleUI") and devCon.DevConsoleUI:FindFirstChild("MainView")) then
            return
        end
        for _,v in next, devCon.DevConsoleUI.MainView.ClientLog:GetChildren() do
            coroutine.resume(coroutine.create(function()
                local strsub = string.sub(v.msg.Text, #v.msg.Text - 5, #v.msg.Text - 1)
                if not printLog[strsub] then
                    return
                end
                local opt = printLog[strsub]
                if opt then
                    if opt.Color then
                        v.msg.TextColor3 = opt.Color
                    elseif opt.Rainbow then
                        if not opt.RainbowConnected then
                            opt.RainbowConnected = true
                            local rbCon
                            rbCon = RunService.Heartbeat:Connect(function()
                                if not v.Parent then
                                    rbCon:Disconnect()
                                    opt.RainbowConnected = false
                                    return
                                end
                                v.msg.TextColor3 = hue
                            end)
                        end
                    end
                    if not opt.KeepTime then
                        v.msg.Text = opt.Text
                    end
                    if opt.Font then
                        v.msg.Font = opt.Font
                    end
                    if opt.TextSize then
                        v.msg.TextSize = opt.TextSize
                    end
                    if opt.Icon then
                        v.image.Image = opt.Icon
                    end
                end
            end))
        end
    end)
    devCon:WaitForChild("DevConsoleUI")
    devCon.DevConsoleUI:WaitForChild("TopBar")
    devCon.DevConsoleUI.TopBar:WaitForChild("WindowTitle")
    devCon.DevConsoleUI.TopBar.WindowTitle.Text = "Developer Console (using fyz's enhanced print script v1.1)"
end

function module.shutdown()
    rsCon:Disconnect()
    hueToggle = false
end

function module.EasyInit(libname, enableRainbow)
    if getgenv()[libname] then return end
    getgenv()[libname] = module
    
    if getgenv().CustomPrintRunCheck then
        getgenv()[libname] = getgenv().CustomPrintRunCheck
        return
    end

    module.init()
    if enableRainbow then
        coroutine.resume(module.initRainbow)
    end
    getgenv().CustomPrintRunCheck = module
    getgenv().cprint = module.print
end

return module
