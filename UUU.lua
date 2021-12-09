do local ui = game:GetService("CoreGui"):FindFirstChild("redui")  if ui then ui:Destroy() end end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local tween = game:GetService("TweenService")
local Red = {RainbowColorValue = 0, HueSelectionPosition = 0}
local PresetColor = Color3.fromRGB(66, 134, 255)


coroutine.wrap(function()
        while wait() do
            Red.RainbowColorValue = Red.RainbowColorValue + 1 / 255
            Red.HueSelectionPosition = Red.HueSelectionPosition + 1

            if Red.RainbowColorValue >= 1 then
                Red.RainbowColorValue = 0
            end

            if Red.HueSelectionPosition == 160 then
                Red.HueSelectionPosition = 0
            end
        end
    end)()

local Reduisceen = Instance.new("ScreenGui")
Reduisceen.Parent = game:GetService("CoreGui")
Reduisceen.Name = "redui"
Reduisceen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
            UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
        local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
        Tween:Play()
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

local function Tween(instance, properties,style,wa)
    if style == nil or "" then
        return Back
    end
    tween:Create(instance,TweenInfo.new(wa,Enum.EasingStyle[style]),{properties}):Play()
end

local create = {}
function create:Win(text)
    local fs = false

    local MainSceen = Instance.new("Frame")
    MainSceen.Name = "MainSceen"
    MainSceen.Parent = Reduisceen
    MainSceen.AnchorPoint = Vector2.new(0.5, 0.5)
    MainSceen.BackgroundColor3 = Color3.fromRGB(15,15,15)
    MainSceen.BorderSizePixel = 0
    MainSceen.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainSceen.Size = UDim2.new(0, 0, 0, 0)
    MainSceen.ClipsDescendants = true

    local Main_UiConner  = Instance.new("UICorner")

    Main_UiConner.CornerRadius = UDim.new(0, 4)
    Main_UiConner.Name = "Main_UiConner"
    Main_UiConner.Parent = MainSceen

    local ClickFrame = Instance.new("Frame")
    ClickFrame.Name = "ClickFrame"
    ClickFrame.Parent = MainSceen
    ClickFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    ClickFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ClickFrame.BorderSizePixel = 0
    ClickFrame.Position = UDim2.new(0.5, 0, 0.036, 0)
    ClickFrame.Size = UDim2.new(0, 534-20, 0, 30)
    ClickFrame.ClipsDescendants = true
    ClickFrame.BackgroundTransparency = 1

    MakeDraggable(ClickFrame,MainSceen)
    tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 550, 0, 474)}):Play()

    local library = {toggledui = false;}
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        pcall(function()
            if input.KeyCode == Enum.KeyCode.RightControl then
                if library.toggledui == false then
                    library.toggledui = true
                    tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0, 0, 0, 0)}):Play()
                    wait(.3)
                    Reduisceen.Enabled = false
                else
                    library.toggledui = false
                    tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 534, 0, 474)}):Play()
                    Reduisceen.Enabled = true
                end
            end
        end)
    end)

    local NameReal = Instance.new("TextLabel")

    NameReal.Parent = MainSceen
    NameReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameReal.BackgroundTransparency = 1
    NameReal.BorderSizePixel = 0
    NameReal.Position = UDim2.new(0.5, 0, 0.05, 0)
    NameReal.AnchorPoint = Vector2.new(0.5, 0.5)
    NameReal.Size = UDim2.new(0, 136, 0, 34)
    NameReal.Font = Enum.Font.GothamBold
    NameReal.Text = tostring(text)
    NameReal.TextColor3 = Color3.fromRGB(0, 255, 0)
    NameReal.TextSize = 12.000


    local MainSceen2 = Instance.new("Frame")
    MainSceen2.Name = "MainSceen2"
    MainSceen2.Parent = MainSceen
    MainSceen2.AnchorPoint = Vector2.new(0.5, 0.5)
    MainSceen2.BackgroundColor3 = Color3.fromRGB(18,18,18)
    MainSceen2.BorderSizePixel = 0
    MainSceen2.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainSceen2.Size = UDim2.new(0, 0, 0, 0)
    MainSceen2.ClipsDescendants = true

    local Main_UiConner2  = Instance.new("UICorner")

    Main_UiConner2.CornerRadius = UDim.new(0, 4)
    Main_UiConner2.Name = "Main_UiConner"
    Main_UiConner2.Parent = MainSceen

    MainSceen2:TweenSizeAndPosition(UDim2.new(0, 550-20, 0, 474-50), UDim2.new(0.5, 0, 0.53, 0), "Out", "Back", 0.5, true)


    local ScolTapBarFrame = Instance.new("Frame")
    ScolTapBarFrame.Name = "MainSceen2"
    ScolTapBarFrame.Parent = MainSceen2
    ScolTapBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    ScolTapBarFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
    ScolTapBarFrame.BorderSizePixel = 0
    ScolTapBarFrame.BackgroundTransparency = 1
    ScolTapBarFrame.Position = UDim2.new(0.5, 0, 0.07, 0)
    ScolTapBarFrame.Size = UDim2.new(0, 500, 0, 35)
    ScolTapBarFrame.ClipsDescendants = true

    local ScrollingFrame_Menubar = Instance.new("ScrollingFrame")

    ScrollingFrame_Menubar.Parent = ScolTapBarFrame
    ScrollingFrame_Menubar.Active = true
    ScrollingFrame_Menubar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingFrame_Menubar.BackgroundTransparency = 1
    ScrollingFrame_Menubar.BorderSizePixel = 0
    ScrollingFrame_Menubar.Size = UDim2.new(0, 500, 0, 35)
    ScrollingFrame_Menubar.CanvasSize = UDim2.new(2, 0, 0, 0)
    ScrollingFrame_Menubar.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 0)
    ScrollingFrame_Menubar.ScrollBarThickness = 3


    local UIListLayout_Menubar = Instance.new("UIListLayout")

    UIListLayout_Menubar.Parent = ScrollingFrame_Menubar
    UIListLayout_Menubar.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout_Menubar.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_Menubar.Padding = UDim.new(0, 10)

    local UIPadding_Menubar = Instance.new("UIPadding")

    UIPadding_Menubar.Parent = ScrollingFrame_Menubar
    UIPadding_Menubar.PaddingTop = UDim.new(0, 2)


    local PageOrders = -1

    local Container_Page = Instance.new('Frame',MainSceen2)
    Container_Page.Size = UDim2.new(0, 518, 0, 268)
    Container_Page.Position = UDim2.new(0.5, 0, 0.45, 0)
    Container_Page.BackgroundTransparency = 1
    Container_Page.Name = "Page "
    Container_Page.AnchorPoint = Vector2.new(0.5, 0.5)

    local pagesFolder = Instance.new("Folder")

    pagesFolder.Name = "pagesFolder"
    pagesFolder.Parent = Container_Page


    local UIPage = Instance.new('UIPageLayout',pagesFolder)
    UIPage.SortOrder = Enum.SortOrder.LayoutOrder
    UIPage.EasingDirection = Enum.EasingDirection.InOut
    UIPage.EasingStyle = Enum.EasingStyle.Quad
    UIPage.Padding = UDim.new(0, 10)
    UIPage.TweenTime = 0.500

    local top = {}

    local NotiFrame = Instance.new("Frame")
    NotiFrame.Name = "NotiFrame"
    NotiFrame.Parent = Reduisceen
    NotiFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    NotiFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
    NotiFrame.BorderSizePixel = 0
    NotiFrame.Position =  UDim2.new(1, -210, 1, -500)
    NotiFrame.Size = UDim2.new(0, 400, 0, 500)
    NotiFrame.ClipsDescendants = true
    NotiFrame.BackgroundTransparency = 1


    local Notilistlayout = Instance.new("UIListLayout")
    Notilistlayout.Parent = NotiFrame
    Notilistlayout.SortOrder = Enum.SortOrder.LayoutOrder
    Notilistlayout.Padding = UDim.new(0, 5)


    function create:Notifile(titel,text,delays)
        local TitleFrame = Instance.new("Frame")
        TitleFrame.Name = "TitleFrame"
        TitleFrame.Parent = NotiFrame
        TitleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        TitleFrame.BackgroundColor3 = Color3.fromRGB(18,18,18)
        TitleFrame.BorderSizePixel = 0
        TitleFrame.Position =  UDim2.new(0.5, 0, 0.5,0)
        TitleFrame.Size = UDim2.new(0, 0, 0, 0)
        TitleFrame.ClipsDescendants = true
        TitleFrame.BackgroundTransparency = 0

        local ConnerTitile = Instance.new("UICorner")

        ConnerTitile.CornerRadius = UDim.new(0, 4)
        ConnerTitile.Name = ""
        ConnerTitile.Parent = TitleFrame

        TitleFrame:TweenSizeAndPosition(UDim2.new(0, 400-10, 0, 70),  UDim2.new(0.5, 0, 0.5,0), "Out", "Quad", 0.3, true)

        local imagenoti = Instance.new("ImageLabel")

        imagenoti.Parent = TitleFrame
        imagenoti.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        imagenoti.BackgroundTransparency = 1.000
        imagenoti.AnchorPoint = Vector2.new(0.5, 0.5)
        imagenoti.Position = UDim2.new(0.9, 0, 0.5, 0)
        imagenoti.Size = UDim2.new(0, 50, 0, 50)
    --  imagenoti.Image = "https://www.roblox.com/asset-thumbnail/image?assetId=7578496318&width=0&height=0&format=png"

        local txdlid = Instance.new("TextLabel")

        txdlid.Parent = TitleFrame
        txdlid.Name = "TextLabel_Tap"
        txdlid.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        txdlid.Size =UDim2.new(0, 160, 0,25 )
        txdlid.Font = Enum.Font.GothamBold
        txdlid.Text = titel
        txdlid.TextColor3 = Color3.fromRGB(0, 255, 0)
        txdlid.TextSize = 13.000
        txdlid.AnchorPoint = Vector2.new(0.5, 0.5)
        txdlid.Position = UDim2.new(0.23, 0, 0.3, 0)
        -- txdlid.TextYAlignment = Enum.TextYAlignment.Top
        txdlid.TextXAlignment = Enum.TextXAlignment.Left
        txdlid.BackgroundTransparency = 1

        local LableFrame = Instance.new("Frame")
        LableFrame.Name = "LableFrame"
        LableFrame.Parent = TitleFrame
        LableFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        LableFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        LableFrame.BorderSizePixel = 0
        LableFrame.Position =  UDim2.new(0.36, 0, 0.67,0)
        LableFrame.Size = UDim2.new(0, 260, 0,25 )
        LableFrame.ClipsDescendants = true
        LableFrame.BackgroundTransparency = 1

        local TextNoti = Instance.new("TextLabel")

        TextNoti.Parent = LableFrame
        TextNoti.Name = "TextLabel_Tap"
        TextNoti.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        TextNoti.Size =UDim2.new(0, 260, 0,25 )
        TextNoti.Font = Enum.Font.GothamBold
        TextNoti.Text = text
        TextNoti.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextNoti.TextSize = 13.000
        TextNoti.AnchorPoint = Vector2.new(0.5, 0.5)
        TextNoti.Position = UDim2.new(0.5, 0, 0.5, 0)
        -- TextNoti.TextYAlignment = Enum.TextYAlignment.Top
        TextNoti.TextXAlignment = Enum.TextXAlignment.Left
        TextNoti.BackgroundTransparency = 1

        repeat wait() until TitleFrame.Size == UDim2.new(0, 400-10, 0, 70)

        local Time = Instance.new("Frame")
        Time.Name = "Time"
        Time.Parent = TitleFrame
--Time.AnchorPoint = Vector2.new(0.5, 0.5)
        Time.BackgroundColor3 =  Color3.fromRGB(0, 255, 0)
        Time.BorderSizePixel = 0
        Time.Position =  UDim2.new(0, 0, 0.,0)
        Time.Size = UDim2.new(0, 0,0,0)
        Time.ClipsDescendants = false
        Time.BackgroundTransparency = 0

        local ConnerTitile_Time = Instance.new("UICorner")

        ConnerTitile_Time.CornerRadius = UDim.new(0, 4)
        ConnerTitile_Time.Name = ""
        ConnerTitile_Time.Parent = Time


        Time:TweenSizeAndPosition(UDim2.new(0, 400-10, 0, 3),  UDim2.new(0., 0, 0.,0), "Out", "Quad", 0.3, true)
        repeat wait() until Time.Size == UDim2.new(0, 400-10, 0, 3)

        TweenService:Create(
            Time,
            TweenInfo.new(tonumber(delays), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 0, 0, 3)} -- UDim2.new(0, 128, 0, 25)
        ):Play()
        delay(tonumber(delays),function()
            TweenService:Create(
                TitleFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            wait(0.3)
            TitleFrame:Destroy()
        end
    )
    end


    function top:Taps(text)
        PageOrders = PageOrders + 1
        local name = tostring(text) or tostring(math.random(1,5000))

        local Frame_Tap = Instance.new("Frame")
        Frame_Tap.Parent = ScrollingFrame_Menubar
        Frame_Tap.Name = text.."Server"
        Frame_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame_Tap.BackgroundTransparency = 1
        Frame_Tap.Position = UDim2.new(0.0, 0, 0.0, 0)
        Frame_Tap.Size = UDim2.new(0, 100, 0, 25)
        Frame_Tap.Visible = true

        local TextLabel_Tap = Instance.new("TextLabel")

        TextLabel_Tap.Parent = Frame_Tap
        TextLabel_Tap.Name = "TextLabel_Tap"
        TextLabel_Tap.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        TextLabel_Tap.Position = UDim2.new(0.5, 0, 0.8, 0)
        TextLabel_Tap.Size = UDim2.new(0, 0, 0, 0)
        TextLabel_Tap.Font = Enum.Font.SourceSans
        TextLabel_Tap.Text = " "
        TextLabel_Tap.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel_Tap.TextSize = 14.000
        TextLabel_Tap.AnchorPoint = Vector2.new(0.5, 0.5)

        local TextButton_Tap = Instance.new("TextButton")

        TextButton_Tap.Parent = Frame_Tap
        TextButton_Tap.Name = "TextButton_Tap"
        TextButton_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_Tap.BackgroundTransparency = 1.000
        TextButton_Tap.Position = UDim2.new(0.114491031, 0, -0.0216345787, 0)
        TextButton_Tap.Size = UDim2.new(0, 80, 0, 20)
        TextButton_Tap.Font = Enum.Font.GothamSemibold
        TextButton_Tap.TextColor3 = Color3.fromRGB(155, 155, 155)
        TextButton_Tap.TextSize = 13.000
        TextButton_Tap.Text = tostring(text)

        local MainPage = Instance.new("Frame")

        MainPage.Name = name.."_MainPage"
        MainPage.Parent = pagesFolder
        MainPage.BackgroundColor3 = Color3.fromRGB(255,255, 255)
        MainPage.BorderSizePixel = 0
        MainPage.Position = UDim2.new(0.5, 0, 0.5, 0) -- UDim2.new(0.0149812736, 0, 0.13, 0)
        MainPage.Size = UDim2.new(0, 518, 0, 375)
        MainPage.BackgroundTransparency = 1
        MainPage.ClipsDescendants = true
        MainPage.Visible = true
        MainPage.LayoutOrder = PageOrders




        TextButton_Tap.MouseButton1Click:connect(function()
            if MainPage.Name == text.."_MainPage" then
                UIPage:JumpToIndex(MainPage.LayoutOrder)

            end
            for i ,v in next , ScrollingFrame_Menubar:GetChildren() do
                if v:IsA("Frame") then
                    TweenService:Create(
                        v.TextButton_Tap,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(155, 155, 155)}
                    ):Play()
                end

                TweenService:Create(
                    TextButton_Tap,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(0, 255, 0)}
                ):Play()
            end
        end)

        if fs == false then
            -- TweenService:Create(
            --     TextLabel_Tap,
            --     TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            --     {Size = UDim2.new(0, 70, 0, 2)}
            -- ):Play()
            TweenService:Create(
                TextButton_Tap,
                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(0, 255, 0)}
            ):Play()

            MainPage.Visible = true
            Frame_Tap.Name  = text .. "Server"
            fs  = true
        end
        local ScrollingFrame_Pagefrist = Instance.new("ScrollingFrame")

        ScrollingFrame_Pagefrist.Parent = MainPage
        ScrollingFrame_Pagefrist.Active = true
        ScrollingFrame_Pagefrist.BackgroundColor3 = Color3.fromRGB(23, 23, 23) -- 0, 255, 0
        ScrollingFrame_Pagefrist.BorderSizePixel = 0
        ScrollingFrame_Pagefrist.Size = UDim2.new(0, 518, 0, 375)
        ScrollingFrame_Pagefrist.ScrollBarThickness = 4
        ScrollingFrame_Pagefrist.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 0) -- 0, 255, 0

        local UIGridLayout_Pagefrist = Instance.new("UIGridLayout")
        local UIPadding_Pagefrist = Instance.new("UIPadding")

        UIGridLayout_Pagefrist.Archivable = false
        UIGridLayout_Pagefrist.Parent = ScrollingFrame_Pagefrist
        UIGridLayout_Pagefrist.SortOrder = Enum.SortOrder.LayoutOrder
        UIGridLayout_Pagefrist.CellPadding = UDim2.new(0, 13, 0, 15)
        UIGridLayout_Pagefrist.CellSize = UDim2.new(0, 240, 0, 370)

        UIPadding_Pagefrist.Parent = ScrollingFrame_Pagefrist
        UIPadding_Pagefrist.PaddingLeft = UDim.new(0, 10)
        UIPadding_Pagefrist.PaddingTop = UDim.new(0, 20)

        local page = {}

        function page:newpage()

            local Pageframe = Instance.new("Frame")


            Pageframe.Parent = ScrollingFrame_Pagefrist
            Pageframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Pageframe.BorderSizePixel = 0
            Pageframe.Position = UDim2.new(0.028957529, 0, 0.0496277921, 0)
            Pageframe.Size = UDim2.new(0, 240, 0, 379)


            local ScrollingFrame_Pageframe = Instance.new("ScrollingFrame")


            ScrollingFrame_Pageframe.Parent = Pageframe
            ScrollingFrame_Pageframe.Active = true
            ScrollingFrame_Pageframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            ScrollingFrame_Pageframe.BorderSizePixel = 0
            ScrollingFrame_Pageframe.Position = UDim2.new(0, 0, -0.0101253344, 0)
            ScrollingFrame_Pageframe.Size = UDim2.new(0, 240, 0, 379)
            ScrollingFrame_Pageframe.ScrollBarThickness = 4
            ScrollingFrame_Pageframe.ScrollBarImageColor3 = Color3.fromRGB(222, 222, 222)



            local UIPadding_Pageframe = Instance.new("UIPadding")
            local UIListLayout_Pageframe = Instance.new("UIListLayout")


            UIPadding_Pageframe.Parent = ScrollingFrame_Pageframe
            UIPadding_Pageframe.PaddingLeft = UDim.new(0, 15)
            UIPadding_Pageframe.PaddingTop = UDim.new(0, 10)


            UIListLayout_Pageframe.Parent = ScrollingFrame_Pageframe
            UIListLayout_Pageframe.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_Pageframe.Padding = UDim.new(0, 7)

            UIListLayout_Pageframe:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y + 120 )
            end)

            UIGridLayout_Pagefrist:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 50 )
            end)

            game:GetService("RunService").Stepped:Connect(function ()
                pcall(function ()
                    ScrollingFrame_Menubar.CanvasSize = UDim2.new(0,  UIListLayout_Menubar.AbsoluteContentSize.X, 0,0)
                    ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,UIListLayout_Pageframe.AbsoluteContentSize.Y +20 )
                    ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 40)
                end)
            end)
        local items = {}

        function items:Toggle(text,config,callback)
            local Toggle = Instance.new("Frame")

            Toggle.Parent = ScrollingFrame_Pageframe
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.BorderSizePixel = 0
            Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
            Toggle.Size = UDim2.new(0, 213, 0, 35)
            Toggle.BackgroundTransparency = 1
            Toggle.AnchorPoint = Vector2.new(0.5, 0.5)

            local TextButton_Toggle = Instance.new("TextButton")

            TextButton_Toggle.Parent = Toggle
            TextButton_Toggle.BackgroundTransparency = 1
            TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            TextButton_Toggle.BorderSizePixel = 0
            TextButton_Toggle.Size = UDim2.new(0, 213, 0, 35)
            TextButton_Toggle.AutoButtonColor = false
            TextButton_Toggle.Font = Enum.Font.SourceSans
            TextButton_Toggle.Text = " "
            TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_Toggle.TextSize = 12.000

            local TextButton_2_Toggle = Instance.new("TextButton")

            TextButton_2_Toggle.Parent = TextButton_Toggle
            TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
    --        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(0, 255, 0)
            TextButton_2_Toggle.BorderSizePixel = 0
            TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_2_Toggle.Position = UDim2.new(0.9, 0, 0.5, 0)
            TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
            TextButton_2_Toggle.Font = Enum.Font.SourceSans
            TextButton_2_Toggle.Text = " "
            TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_2_Toggle.TextSize = 12.000
            TextButton_2_Toggle.AutoButtonColor = false

            local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner.Name = ""
            TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

            local TextButton_3_Toggle = Instance.new("TextButton")

            TextButton_3_Toggle.Parent = TextButton_2_Toggle
            TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255,255)
    --        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(0, 255, 0)
            TextButton_3_Toggle.BorderSizePixel = 0
            TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
            TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
            TextButton_3_Toggle.Font = Enum.Font.SourceSans
            TextButton_3_Toggle.Text = " "
            TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_3_Toggle.TextSize = 12.000
            TextButton_3_Toggle.AutoButtonColor = false

            local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner2.Name = ""
            TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

            local TextButton_4_Toggle = Instance.new("TextButton")

            TextButton_4_Toggle.Parent = TextButton_3_Toggle
            TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
    --        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(0, 255, 0)
            TextButton_4_Toggle.BorderSizePixel = 0
            TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
            TextButton_4_Toggle.Font = Enum.Font.SourceSans
            TextButton_4_Toggle.Text = " "
            TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_4_Toggle.TextSize = 12.000
            TextButton_4_Toggle.AutoButtonColor = false
            TextButton_4_Toggle.BackgroundTransparency = 1
            TextButton_4_Toggle.Visible = true

            local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner4.Name = ""
            TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle

            local TextLabel_Toggle = Instance.new("TextLabel")

            TextLabel_Toggle.Parent = Toggle
            TextLabel_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_Toggle.BackgroundTransparency = 1
            TextLabel_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel_Toggle.Position = UDim2.new(0.4, 0, 0.5, 0)
            TextLabel_Toggle.BorderSizePixel = 0
            TextLabel_Toggle.Size = UDim2.new(0, 130, 0, 25)
            TextLabel_Toggle.Font = Enum.Font.GothamSemibold
            TextLabel_Toggle.Text = text
            TextLabel_Toggle.TextColor3 = Color3.fromRGB(200, 200, 200)
            TextLabel_Toggle.TextSize = 13.000
            TextLabel_Toggle.ClipsDescendants = true
            TextLabel_Toggle.TextWrapped = true
            TextLabel_Toggle.TextXAlignment = Enum.TextXAlignment.Left

            local TextButton_Toggle2 = Instance.new("TextButton")

            TextButton_Toggle2.Parent = TextButton_Toggle
            TextButton_Toggle2.BackgroundTransparency =1
            TextButton_Toggle2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            TextButton_Toggle2.BorderSizePixel = 0
            TextButton_Toggle2.Size = UDim2.new(0, 213, 0, 35)
            TextButton_Toggle2.AutoButtonColor = false
            TextButton_Toggle2.Font = Enum.Font.SourceSans
            TextButton_Toggle2.Text = " "
            TextButton_Toggle2.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_Toggle2.TextSize = 12.000

            TextButton_Toggle2.MouseEnter:Connect(function()
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextLabel_Toggle,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        TextButton_Toggle2.MouseLeave:Connect(function()
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextLabel_Toggle,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(200, 200, 200)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        local check = {toogle = false ; loacker = true ; togfunction = {

        };
    }
    TextButton_Toggle2.MouseButton1Click:Connect(function()
            if check.toogle == false and check.loacker == true  then
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(0, 255, 0)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(0, 255, 0)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(153, 255, 153)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            elseif  check.loacker ==  true then
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            end
            if  check.loacker == true  then
            check.toogle = not check.toogle
            callback(check.toogle)
            end
        end
    )

        if config == true then
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(0, 255, 0)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_3_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(0, 255, 0)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextButton_2_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 =  Color3.fromRGB(153, 255, 153)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            check.toogle = true
            callback(check.toogle)
        end

        local lockerframe = Instance.new("Frame")

        lockerframe.Name = "lockerframe"
        lockerframe.Parent = Toggle
        lockerframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        lockerframe.BackgroundTransparency = 1
        lockerframe.Size = UDim2.new(0, 320, 0, 35)
        lockerframe.Position = UDim2.new(0.5, 0, 0.5, 0)
        lockerframe.AnchorPoint = Vector2.new(0.5, 0.5)

        local LockerImageLabel = Instance.new("ImageLabel")
        LockerImageLabel.Parent = lockerframe
        LockerImageLabel.BackgroundTransparency = 1.000
        LockerImageLabel.BorderSizePixel = 0
        LockerImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        LockerImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        LockerImageLabel.Size = UDim2.new(0, 0, 0, 0)
        LockerImageLabel.Image = "http://www.roblox.com/asset/?id=6031082533"


        function check.togfunction:lock()
            TweenService:Create(
                lockerframe,
                TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                {BackgroundTransparency = 0.7}
            ):Play()
            TweenService:Create(
                LockerImageLabel,
                TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                {Size = UDim2.new(0, 30, 0, 30)}
            ):Play()

            check.loacker  = false
        --    pcall(callback,locker)
        end
        function check.togfunction:unlock()
            TweenService:Create(
                lockerframe,
                TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                {BackgroundTransparency = 1}
            ):Play()
            TweenService:Create(
                LockerImageLabel,
                TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
                {Size = UDim2.new(0, 0, 0, 0)}
            ):Play()
            check.loacker  = true
        --   pcall(callback,locker)
        end

            return  check.togfunction
        end

        function items:Button(text,callback)

            local ButtonFrame = Instance.new("Frame")

            ButtonFrame.Name = "ButtonFrame"
            ButtonFrame.Parent = ScrollingFrame_Pageframe
            ButtonFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            ButtonFrame.BorderSizePixel = 0
            ButtonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            ButtonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonFrame.Size = UDim2.new(0, 213, 0, 25) -- UDim2.new(0, 213, 0, 35)
            ButtonFrame.BackgroundTransparency  = 1
            ButtonFrame.ClipsDescendants = true



            local MheeFrameStroke = Instance.new("UIStroke")

            MheeFrameStroke.Thickness = 0
            MheeFrameStroke.Name = ""
            MheeFrameStroke.Parent = ButtonFrame
            MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            MheeFrameStroke.Color = Color3.fromRGB(0, 255, 0)
            MheeFrameStroke.Transparency = 0.7

            local Button = Instance.new("TextButton")

            Button.Parent = ButtonFrame
            Button.Name = "Button"
            Button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            Button.Size = UDim2.new(0,150, 0, 25)
            Button.Font = Enum.Font.SourceSansSemibold
            Button.Text = tostring(text)
            Button.TextColor3 = Color3.fromRGB(155, 155, 155)
            Button.TextSize = 13.000
            Button.AnchorPoint = Vector2.new(0.5, 0.5)
            Button.Position = UDim2.new(0.5, 0, 0.5, 0)
            Button.TextXAlignment = Enum.TextXAlignment.Center
            Button.BackgroundTransparency = 0.6
            Button.TextWrapped = true
            Button.AutoButtonColor = false
            Button.ClipsDescendants = true

            local ConnerPageMhee = Instance.new("UICorner")

            ConnerPageMhee.CornerRadius = UDim.new(0, 4)
            ConnerPageMhee.Name = ""
            ConnerPageMhee.Parent = Button

            Button.MouseEnter:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size =  UDim2.new(0, 213, 0, 25)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )
            Button.MouseLeave:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size =  UDim2.new(0, 150, 0, 25)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        Button.MouseButton1Click:Connect(function()
        --    Ripple(Button)
            callback()
            TweenService:Create(
                Button,
                TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                {TextSize =  16} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            wait(0.1)
            TweenService:Create(
                Button,
                TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                {TextSize =  13} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

        end

        function items:Slider(text,check,floor,min,max,de,lol,tog,callback)

        if check then

            local SliderFrame = Instance.new("Frame")

            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = ScrollingFrame_Pageframe
            SliderFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)-- Color3.fromRGB(0, 255, 0)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            SliderFrame.Size = UDim2.new(0, 213, 0, 75) -- UDim2.new(0, 213, 0, 35)
            SliderFrame.BackgroundTransparency  = 0
            SliderFrame.ClipsDescendants = true

            local SliderFrameConner = Instance.new("UICorner")

            SliderFrameConner.CornerRadius = UDim.new(0, 4)
            SliderFrameConner.Name = ""
            SliderFrameConner.Parent = SliderFrame

            local SliderFrameStroke = Instance.new("UIStroke")

            SliderFrameStroke.Thickness = 1
            SliderFrameStroke.Name = ""
            SliderFrameStroke.Parent = SliderFrame
            SliderFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            SliderFrameStroke.Color = Color3.fromRGB(0, 255, 0)
            SliderFrameStroke.Transparency = 0.7


            SliderFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    SliderFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

            SliderFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    SliderFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )


            local LabelNameSliderxd = Instance.new("TextLabel")

            LabelNameSliderxd.Parent = SliderFrame
            LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelNameSliderxd.BackgroundTransparency = 1
            LabelNameSliderxd.BorderSizePixel = 0
            LabelNameSliderxd.Position = UDim2.new(0.35, 0, 0.2, 0)
            LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelNameSliderxd.Size = UDim2.new(0, 120, 0, 20)
            LabelNameSliderxd.Font = Enum.Font.GothamBold
            LabelNameSliderxd.Text = tostring(text)
            LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
            LabelNameSliderxd.TextSize = 11.000
            LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Left


            local ShowValueFarm = Instance.new("Frame")

            ShowValueFarm.Name = "ShowValueFarm"
            ShowValueFarm.Parent = SliderFrame
            ShowValueFarm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ShowValueFarm.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            ShowValueFarm.Size = UDim2.new(0, 75, 0, 15)
            ShowValueFarm.BackgroundTransparency = 0
            ShowValueFarm.BorderSizePixel = 0
            ShowValueFarm.AnchorPoint = Vector2.new(0.5, 0.5)
            ShowValueFarm.Position = UDim2.new(0.8, 0, 0.2, 0)
            ShowValueFarm.ClipsDescendants = false

            local CustomValue = Instance.new("TextBox")

            CustomValue.Parent = ShowValueFarm
            CustomValue.BackgroundColor3 = Color3.fromRGB(45,45, 45)
            CustomValue.BorderSizePixel = 0
            CustomValue.ClipsDescendants = true
            CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
            CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
            CustomValue.Size = UDim2.new(0, 158, 0, 26)
            CustomValue.Font = Enum.Font.GothamSemibold
            CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
            CustomValue.PlaceholderText =  ""
            if floor == true then
                CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
            else
                CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
            end
            CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            CustomValue.TextSize = 8.000
            CustomValue.BackgroundTransparency = 1

            local ValueFrame = Instance.new("Frame")

            ValueFrame.Name = "ValueFrame"
            ValueFrame.Parent = SliderFrame
            ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ValueFrame.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            ValueFrame.Size = UDim2.new(0, 140, 0, 5)
            ValueFrame.BackgroundTransparency = 0
            ValueFrame.BorderSizePixel = 0
            ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            ValueFrame.Position = UDim2.new(0.4, 0, 0.8, 0)
            ValueFrame.ClipsDescendants = false


            local PartValue = Instance.new("Frame")

            PartValue.Name = "PartValue"
            PartValue.Parent = ValueFrame
            PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
            PartValue.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            PartValue.Size = UDim2.new(0, 140, 0, 5)
            PartValue.BackgroundTransparency = 1
            PartValue.BorderSizePixel = 0
            PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
            PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
            PartValue.ClipsDescendants = false

            local MainValue = Instance.new("Frame")

            MainValue.Name = "MainValue"
            MainValue.Parent = PartValue
            MainValue.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
            MainValue.BackgroundTransparency = 0
            MainValue.BorderSizePixel = 0
            -- MainValue.AnchorPoint = Vector2.new(0.5, 0.5)
            MainValue.Position = UDim2.new(0., 0, 0.0, 0)
            MainValue.ClipsDescendants = false

            local Conner_S1 = Instance.new("UICorner")

            Conner_S1.CornerRadius = UDim.new(0, 8)
            Conner_S1.Name = ""
            Conner_S1.Parent = MainValue

            local Conner_S2 = Instance.new("UICorner")

            Conner_S2.CornerRadius = UDim.new(0, 8)
            Conner_S2.Name = ""
            Conner_S2.Parent = ValueFrame

            local ConneValue = Instance.new("Frame")

            ConneValue.Name = "ConneValue"
            ConneValue.Parent = PartValue
            ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ConneValue.Size = UDim2.new(0, 13, 0,13)
            ConneValue.BackgroundTransparency = 0
            ConneValue.BorderSizePixel = 0
            ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
            ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.3,0.5, 0)
            ConneValue.ClipsDescendants = false


            local Conner_Conne = Instance.new("UICorner")

            Conner_Conne.CornerRadius = UDim.new(0, 300)
            Conner_Conne.Name = ""
            Conner_Conne.Parent = ConneValue

            local Addvalue = Instance.new("ImageButton")

            Addvalue.Name = "Imatog"
            Addvalue.Parent = SliderFrame
            Addvalue.BackgroundTransparency = 1.000
            Addvalue.BorderSizePixel = 0
            Addvalue.Position = UDim2.new(0.85, 0, 0.35, 0)
            Addvalue.Size = UDim2.new(0, 15, 0, 15)
            Addvalue.Image = "http://www.roblox.com/asset/?id=6035067836"
            Addvalue.ImageColor3 =  Color3.fromRGB(0, 255, 0)

            local Deletevalue = Instance.new("ImageButton")

            Deletevalue.Name = "Imatog"
            Deletevalue.Parent = SliderFrame
            Deletevalue.BackgroundTransparency = 1.000
            Deletevalue.BorderSizePixel = 0
            Deletevalue.Position = UDim2.new(0.7, 0, 0.35, 0)
            Deletevalue.Size = UDim2.new(0, 15, 0, 15)
            Deletevalue.Image = "http://www.roblox.com/asset/?id=6035047377"
            Deletevalue.ImageColor3 =  Color3.fromRGB(0, 255, 0)


            local TextButton_2_Toggle = Instance.new("TextButton")

            TextButton_2_Toggle.Parent = ValueFrame
            TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
    --        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(0, 255, 0)
            TextButton_2_Toggle.BorderSizePixel = 0
            TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_2_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)
            TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
            TextButton_2_Toggle.Font = Enum.Font.SourceSans
            TextButton_2_Toggle.Text = " "
            TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_2_Toggle.TextSize = 12.000
            TextButton_2_Toggle.AutoButtonColor = false

            local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner.Name = ""
            TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

            local TextButton_3_Toggle = Instance.new("TextButton")

            TextButton_3_Toggle.Parent = TextButton_2_Toggle
            TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255,255)
    --        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(0, 255, 0)
            TextButton_3_Toggle.BorderSizePixel = 0
            TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
            TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
            TextButton_3_Toggle.Font = Enum.Font.SourceSans
            TextButton_3_Toggle.Text = " "
            TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_3_Toggle.TextSize = 12.000
            TextButton_3_Toggle.AutoButtonColor = false

            local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner2.Name = ""
            TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

            local TextButton_4_Toggle = Instance.new("TextButton")

            TextButton_4_Toggle.Parent = TextButton_3_Toggle
            TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
    --        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(0, 255, 0)
            TextButton_4_Toggle.BorderSizePixel = 0
            TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
            TextButton_4_Toggle.Font = Enum.Font.SourceSans
            TextButton_4_Toggle.Text = " "
            TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_4_Toggle.TextSize = 12.000
            TextButton_4_Toggle.AutoButtonColor = false
            TextButton_4_Toggle.BackgroundTransparency = 1
            TextButton_4_Toggle.Visible = true

            local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
            TextButton_Pageframe_Uiconner4.Name = ""
            TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle


            local TextButton_Toggle = Instance.new("TextButton")

            TextButton_Toggle.Parent = ValueFrame
            TextButton_Toggle.BackgroundTransparency =1
            TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_Toggle.BorderSizePixel = 0
            TextButton_Toggle.Size = UDim2.new(0, 50, 0, 20)
            TextButton_Toggle.AutoButtonColor = false
            TextButton_Toggle.Font = Enum.Font.SourceSans
            TextButton_Toggle.Text = " "
            TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_Toggle.TextSize = 12.000
            TextButton_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)



        -- local value = de
        local check2 = {toogle2 = false;}
            local function move(input)
                local pos =
                    UDim2.new(
                        math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                        0,
                        0.3,
                        0
                    )
                local pos1 =
                    UDim2.new(
                        math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                        0,
                        0,
                        5
                    )

                    MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

                    ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                    if floor == true then
                        local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
                        CustomValue.Text = tostring(value)
                    --   callback[2] = value
                    callback({
                        ["s"] = value;
                        ["t"] = check2.toogle2
                    })
                    --callback({value,check2.toogle2})
                        --callback(value)
                    else
                        local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                        CustomValue.Text = tostring(value)
                        callback({
                            ["s"] = value;
                            ["t"] = check2.toogle2
                        })
                --       callback({value,check2.toogle2})

                    end



                end

                local dragging = false
                ConneValue.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                ConneValue.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )
                SliderFrame.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                SliderFrame.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )


                ValueFrame.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                ValueFrame.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )

                game:GetService("UserInputService").InputChanged:Connect(
                    function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                            move(input)
                        end
                    end
                    )

                    CustomValue.FocusLost:Connect(function()
                        if CustomValue.Text == "" then
                            CustomValue.Text  = de
                        end
                        if  tonumber(CustomValue.Text) > max then
                            CustomValue.Text  = max
                        end
                        if  tonumber(CustomValue.Text) <= min then
                            CustomValue.Text  = min
                        end
                        MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                        ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0, 0) , "Out", "Sine", 0.2, true)
                        if floor == true then
                            CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                        else
                            CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                        end
                        callback({
                            ["s"] =  CustomValue.Text;
                            ["t"] = check2.toogle2;
                        })
                --       callback({ tonumber(CustomValue.Text),check2.toogle2})
                --  pcall(callback, CustomValue.Text)
                    end)


                    Addvalue.MouseButton1Click:Connect(function ()
                        if CustomValue.Text == "" then
                            CustomValue.Text  = de
                        end
                        pcall(function()
                            CustomValue.Text  = CustomValue.Text  - tonumber(lol)
                        end)
                        if  tonumber(CustomValue.Text) > max then
                            CustomValue.Text  = max
                        end
                        if  tonumber(CustomValue.Text) < min then
                            CustomValue.Text  = min
                        end
                        MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                        ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                        if floor == true then
                            CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                        else
                            CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                        end
                        callback({
                            ["s"] =  CustomValue.Text;
                            ["t"] = check2.toogle2
                        })
                    --   callback({ tonumber(CustomValue.Text),check2.toogle2})
                    --  pcall(callback, CustomValue.Text)
                    end)

                    Deletevalue.MouseButton1Click:Connect(function ()
                        if CustomValue.Text == "" then
                            CustomValue.Text  = de
                        end
                        pcall(function()
                            CustomValue.Text  = CustomValue.Text  + tonumber(lol)
                        end)
                        if  tonumber(CustomValue.Text) > max then
                            CustomValue.Text  = max
                        end
                        if  tonumber(CustomValue.Text) < min then
                            CustomValue.Text  = min
                        end
                        MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                        ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                        if floor == true then
                            CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                        else
                            CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                        end
                        callback({
                            ["s"] =  CustomValue.Text;
                            ["t"] = check2.toogle2;
                        })
            --callback({ tonumber(CustomValue.Text),check2.toogle2})
                    --  pcall(callback, CustomValue.Text)
                    end)




            ---
                    TextButton_Toggle.MouseEnter:Connect(function()
                        TweenService:Create(
                            TextButton_4_Toggle,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                    end
                )

                TextButton_Toggle.MouseLeave:Connect(function()
                        TweenService:Create(
                            TextButton_4_Toggle,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
                        ):Play()
                    end
                )



            TextButton_Toggle.MouseButton1Click:Connect(function()
                if check2.toogle2 == false   then
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(0, 255, 0)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_3_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(0, 255, 0)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_2_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(153, 255, 153)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                else
                    TweenService:Create(
                        TextButton_4_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_3_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        TextButton_2_Toggle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                end
                    check2.toogle2 = not check2.toogle2
                    callback({
                        ["t"] = check2.toogle2;

                    })
                --   callback({value,check2.toogle2})
                    --callback(check2.toogle2)
            end
        )

            if tog == true then
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(0, 255, 0)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(0, 255, 0)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(153, 255, 153)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
                check2.toogle2 = true
                callback({
                    ["t"] = check2.toogle2;
                })
        --        callback({value,check2.toogle2})
            --  callback(check2.toogle2)
            end


        else
            tog = nil
            local SliderFrame = Instance.new("Frame")

            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = ScrollingFrame_Pageframe
            SliderFrame.BackgroundColor3 =  Color3.fromRGB(28, 28, 28)-- Color3.fromRGB(0, 255, 0)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            SliderFrame.Size = UDim2.new(0, 213, 0, 75) -- UDim2.new(0, 213, 0, 35)
            SliderFrame.BackgroundTransparency  = 0
            SliderFrame.ClipsDescendants = true

            local SliderFrameConner = Instance.new("UICorner")

            SliderFrameConner.CornerRadius = UDim.new(0, 4)
            SliderFrameConner.Name = ""
            SliderFrameConner.Parent = SliderFrame

            local SliderFrameStroke = Instance.new("UIStroke")

            SliderFrameStroke.Thickness = 1
            SliderFrameStroke.Name = ""
            SliderFrameStroke.Parent = SliderFrame
            SliderFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            SliderFrameStroke.Color = Color3.fromRGB(0, 255, 0)
            SliderFrameStroke.Transparency = 0.7



            SliderFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    SliderFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

            SliderFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    SliderFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

            local LabelNameSliderxd = Instance.new("TextLabel")

            LabelNameSliderxd.Parent = SliderFrame
            LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelNameSliderxd.BackgroundTransparency = 1
            LabelNameSliderxd.BorderSizePixel = 0
            LabelNameSliderxd.Position = UDim2.new(0.35, 0, 0.2, 0)
            LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelNameSliderxd.Size = UDim2.new(0, 120, 0, 20)
            LabelNameSliderxd.Font = Enum.Font.GothamBold
            LabelNameSliderxd.Text = tostring(text)
            LabelNameSliderxd.TextColor3 = Color3.fromRGB(255, 255, 255)
            LabelNameSliderxd.TextSize = 11.000
            LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Left


            local ShowValueFarm = Instance.new("Frame")

            ShowValueFarm.Name = "ShowValueFarm"
            ShowValueFarm.Parent = SliderFrame
            ShowValueFarm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ShowValueFarm.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            ShowValueFarm.Size = UDim2.new(0, 75, 0, 15)
            ShowValueFarm.BackgroundTransparency = 0
            ShowValueFarm.BorderSizePixel = 0
            ShowValueFarm.AnchorPoint = Vector2.new(0.5, 0.5)
            ShowValueFarm.Position = UDim2.new(0.8, 0, 0.2, 0)
            ShowValueFarm.ClipsDescendants = false

            local CustomValue = Instance.new("TextBox")

            CustomValue.Parent = ShowValueFarm
            CustomValue.BackgroundColor3 = Color3.fromRGB(45,45, 45)
            CustomValue.BorderSizePixel = 0
            CustomValue.ClipsDescendants = true
            CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
            CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
            CustomValue.Size = UDim2.new(0, 158, 0, 26)
            CustomValue.Font = Enum.Font.GothamSemibold
            CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
            CustomValue.PlaceholderText =  ""
            if floor == true then
                CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
            else
                CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
            end
            CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            CustomValue.TextSize = 8.000
            CustomValue.BackgroundTransparency = 1

            local ValueFrame = Instance.new("Frame")

            ValueFrame.Name = "ValueFrame"
            ValueFrame.Parent = SliderFrame
            ValueFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ValueFrame.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            ValueFrame.Size = UDim2.new(0, 190, 0, 5)
            ValueFrame.BackgroundTransparency = 0
            ValueFrame.BorderSizePixel = 0
            ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            ValueFrame.Position = UDim2.new(0.5, 0, 0.8, 0)
            ValueFrame.ClipsDescendants = false


            local PartValue = Instance.new("Frame")

            PartValue.Name = "PartValue"
            PartValue.Parent = ValueFrame
            PartValue.BackgroundColor3 = Color3.fromRGB(222, 222, 222)
            PartValue.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            PartValue.Size = UDim2.new(0, 190, 0, 5)
            PartValue.BackgroundTransparency = 1
            PartValue.BorderSizePixel = 0
            PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
            PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
            PartValue.ClipsDescendants = false

            local MainValue = Instance.new("Frame")

            MainValue.Name = "MainValue"
            MainValue.Parent = PartValue
            MainValue.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
            MainValue.BackgroundTransparency = 0
            MainValue.BorderSizePixel = 0
            -- MainValue.AnchorPoint = Vector2.new(0.5, 0.5)
            MainValue.Position = UDim2.new(0., 0, 0.0, 0)
            MainValue.ClipsDescendants = false

            local Conner_S1 = Instance.new("UICorner")

            Conner_S1.CornerRadius = UDim.new(0, 8)
            Conner_S1.Name = ""
            Conner_S1.Parent = MainValue

            local Conner_S2 = Instance.new("UICorner")

            Conner_S2.CornerRadius = UDim.new(0, 8)
            Conner_S2.Name = ""
            Conner_S2.Parent = ValueFrame

            local ConneValue = Instance.new("Frame")

            ConneValue.Name = "ConneValue"
            ConneValue.Parent = PartValue
            ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ConneValue.Size = UDim2.new(0, 13, 0,13)
            ConneValue.BackgroundTransparency = 0
            ConneValue.BorderSizePixel = 0
            ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
            ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.3,0.5, 0)
            ConneValue.ClipsDescendants = false


            local Conner_Conne = Instance.new("UICorner")

            Conner_Conne.CornerRadius = UDim.new(0, 300)
            Conner_Conne.Name = ""
            Conner_Conne.Parent = ConneValue

            local Addvalue = Instance.new("ImageButton")

            Addvalue.Name = "Imatog"
            Addvalue.Parent = SliderFrame
            Addvalue.BackgroundTransparency = 1.000
            Addvalue.BorderSizePixel = 0
            Addvalue.Position = UDim2.new(0.85, 0, 0.35, 0)
            Addvalue.Size = UDim2.new(0, 15, 0, 15)
            Addvalue.Image = "http://www.roblox.com/asset/?id=6035067836"
            Addvalue.ImageColor3 =  Color3.fromRGB(0, 255, 0)

            local Deletevalue = Instance.new("ImageButton")

            Deletevalue.Name = "Imatog"
            Deletevalue.Parent = SliderFrame
            Deletevalue.BackgroundTransparency = 1.000
            Deletevalue.BorderSizePixel = 0
            Deletevalue.Position = UDim2.new(0.7, 0, 0.35, 0)
            Deletevalue.Size = UDim2.new(0, 15, 0, 15)
            Deletevalue.Image = "http://www.roblox.com/asset/?id=6035047377"
            Deletevalue.ImageColor3 =  Color3.fromRGB(0, 255, 0)

            local function move(input)
                local pos =
                    UDim2.new(
                        math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                        0,
                        0.3,
                        0
                    )
                local pos1 =
                    UDim2.new(
                        math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                        0,
                        0,
                        5
                    )

                    MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

                    ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
                    if floor == true then
                        local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
                        CustomValue.Text = tostring(value)
                        callback(value)
                    else
                        local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                        CustomValue.Text = tostring(value)
                        callback(value)
                    end



                end

                local dragging = false
                ConneValue.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                ConneValue.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )
                SliderFrame.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                SliderFrame.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )


                ValueFrame.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true

                        end
                    end
                )
                ValueFrame.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false

                        end
                    end
                )

                game:GetService("UserInputService").InputChanged:Connect(
                    function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                            move(input)
                        end
                    end
                    )

                    CustomValue.FocusLost:Connect(function()
                        if CustomValue.Text == "" then
                            CustomValue.Text  = de
                        end
                        if  tonumber(CustomValue.Text) > max then
                            CustomValue.Text  = max
                        end
                        MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                        ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0, 0) , "Out", "Sine", 0.2, true)
                        if floor == true then
                            CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                        else
                            CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                        end
                        pcall(callback, CustomValue.Text)
                    end)


            Addvalue.MouseButton1Click:Connect(function ()
                if CustomValue.Text == "" then
                    CustomValue.Text  = de
                end
                CustomValue.Text  = CustomValue.Text  - tonumber(lol)
                if  tonumber(CustomValue.Text) > max then
                    CustomValue.Text  = max
                end
                if  tonumber(CustomValue.Text) < min then
                    CustomValue.Text  = min
                end
                MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                if floor == true then
                    CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                else
                    CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                end
                pcall(callback, CustomValue.Text)
            end)

            Deletevalue.MouseButton1Click:Connect(function ()
                if CustomValue.Text == "" then
                    CustomValue.Text  = de
                end
                CustomValue.Text  = CustomValue.Text  + tonumber(lol)
                if  tonumber(CustomValue.Text) > max then
                    CustomValue.Text  = max
                end
                if  tonumber(CustomValue.Text) < min then
                    CustomValue.Text  = min
                end
                MainValue:TweenSize(UDim2.new((CustomValue.Text  or 0  ) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
                ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
                if floor == true then
                    CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
                else
                    CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
                end
                pcall(callback, CustomValue.Text)
            end)

        end

        end

        function items:Drop(text,use,option,callback)

        if use == false then
            local DropFrame = Instance.new("Frame")

            DropFrame.Name = "DropFrame"
            DropFrame.Parent = ScrollingFrame_Pageframe
            DropFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)-- Color3.fromRGB(0, 255, 0)
            DropFrame.BorderSizePixel = 0
            DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            DropFrame.Size = UDim2.new(0, 213, 0, 30) -- UDim2.new(0, 213, 0, 35)
            DropFrame.BackgroundTransparency  = 0
            DropFrame.ClipsDescendants = true

            local ConnerDropFrame = Instance.new("UICorner")

            ConnerDropFrame.CornerRadius = UDim.new(0, 4)
            ConnerDropFrame.Name = ""
            ConnerDropFrame.Parent = DropFrame

            local DropFrameStroke = Instance.new("UIStroke")

            DropFrameStroke.Thickness = 1
            DropFrameStroke.Name = ""
            DropFrameStroke.Parent = DropFrame
            DropFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            DropFrameStroke.Color = Color3.fromRGB(0, 255, 0)
            DropFrameStroke.Transparency = 0.7





            local LabelFrameDrop = Instance.new("TextLabel")

            LabelFrameDrop.Parent = DropFrame
            LabelFrameDrop.Name = "LabelFrameDrop"
            LabelFrameDrop.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            LabelFrameDrop.Position = UDim2.new(0., 0, 0., 0)
            LabelFrameDrop.Size =    UDim2.new(0, 213, 0, 30)
            LabelFrameDrop.Font = Enum.Font.SourceSansSemibold
            LabelFrameDrop.Text = ""
            LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
            LabelFrameDrop.TextSize = 14.000
        --   LabelFrameDrop.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelFrameDrop.BackgroundTransparency = 1
            LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left


            local TextLabel_TapDrop = Instance.new("TextLabel")

            TextLabel_TapDrop.Parent = LabelFrameDrop
            TextLabel_TapDrop.Name = "TextLabel_TapDrop"
            TextLabel_TapDrop.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            TextLabel_TapDrop.Position = UDim2.new(0.04, 0, 0.14, 0)
            TextLabel_TapDrop.Size =    UDim2.new(0, 140, 0, 20)
            TextLabel_TapDrop.Font = Enum.Font.SourceSansSemibold
            TextLabel_TapDrop.Text = tostring(text).." :"
            TextLabel_TapDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
            TextLabel_TapDrop.TextSize = 14.000
    --     TextLabel_TapDrop.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel_TapDrop.BackgroundTransparency = 1
            TextLabel_TapDrop.TextXAlignment = Enum.TextXAlignment.Left


            local DropArbt_listimage = Instance.new("ImageButton")

            DropArbt_listimage.Parent = LabelFrameDrop
            DropArbt_listimage.BackgroundTransparency = 1.000
            DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
            DropArbt_listimage.Position = UDim2.new(0.9, 0, 0.5, 0)
            DropArbt_listimage.BorderSizePixel = 0
            DropArbt_listimage.Size = UDim2.new(0, 25, 0, 25)
            DropArbt_listimage.Image = "http://www.roblox.com/asset/?id=6031091004"
            DropArbt_listimage.ImageColor3 = Color3.fromRGB(155, 155, 155)

            local ScolDown = Instance.new("ScrollingFrame")

            ScolDown.Name = "ScolDown"
            ScolDown.Position = UDim2.new(0.02, 0, 1., 0)
            ScolDown.Parent = LabelFrameDrop
            ScolDown.Active = true
            ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ScolDown.BorderSizePixel = 0
            ScolDown.Size = UDim2.new(0, 205, 0, 115)
            ScolDown.ScrollBarThickness = 3
            ScolDown.ClipsDescendants = true
            ScolDown.BackgroundTransparency = 1
            ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)

            local UIListLayoutlist = Instance.new("UIListLayout")
            local UIPaddinglist = Instance.new("UIPadding")

            UIListLayoutlist.Name = "UIListLayoutlist"
            UIListLayoutlist.Parent = ScolDown
            UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayoutlist.Padding = UDim.new(0, 5)

            UIPaddinglist.Name = "UIPaddinglist"
            UIPaddinglist.Parent = ScolDown
            UIPaddinglist.PaddingTop = UDim.new(0, 5)
            UIPaddinglist.PaddingLeft = UDim.new(0, 12)

            local ButtonDrop = Instance.new("TextButton")

            ButtonDrop.Parent = DropFrame
            ButtonDrop.Name = "ButtonDrop"
            ButtonDrop.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            ButtonDrop.Size = UDim2.new(0, 213, 0, 30)
            ButtonDrop.Font = Enum.Font.SourceSansSemibold
            ButtonDrop.Text = ""
            ButtonDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
            ButtonDrop.TextSize = 13.000
        --   ButtonDrop.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonDrop.Position = UDim2.new(0., 0, 0., 0)
            ButtonDrop.TextXAlignment = Enum.TextXAlignment.Center
            ButtonDrop.BackgroundTransparency = 1
            ButtonDrop.TextWrapped = true
            ButtonDrop.AutoButtonColor = false
            ButtonDrop.ClipsDescendants = true

            local dog = false

            local FrameSize = 75
            local cout = 0
            for i , v in pairs(option) do
                cout =cout + 1
                if cout == 1 then
                    FrameSize = 75
                elseif cout == 2 then
                    FrameSize = 110
                elseif cout >= 3 then
                    FrameSize = 150
                end

                local ListFrame = Instance.new("Frame")

                ListFrame.Name = "ListFrame"
                ListFrame.Parent = ScolDown
                ListFrame.BackgroundColor3 =  Color3.fromRGB(22553, 23, 23)-- Color3.fromRGB(0, 255, 0)
                ListFrame.BorderSizePixel = 0
                ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                ListFrame.Size = UDim2.new(0, 180, 0, 30) -- UDim2.new(0, 213, 0, 35)
                ListFrame.BackgroundTransparency  = 1
                ListFrame.ClipsDescendants = true

                local TextLabel_TapDro2p = Instance.new("TextLabel")

                TextLabel_TapDro2p.Parent = ListFrame
                TextLabel_TapDro2p.Name =  tostring(v).."Dropdown"
                TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                TextLabel_TapDro2p.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextLabel_TapDro2p.Size =  UDim2.new(0, 180, 0, 30)
                TextLabel_TapDro2p.Font = Enum.Font.SourceSansSemibold
                TextLabel_TapDro2p.Text = tostring(v)
                TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(155, 155, 155)
                TextLabel_TapDro2p.TextSize = 14.000
                TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel_TapDro2p.BackgroundTransparency = 1
                TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Center

                local ButtonDrop2 = Instance.new("TextButton")

                ButtonDrop2.Parent = ListFrame
                ButtonDrop2.Name = "ButtonDrop2"
                ButtonDrop2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                ButtonDrop2.Size = UDim2.new(0, 213, 0, 30)
                ButtonDrop2.Font = Enum.Font.SourceSansSemibold
                ButtonDrop2.Text = ""
                ButtonDrop2.TextColor3 = Color3.fromRGB(155, 155, 155)
                ButtonDrop2.TextSize = 13.000
            --   ButtonDrop2.AnchorPoint = Vector2.new(0.5, 0.5)
                ButtonDrop2.Position = UDim2.new(0., 0, 0., 0)
                ButtonDrop2.TextXAlignment = Enum.TextXAlignment.Center
                ButtonDrop2.BackgroundTransparency = 1
                ButtonDrop2.TextWrapped = true
                ButtonDrop2.AutoButtonColor = false
                ButtonDrop2.ClipsDescendants = true

                ButtonDrop2.MouseEnter:Connect(function ()
                    TweenService:Create(
                        TextLabel_TapDro2p,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end)

                ButtonDrop2.MouseLeave:Connect(function ()
                    TweenService:Create(
                        TextLabel_TapDro2p,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                end)

                ButtonDrop2.MouseButton1Click:Connect(function()
                    TweenService:Create(
                        DropFrame,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                    ):Play()
                    TweenService:Create(
                        DropArbt_listimage,
                        TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                        {Rotation = 0}
                    ):Play()
                    TextLabel_TapDrop.Text =  text.." : "..tostring(v)
                    callback(v)
                    dog = not dog
                end
            )


                ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
            end


            DropFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    DropFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextLabel_TapDrop,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        DropFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    DropFrameStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextLabel_TapDrop,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )


        ButtonDrop.MouseButton1Click:Connect(function()
            if dog == false then
                TweenService:Create(
                    DropFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = -180}
                ):Play()
                ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
            else
                TweenService:Create(
                    DropFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = 0}
                ):Play()
                ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
            end
            dog = not dog
        end
    )
    ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )

        local dropfunc = {}

        function dropfunc:Clear()
            TextLabel_TapDrop.Text = tostring(text).." :"
            for i, v in next, ScolDown:GetChildren() do
                if v:IsA("Frame") then
                    v:Destroy()
                end
            end
            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end

        function dropfunc:Add(t)
            local ListFrame = Instance.new("Frame")

            ListFrame.Name = "ListFrame"
            ListFrame.Parent = ScolDown
            ListFrame.BackgroundColor3 =  Color3.fromRGB(22553, 23, 23)-- Color3.fromRGB(0, 255, 0)
            ListFrame.BorderSizePixel = 0
            ListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            ListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            ListFrame.Size = UDim2.new(0, 180, 0, 30) -- UDim2.new(0, 213, 0, 35)
            ListFrame.BackgroundTransparency  = 1
            ListFrame.ClipsDescendants = true

            local TextLabel_TapDro2p = Instance.new("TextLabel")

            TextLabel_TapDro2p.Parent = ListFrame
            TextLabel_TapDro2p.Name =  tostring(t).."Dropdown"
            TextLabel_TapDro2p.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            TextLabel_TapDro2p.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextLabel_TapDro2p.Size =  UDim2.new(0, 180, 0, 30)
            TextLabel_TapDro2p.Font = Enum.Font.SourceSansSemibold
            TextLabel_TapDro2p.Text = tostring(t)
            TextLabel_TapDro2p.TextColor3 = Color3.fromRGB(155, 155, 155)
            TextLabel_TapDro2p.TextSize = 14.000
            TextLabel_TapDro2p.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel_TapDro2p.BackgroundTransparency = 1
            TextLabel_TapDro2p.TextXAlignment = Enum.TextXAlignment.Center

            local ButtonDrop2 = Instance.new("TextButton")

            ButtonDrop2.Parent = ListFrame
            ButtonDrop2.Name = "ButtonDrop2"
            ButtonDrop2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            ButtonDrop2.Size = UDim2.new(0, 213, 0, 30)
            ButtonDrop2.Font = Enum.Font.SourceSansSemibold
            ButtonDrop2.Text = ""
            ButtonDrop2.TextColor3 = Color3.fromRGB(155, 155, 155)
            ButtonDrop2.TextSize = 13.000
        --   ButtonDrop2.AnchorPoint = Vector2.new(0.5, 0.5)
            ButtonDrop2.Position = UDim2.new(0., 0, 0., 0)
            ButtonDrop2.TextXAlignment = Enum.TextXAlignment.Center
            ButtonDrop2.BackgroundTransparency = 1
            ButtonDrop2.TextWrapped = true
            ButtonDrop2.AutoButtonColor = false
            ButtonDrop2.ClipsDescendants = true

            ButtonDrop2.MouseEnter:Connect(function ()
                TweenService:Create(
                    TextLabel_TapDro2p,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end)

            ButtonDrop2.MouseLeave:Connect(function ()
                TweenService:Create(
                    TextLabel_TapDro2p,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end)

            ButtonDrop2.MouseButton1Click:Connect(function()
                TweenService:Create(
                    DropFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    DropArbt_listimage,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = 0}
                ):Play()
                TextLabel_TapDrop.Text =  text.." : "..tostring(t)
                callback(t)
                dog = not dog
            end
        )

            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end
        return dropfunc

    else

        local location = option.location or self.flags
        local flag = not use and option.flag or ""
        local callback = callback or function() end
        local list = option.list or {}
        local default = list.default or list[1].Name

        if not use then
            location[flag] = default
        end


        local DropFrame = Instance.new("Frame")

        DropFrame.Name = "DropFrame"
        DropFrame.Parent = ScrollingFrame_Pageframe
        DropFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)-- Color3.fromRGB(0, 255, 0)
        DropFrame.BorderSizePixel = 0
        DropFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        DropFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        DropFrame.Size = UDim2.new(0, 213, 0, 30) -- UDim2.new(0, 213, 0, 35)
        DropFrame.BackgroundTransparency  = 0
        DropFrame.ClipsDescendants = true

        local ConnerDropFrame = Instance.new("UICorner")

        ConnerDropFrame.CornerRadius = UDim.new(0, 4)
        ConnerDropFrame.Name = ""
        ConnerDropFrame.Parent = DropFrame

        local DropFrameStroke = Instance.new("UIStroke")

        DropFrameStroke.Thickness = 1
        DropFrameStroke.Name = ""
        DropFrameStroke.Parent = DropFrame
        DropFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        DropFrameStroke.Color = Color3.fromRGB(0, 255, 0)
        DropFrameStroke.Transparency = 0.7





        local LabelFrameDrop = Instance.new("TextLabel")

        LabelFrameDrop.Parent = DropFrame
        LabelFrameDrop.Name = "LabelFrameDrop"
        LabelFrameDrop.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        LabelFrameDrop.Position = UDim2.new(0., 0, 0., 0)
        LabelFrameDrop.Size =    UDim2.new(0, 213, 0, 30)
        LabelFrameDrop.Font = Enum.Font.SourceSansSemibold
        LabelFrameDrop.Text = ""
        LabelFrameDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
        LabelFrameDrop.TextSize = 14.000
    --   LabelFrameDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelFrameDrop.BackgroundTransparency = 1
        LabelFrameDrop.TextXAlignment = Enum.TextXAlignment.Left


        local TextLabel_TapDrop = Instance.new("TextLabel")

        TextLabel_TapDrop.Parent = LabelFrameDrop
        TextLabel_TapDrop.Name = "TextLabel_TapDrop"
        TextLabel_TapDrop.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        TextLabel_TapDrop.Position = UDim2.new(0.04, 0, 0.14, 0)
        TextLabel_TapDrop.Size =    UDim2.new(0, 140, 0, 20)
        TextLabel_TapDrop.Font = Enum.Font.SourceSansSemibold
        TextLabel_TapDrop.Text = tostring(text).." :"
        TextLabel_TapDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
        TextLabel_TapDrop.TextSize = 14.000
--     TextLabel_TapDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel_TapDrop.BackgroundTransparency = 1
        TextLabel_TapDrop.TextXAlignment = Enum.TextXAlignment.Left


        local DropArbt_listimage = Instance.new("ImageButton")

        DropArbt_listimage.Parent = LabelFrameDrop
        DropArbt_listimage.BackgroundTransparency = 1.000
        DropArbt_listimage.AnchorPoint = Vector2.new(0.5, 0.5)
        DropArbt_listimage.Position = UDim2.new(0.9, 0, 0.5, 0)
        DropArbt_listimage.BorderSizePixel = 0
        DropArbt_listimage.Size = UDim2.new(0, 25, 0, 25)
        DropArbt_listimage.Image = "http://www.roblox.com/asset/?id=6031091004"
        DropArbt_listimage.ImageColor3 = Color3.fromRGB(155, 155, 155)

        local ScolDown = Instance.new("ScrollingFrame")

        ScolDown.Name = "ScolDown"
        ScolDown.Position = UDim2.new(0.02, 0, 1., 0)
        ScolDown.Parent = LabelFrameDrop
        ScolDown.Active = true
        ScolDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScolDown.BorderSizePixel = 0
        ScolDown.Size = UDim2.new(0, 205, 0, 115)
        ScolDown.ScrollBarThickness = 3
        ScolDown.ClipsDescendants = true
        ScolDown.BackgroundTransparency = 1
        ScolDown.CanvasSize = UDim2.new(0, 0, 0, 2)

        local UIListLayoutlist = Instance.new("UIListLayout")
        local UIPaddinglist = Instance.new("UIPadding")

        UIListLayoutlist.Name = "UIListLayoutlist"
        UIListLayoutlist.Parent = ScolDown
        UIListLayoutlist.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayoutlist.Padding = UDim.new(0, 5)

        UIPaddinglist.Name = "UIPaddinglist"
        UIPaddinglist.Parent = ScolDown
        UIPaddinglist.PaddingTop = UDim.new(0, 5)
        UIPaddinglist.PaddingLeft = UDim.new(0, 12)

        local ButtonDrop = Instance.new("TextButton")

        ButtonDrop.Parent = DropFrame
        ButtonDrop.Name = "ButtonDrop"
        ButtonDrop.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        ButtonDrop.Size = UDim2.new(0, 213, 0, 30)
        ButtonDrop.Font = Enum.Font.SourceSansSemibold
        ButtonDrop.Text = ""
        ButtonDrop.TextColor3 = Color3.fromRGB(155, 155, 155)
        ButtonDrop.TextSize = 13.000
    --   ButtonDrop.AnchorPoint = Vector2.new(0.5, 0.5)
        ButtonDrop.Position = UDim2.new(0., 0, 0., 0)
        ButtonDrop.TextXAlignment = Enum.TextXAlignment.Center
        ButtonDrop.BackgroundTransparency = 1
        ButtonDrop.TextWrapped = true
        ButtonDrop.AutoButtonColor = false
        ButtonDrop.ClipsDescendants = true

        local dog = false

        local FrameSize = 75
        local cout = 0
        for i , v in pairs(list) do
            cout =cout + 1
            if cout == 1 then
                FrameSize = 75
            elseif cout == 2 then
                FrameSize = 110
            elseif cout >= 3 then
                FrameSize = 150
            end

            local listtog = Instance.new("Frame")

            listtog.Name = "listtog"
            listtog.Parent = ScolDown
            listtog.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            listtog.BackgroundTransparency =1
            listtog.BorderSizePixel = 0
            listtog.ClipsDescendants = true
            listtog.AnchorPoint = Vector2.new(0.5, 0.5)
            listtog.Position = UDim2.new(0.5, 0, 0.5, 0)
            listtog.Size = UDim2.new(0, 210, 0, 33)


            local listtextbutton = Instance.new("TextButton")

            listtextbutton.Parent = listtog
            listtextbutton.BackgroundTransparency =1
            listtextbutton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            listtextbutton.BorderSizePixel = 0
            listtextbutton.Size =  UDim2.new(0, 210, 0, 33)
            listtextbutton.AutoButtonColor = false
            listtextbutton.Font = Enum.Font.SourceSans
            listtextbutton.Text = " "
            listtextbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
            listtextbutton.TextSize = 14.000

            local farmtoglist = Instance.new("TextButton")

            farmtoglist.Parent = listtextbutton
            farmtoglist.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            farmtoglist.BorderColor3 = Color3.fromRGB(0, 255, 0)
            farmtoglist.BorderSizePixel = 0
            farmtoglist.AnchorPoint = Vector2.new(0.5, 0.5)
            farmtoglist.Position = UDim2.new(0.1, 0, 0.5, 0)
            farmtoglist.Size = UDim2.new(0, 23, 0, 23)
            farmtoglist.Font = Enum.Font.SourceSans
            farmtoglist.Text = " "
            farmtoglist.TextColor3 = Color3.fromRGB(0, 0, 0)
            farmtoglist.TextSize = 14.000
            farmtoglist.AutoButtonColor = false


            local farmtoglist2 = Instance.new("TextButton")

            farmtoglist2.Parent = farmtoglist
            farmtoglist2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
            farmtoglist2.BorderColor3 = Color3.fromRGB(0, 255, 0)
            farmtoglist2.BorderSizePixel = 0
            farmtoglist2.AnchorPoint = Vector2.new(0.5, 0.5)
            farmtoglist2.Position = UDim2.new(0.5, 0, 0.5, 0)
            farmtoglist2.Size = UDim2.new(0, 21, 0, 21)
            farmtoglist2.Font = Enum.Font.SourceSans
            farmtoglist2.Text = " "
            farmtoglist2.TextColor3 = Color3.fromRGB(0, 0, 0)
            farmtoglist2.TextSize = 14.000
            farmtoglist2.AutoButtonColor = false


            local listimage = Instance.new("ImageButton")

            listimage.Parent = farmtoglist2
            listimage.BackgroundTransparency = 1.000
            listimage.AnchorPoint = Vector2.new(0.5, 0.5)
            listimage.Position = UDim2.new(0.5, 0, 0.5, 0)
            listimage.BorderSizePixel = 0
            listimage.Size = UDim2.new(0, 0, 0, 0)
            listimage.Image = "http://www.roblox.com/asset/?id=5880482965"


            local textlist = Instance.new("TextLabel")


            textlist.Parent = listtextbutton
            textlist.Name = "textlist"
            textlist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            textlist.BackgroundTransparency = 1.000
            textlist.AnchorPoint = Vector2.new(0.5, 0.5)
            textlist.Position = UDim2.new(0.5, 0, 0.5, 0)
            textlist.BorderSizePixel = 0
            textlist.Size = UDim2.new(0, 91, 0, 25)
            textlist.Font = Enum.Font.GothamSemibold
            textlist.Text = tostring(v.Name)
            textlist.TextColor3 = Color3.fromRGB(255, 255, 255)
            textlist.TextSize = 13.000



            local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 5)
            TextButton_Pageframe_Uiconner2.Name = ""
            TextButton_Pageframe_Uiconner2.Parent = farmtoglist

            local TextButton_Pageframe_Uiconner22 = Instance.new("UICorner")

            TextButton_Pageframe_Uiconner22.CornerRadius = UDim.new(0, 5)
            TextButton_Pageframe_Uiconner22.Name = ""
            TextButton_Pageframe_Uiconner22.Parent = farmtoglist2



            listtextbutton.MouseButton1Click:Connect(function()
                if not  location[v.flag] then
                    listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                    wait(0.1)
                    listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                else
                    listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                    wait(0.1)
                    listimage:TweenSizeAndPosition(UDim2.new(0, 0, 0, 0), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
                end
                location[v.flag] = not location[v.flag]
                callback(location[v.flag])
            end
        )

        if  location[v.flag] then
            listimage:TweenSizeAndPosition(UDim2.new(0, 30, 0, 30), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)
            wait(0.1)
            listimage:TweenSizeAndPosition(UDim2.new(0, 23, 0, 23), UDim2.new(0.5, 0, 0.5, 0), "In", "Bounce", 0.1, true)

            callback(location[v.flag])
        end

            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end


        DropFrame.MouseEnter:Connect(function()
            TweenService:Create(
                DropFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_TapDrop,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {ImageColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    DropFrame.MouseLeave:Connect(function()
            TweenService:Create(
                DropFrameStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextLabel_TapDrop,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {ImageColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )


    ButtonDrop.MouseButton1Click:Connect(function()
        if dog == false then
            TweenService:Create(
                DropFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, FrameSize)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Rotation = -180}
            ):Play()
            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        else
            TweenService:Create(
                DropFrame,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                DropArbt_listimage,
                TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Rotation = 0}
            ):Play()
            ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )
        end
        dog = not dog
    end
)
ScolDown.CanvasSize = UDim2.new(0,0,0,UIListLayoutlist.AbsoluteContentSize.Y + 10  )



        end



        end

        function items:TextBox(text,text2,callback)
            local TextFrame = Instance.new("Frame")

            TextFrame.Name = "TextFrame"
            TextFrame.Parent = ScrollingFrame_Pageframe
            TextFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
            TextFrame.BorderSizePixel = 0
            TextFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            TextFrame.Size = UDim2.new(0, 213, 0, 70)
            TextFrame.BackgroundTransparency  = 1
            TextFrame.ClipsDescendants = true

            local LabelNameSliderxd = Instance.new("TextLabel")

            LabelNameSliderxd.Parent = TextFrame
            LabelNameSliderxd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelNameSliderxd.BackgroundTransparency = 1
            LabelNameSliderxd.BorderSizePixel = 0
            LabelNameSliderxd.Position = UDim2.new(0.5, 0, 0.2, 0)
            LabelNameSliderxd.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelNameSliderxd.Size = UDim2.new(0, 160, 0, 20)
            LabelNameSliderxd.Font = Enum.Font.GothamBold
            LabelNameSliderxd.Text = tostring(text)
            LabelNameSliderxd.TextColor3 = Color3.fromRGB(155, 155, 155)
            LabelNameSliderxd.TextSize = 11.000
            LabelNameSliderxd.TextXAlignment = Enum.TextXAlignment.Center

            local ConerTextBox = Instance.new("UICorner")

            ConerTextBox.CornerRadius = UDim.new(0, 4)
            ConerTextBox.Name = ""
            ConerTextBox.Parent = TextFrame

            local FrameBox = Instance.new("Frame")

            FrameBox.Name = "TextFrame"
            FrameBox.Parent = TextFrame
            FrameBox.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
            FrameBox.BorderSizePixel = 0
            FrameBox.Position = UDim2.new(0.5, 0, 0.65, 0)
            FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)
            FrameBox.Size = UDim2.new(0, 158, 0, 30)
            FrameBox.BackgroundTransparency  = 0.2
            FrameBox.ClipsDescendants = true
            FrameBox.AnchorPoint = Vector2.new(0.5, 0.5)

            local TextFrame2 = Instance.new("TextBox")

            TextFrame2.Parent = FrameBox
            TextFrame2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            TextFrame2.BorderSizePixel = 0
            TextFrame2.ClipsDescendants = true
            TextFrame2.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
            TextFrame2.Size = UDim2.new(0, 158, 0, 35)
            TextFrame2.Font = Enum.Font.GothamSemibold
            TextFrame2.PlaceholderColor3 = Color3.fromRGB(155, 155, 155)
            TextFrame2.PlaceholderText = text2
            TextFrame2.Text = ""
            TextFrame2.TextColor3 = Color3.fromRGB(155, 155, 155)
            TextFrame2.TextSize = 12.000
            TextFrame2.BackgroundTransparency = 1

            local ConerTextBox2 = Instance.new("UICorner")

            ConerTextBox2.CornerRadius = UDim.new(0, 4)
            ConerTextBox2.Name = ""
            ConerTextBox2.Parent = FrameBox

            local TextBoxStroke = Instance.new("UIStroke")

            TextBoxStroke.Thickness = 1
            TextBoxStroke.Name = ""
            TextBoxStroke.Parent = FrameBox
            TextBoxStroke.LineJoinMode = Enum.LineJoinMode.Round
            TextBoxStroke.Color = Color3.fromRGB(0, 255, 0)
            TextBoxStroke.Transparency = 0.7


            TextFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    FrameBox,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 30)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    FrameBox,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(0, 255, 0)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextFrame2,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {PlaceholderColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextFrame2,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelNameSliderxd,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextBoxStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Thickness = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

        TextFrame.MouseLeave:Connect(function()
            TweenService:Create(
                FrameBox,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 158, 0, 30)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                FrameBox,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(23, 23, 23)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextFrame2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {PlaceholderColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextBoxStroke,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Thickness = 1} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                LabelNameSliderxd,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
            TweenService:Create(
                TextFrame2,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
        )
            TextFrame2.FocusLost:Connect(function ()
                if #TextFrame2.Text > 0 then
                    pcall(callback,TextFrame2.Text)
                end
            end)
        end

        function items:Bind(text,bi,callback)
            local BindFrame = Instance.new("Frame")

            BindFrame.Name = "BindFrame"
            BindFrame.Parent = ScrollingFrame_Pageframe
            BindFrame.BackgroundColor3 =  Color3.fromRGB(23, 23, 23)
            BindFrame.BorderSizePixel = 0
            BindFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            BindFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            BindFrame.Size = UDim2.new(0, 213, 0, 35)
            BindFrame.BackgroundTransparency  = 0
            BindFrame.ClipsDescendants = true

            local BindConner = Instance.new("UICorner")

            BindConner.CornerRadius = UDim.new(0, 4)
            BindConner.Name = ""
            BindConner.Parent = BindFrame

            local BindStroke = Instance.new("UIStroke")

            BindStroke.Thickness = 1
            BindStroke.Name = ""
            BindStroke.Parent = BindFrame
            BindStroke.LineJoinMode = Enum.LineJoinMode.Round
            BindStroke.Color = Color3.fromRGB(0, 255, 0)
            BindStroke.Transparency = 0.7

            local LabelBind = Instance.new("TextLabel")

            LabelBind.Parent = BindFrame
            LabelBind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelBind.BackgroundTransparency = 1
            LabelBind.BorderSizePixel = 0
            LabelBind.Position = UDim2.new(0.4, 0, 0.5, 0)
            LabelBind.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelBind.Size = UDim2.new(0, 140, 0, 35)
            LabelBind.Font = Enum.Font.GothamBold
            LabelBind.Text = tostring(text)
            LabelBind.TextColor3 = Color3.fromRGB(155, 155, 155)
            LabelBind.TextSize = 11.000
            LabelBind.TextXAlignment = Enum.TextXAlignment.Left

            local key = bi.Name
            local LabelBind2 = Instance.new("TextButton")

            LabelBind2.Parent = BindFrame
            LabelBind2.Name = "LabelBind2"
            LabelBind2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelBind2.Size = UDim2.new(0, 100, 0, 19)
            LabelBind2.Font = Enum.Font.GothamBold
            LabelBind2.Text =  "KEY : "..key
            LabelBind2.TextColor3 = Color3.fromRGB(155, 155, 155)
            LabelBind2.TextSize = 11.000
            LabelBind2.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelBind2.Position = UDim2.new(0.75, 0, 0.5, 0)
            LabelBind2.TextXAlignment = Enum.TextXAlignment.Center
            LabelBind2.BackgroundTransparency = 1
            LabelBind2.TextWrapped = true

            local LabelBind22 = Instance.new("TextButton")

            LabelBind22.Parent = BindFrame
            LabelBind22.Name = "LabelBind22"
            LabelBind22.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LabelBind22.Size = UDim2.new(0, 213, 0, 35)
            LabelBind22.Font = Enum.Font.GothamBold
            LabelBind22.Text =  ""
            LabelBind22.TextColor3 = Color3.fromRGB(155, 155, 155)
            LabelBind22.TextSize = 11.000
            LabelBind22.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelBind22.Position = UDim2.new(0.5, 0, 0.5, 0)
            LabelBind22.TextXAlignment = Enum.TextXAlignment.Center
            LabelBind22.BackgroundTransparency = 1
            LabelBind22.TextWrapped = true

            BindFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    BindStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind22,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind2,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )
            BindFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    BindStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.7} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind22,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind2,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    LabelBind,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
            end
        )

            LabelBind22.MouseButton1Click:Connect(function ()


                LabelBind2.Text = "KEY : ".."..."
                local inputwait = game:GetService("UserInputService").InputBegan:wait()
                local fuckulop = inputwait.KeyCode == Enum.KeyCode.Unknown and inputwait.UserInputType or inputwait.KeyCode

                if
                fuckulop.Name ~= "Focus" and fuckulop.Name ~= "MouseMovement" and fuckulop.Name ~= "Focus"
                then
                    LabelBind2.Text =  "KEY : "..fuckulop.Name
                    key = fuckulop.Name
                end
                -- if fuckulop.Name ~= "Unknown" then
                --     LabelBind2.Text = fuckulop.Name
                --     key = fuckulop.Name
                -- end

            end)


            game:GetService("UserInputService").InputBegan:connect(
                function(current)
                    local fuckulop2 = current.KeyCode == Enum.KeyCode.Unknown and current.UserInputType or current.KeyCode

                        if fuckulop2.Name ==  key then
                            pcall(callback)

                    end
                end
                )

        end

        function items:Line()
            local LineFrame = Instance.new("Frame")

            LineFrame.Name = "LineFrame"
            LineFrame.Parent = ScrollingFrame_Pageframe
            LineFrame.BackgroundColor3 =  Color3.fromRGB(0, 255, 0)
            LineFrame.BorderSizePixel = 0
            LineFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            LineFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            LineFrame.Size = UDim2.new(0, 213, 0, 1)
            LineFrame.BackgroundTransparency  = 0
            LineFrame.ClipsDescendants = true

            local LineFrame_BindConner = Instance.new("UICorner")

            LineFrame_BindConner.CornerRadius = UDim.new(0, 30)
            LineFrame_BindConner.Name = ""
            LineFrame_BindConner.Parent = LineFrame

        end

        function items:Color(text,preset,callback)
            local Pixker = Instance.new("Frame")

            Pixker.Name = "Pixker"
            Pixker.Parent = ScrollingFrame_Pageframe
            Pixker.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            Pixker.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
            Pixker.Size = UDim2.new(0, 213, 0, 33)
            Pixker.BackgroundTransparency = 0
            Pixker.BorderSizePixel = 0
            Pixker.AnchorPoint = Vector2.new(0.5, 0.5)
            Pixker.Position = UDim2.new(0.5, 0, 0.5, 0)
            Pixker.ClipsDescendants = true


            local BoxColorCorner2 = Instance.new("UICorner")

            BoxColorCorner2.CornerRadius = UDim.new(0, 4)
            BoxColorCorner2.Name = "BoxColorCorner"
            BoxColorCorner2.Parent = Pixker

            local MheeFrameStroke = Instance.new("UIStroke")

            MheeFrameStroke.Thickness = 1
            MheeFrameStroke.Name = ""
            MheeFrameStroke.Parent = Pixker
            MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
            MheeFrameStroke.Color = Color3.fromRGB(0, 255, 0)
            MheeFrameStroke.Transparency = 0.7


            local TextFrameColor = Instance.new("TextLabel")

            TextFrameColor.Parent = Pixker
            TextFrameColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextFrameColor.BorderSizePixel = 0
            TextFrameColor.Size = UDim2.new(0, 200, 0, 34)
            TextFrameColor.Font = Enum.Font.SourceSans
            TextFrameColor.Text = "  "
            TextFrameColor.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextFrameColor.TextSize = 14.000
            TextFrameColor.BackgroundTransparency = 1
            TextFrameColor.Position = UDim2.new(0., 0, 0., 0)

            local TextReal = Instance.new("TextLabel")

            TextReal.Parent = TextFrameColor
            TextReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextReal.BorderSizePixel = 0
            TextReal.Size = UDim2.new(0, 140, 0, 34)
            TextReal.Font = Enum.Font.GothamSemibold
            TextReal.Text = text
            TextReal.TextColor3 = Color3.fromRGB(155,155, 155)
            TextReal.TextSize = 12.000
            TextReal.BackgroundTransparency = 1
            TextReal.Position = UDim2.new(0.05, 0, 0., 0)
            TextReal.TextXAlignment = Enum.TextXAlignment.Left

            local BoxColor = Instance.new("Frame")

            BoxColor.Name = "BoxColor"
            BoxColor.Parent = TextFrameColor
            BoxColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            BoxColor.Position = UDim2.new(0.85, 0, 0.5, 0)
            BoxColor.Size = UDim2.new(0, 35, 0, 19)
            BoxColor.AnchorPoint = Vector2.new(0.5, 0.5)

            local BoxColorCorner = Instance.new("UICorner")

            BoxColorCorner.CornerRadius = UDim.new(0, 4)
            BoxColorCorner.Name = "BoxColorCorner"
            BoxColorCorner.Parent = BoxColor

            local TextButton_Dropdown = Instance.new("TextButton")


            TextButton_Dropdown.Parent = TextFrameColor
            TextButton_Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TextButton_Dropdown.BorderSizePixel = 0
            TextButton_Dropdown.Position = UDim2.new(0., 0, 0.14705883, 0)
            TextButton_Dropdown.Size = UDim2.new(0, 200, 0, 33)
            TextButton_Dropdown.Font = Enum.Font.SourceSans
            TextButton_Dropdown.Text = "  "
            TextButton_Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
            TextButton_Dropdown.TextSize = 14.000
            TextButton_Dropdown.AutoButtonColor = false
            --TextButton_Dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_Dropdown.Position = UDim2.new(0, 0, 0, 0)
            TextButton_Dropdown.BackgroundTransparency = 1



            Pixker.MouseEnter:Connect(function()
                TweenService:Create(
                    MheeFrameStroke,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.}
                ):Play()
                TweenService:Create(
                    TextReal,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,255, 255)}
                ):Play()

            end)
            Pixker.MouseLeave:Connect(function()
                TweenService:Create(
                    MheeFrameStroke,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency = 0.7}
                ):Play()
                TweenService:Create(
                    TextReal,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(155,155, 155)}
                ):Play()
            end)
        -- Rainbow Toggle


        local TextButton_2_Toggle = Instance.new("TextButton")

        TextButton_2_Toggle.Parent = TextFrameColor
        TextButton_2_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
--        TextButton_2_Toggle.BorderColor3 = Color3.fromRGB(0, 255, 0)
        TextButton_2_Toggle.BorderSizePixel = 0
        TextButton_2_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_2_Toggle.Position = UDim2.new(0.2, 0, 1.87, 0)
        TextButton_2_Toggle.Size = UDim2.new(0, 30, 0, 13)
        TextButton_2_Toggle.Font = Enum.Font.SourceSans
        TextButton_2_Toggle.Text = " "
        TextButton_2_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_2_Toggle.TextSize = 12.000
        TextButton_2_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner.Name = ""
        TextButton_Pageframe_Uiconner.Parent = TextButton_2_Toggle

        local TextButton_3_Toggle = Instance.new("TextButton")

        TextButton_3_Toggle.Parent = TextButton_2_Toggle
        TextButton_3_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255,255)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(0, 255, 0)
        TextButton_3_Toggle.BorderSizePixel = 0
        TextButton_3_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_3_Toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
        TextButton_3_Toggle.Size = UDim2.new(0, 19, 0, 19)
        TextButton_3_Toggle.Font = Enum.Font.SourceSans
        TextButton_3_Toggle.Text = " "
        TextButton_3_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_3_Toggle.TextSize = 12.000
        TextButton_3_Toggle.AutoButtonColor = false

        local TextButton_Pageframe_Uiconner2 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner2.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner2.Name = ""
        TextButton_Pageframe_Uiconner2.Parent = TextButton_3_Toggle

        local TextButton_4_Toggle = Instance.new("TextButton")

        TextButton_4_Toggle.Parent = TextButton_3_Toggle
        TextButton_4_Toggle.BackgroundColor3 = Color3.fromRGB(155, 155,155)
--        TextButton_3_Toggle.BorderColor3 = Color3.fromRGB(0, 255, 0)
        TextButton_4_Toggle.BorderSizePixel = 0
        TextButton_4_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_4_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextButton_4_Toggle.Size = UDim2.new(0, 27, 0, 27-2)
        TextButton_4_Toggle.Font = Enum.Font.SourceSans
        TextButton_4_Toggle.Text = " "
        TextButton_4_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_4_Toggle.TextSize = 12.000
        TextButton_4_Toggle.AutoButtonColor = false
        TextButton_4_Toggle.BackgroundTransparency = 1
        TextButton_4_Toggle.Visible = true

        local TextButton_Pageframe_Uiconner4 = Instance.new("UICorner")

        TextButton_Pageframe_Uiconner4.CornerRadius = UDim.new(0, 30)
        TextButton_Pageframe_Uiconner4.Name = ""
        TextButton_Pageframe_Uiconner4.Parent = TextButton_4_Toggle


        local TextButton_Toggle = Instance.new("TextButton")

        TextButton_Toggle.Parent = ValueFrame
        TextButton_Toggle.BackgroundTransparency =1
        TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_Toggle.BorderSizePixel = 0
        TextButton_Toggle.Size = UDim2.new(0, 50, 0, 20)
        TextButton_Toggle.AutoButtonColor = false
        TextButton_Toggle.Font = Enum.Font.SourceSans
        TextButton_Toggle.Text = " "
        TextButton_Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        TextButton_Toggle.TextSize = 12.000
        TextButton_Toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_Toggle.Position = UDim2.new(1.25, 0, 0.4, 0)

        local TextButton_3_Toggle2 = Instance.new("TextLabel")

        TextButton_3_Toggle2.Parent = TextButton_2_Toggle
        TextButton_3_Toggle2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
        TextButton_3_Toggle2.BorderColor3 = Color3.fromRGB(0, 255, 0)
        TextButton_3_Toggle2.BorderSizePixel = 0
        TextButton_3_Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
        TextButton_3_Toggle2.Position = UDim2.new(1.9, 0, 0.5, 0)
        TextButton_3_Toggle2.Size = UDim2.new(0, 500, 0, 21)
        TextButton_3_Toggle2.Font = Enum.Font.SourceSansBold
        TextButton_3_Toggle2.Text = "Rainbow"
        TextButton_3_Toggle2.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_3_Toggle2.TextSize = 13.000
        TextButton_3_Toggle2.BackgroundTransparency = 1

        local OMF = Instance.new("TextButton")

        OMF.Parent = TextButton_2_Toggle
        OMF.BackgroundTransparency =1
        OMF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        OMF.BorderSizePixel = 0
        OMF.Size = UDim2.new(0, 100, 0, 20)
        OMF.AutoButtonColor = false
        OMF.Font = Enum.Font.SourceSans
        OMF.Text = " "
        OMF.TextColor3 = Color3.fromRGB(0, 0, 0)
        OMF.TextSize = 12.000
        OMF.AnchorPoint = Vector2.new(0.5, 0.5)
        OMF.Position = UDim2.new(1.3, 0, 0.5, 0)

        local Color =  Instance.new("ImageLabel")

        Color.Name = "Color"
        Color.Parent = TextFrameColor
        Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
        Color.Position = UDim2.new(0.05,0,4,0)
        Color.Size = UDim2.new(0, 195, 0, 40)
        Color.ZIndex = 0
        Color.BorderSizePixel = 0
        Color.Image = "rbxassetid://4155801252"

        local ColorFucj = Instance.new("UICorner")

        ColorFucj.CornerRadius = UDim.new(0, 4)
        ColorFucj.Name = ""
        ColorFucj.Parent = Color

        local ColorSelection =  Instance.new("ImageLabel")

        ColorSelection.Name = "ColorSelection"
        ColorSelection.Parent = Color
        ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
        ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ColorSelection.BackgroundTransparency = 1.000
        ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
        ColorSelection.Size = UDim2.new(0, 18, 0, 18)
        ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
        ColorSelection.ScaleType = Enum.ScaleType.Fit
        ColorSelection.Visible = true

        local Hue =  Instance.new("ImageLabel")

        Hue.Name = "Hue2"
        Hue.Parent = TextFrameColor
        Hue.Position = UDim2.new(0.14,0,3,0)
        Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Hue.Size = UDim2.new(0, 160, 0, 25)
        Hue.ZIndex = 0
        Hue.BorderSizePixel = 0

        local ColorFucj2 = Instance.new("UICorner")

        ColorFucj2.CornerRadius = UDim.new(0, 4)
        ColorFucj2.Name = ""
        ColorFucj2.Parent = Hue

        local HueGradient = Instance.new("UIGradient")

        HueGradient.Color = ColorSequence.new {
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
            ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
            ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
            ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
            ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
        }
        HueGradient.Rotation = 0
        HueGradient.Name = "HueGradient"
        HueGradient.Parent = Hue

        local HueSelection =  Instance.new("ImageLabel")

        HueSelection.Name = "HueSelection"
        HueSelection.Parent = Hue
        HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
        HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        HueSelection.BackgroundTransparency = 1.000
        HueSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
        HueSelection.Size = UDim2.new(0, 18, 0, 18)
        HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
        HueSelection.ScaleType = Enum.ScaleType.Fit
        HueSelection.Visible = true


        local BTN_XD = Instance.new("TextButton")

        BTN_XD.Parent = TextFrameColor
        BTN_XD.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        BTN_XD.BorderColor3 = Color3.fromRGB(0, 255, 0)
        BTN_XD.BorderSizePixel = 0
        BTN_XD.AnchorPoint = Vector2.new(0.5, 0.5)
        BTN_XD.Position = UDim2.new(0.8, 0, 1.9, 0)
        BTN_XD.Size = UDim2.new(0, 50, 0, 25)
        BTN_XD.Font = Enum.Font.GothamSemibold
        BTN_XD.Text = "Confirm"
        BTN_XD.TextColor3 = Color3.fromRGB(255, 255, 255)
        BTN_XD.TextSize = 11.000
        BTN_XD.AutoButtonColor = false

        local BTN_XD_COnner = Instance.new("UICorner")

        BTN_XD_COnner.CornerRadius = UDim.new(0, 4)
        BTN_XD_COnner.Name = ""
        BTN_XD_COnner.Parent = BTN_XD



        local MheeFrameStroke = Instance.new("UIStroke")

        MheeFrameStroke.Thickness = 1
        MheeFrameStroke.Name = ""
        MheeFrameStroke.Parent = BTN_XD
        MheeFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
        MheeFrameStroke.Color = Color3.fromRGB(0, 255, 0)
        MheeFrameStroke.Transparency = 0.7


        local UwU = false


        OMF.MouseButton1Click:Connect(function()
            if       UwU == false  then
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(0, 255, 0)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(0, 255, 0)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(153, 255, 153)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            else
                TweenService:Create(
                    TextButton_4_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_3_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TweenService:Create(
                    TextButton_2_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 =  Color3.fromRGB(155, 155, 155)} -- UDim2.new(0, 128, 0, 25)
                ):Play()
                TextButton_3_Toggle:TweenSizeAndPosition(UDim2.new(0, 19, 0, 19), UDim2.new(0.1, 0, 0.5, 0), "Out", "Quad", 0.3, true)
            end
            UwU = not UwU
        end
    )


    OMF.MouseEnter:Connect(function()
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0.6} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    OMF.MouseLeave:Connect(function()
            TweenService:Create(
                TextButton_4_Toggle,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
            ):Play()
        end
    )

    OMF.MouseButton1Down:Connect(
            function()
                RainbowColorPicker = not RainbowColorPicker

                if ColorInput then
                    ColorInput:Disconnect()
                end

                if HueInput then
                    HueInput:Disconnect()
                end

                if RainbowColorPicker then


                    OldToggleColor = BoxColor.BackgroundColor3
                    OldColor = Color.BackgroundColor3
                    OldColorSelectionPosition = ColorSelection.Position
                    OldHueSelectionPosition = HueSelection.Position

                    while RainbowColorPicker do
                        BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
                        Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

                        ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                        HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

                        pcall(callback, BoxColor.BackgroundColor3)
                        wait()
                    end
                elseif not RainbowColorPicker then

                    BoxColor.BackgroundColor3 = OldToggleColor
                    Color.BackgroundColor3 = OldColor

                    ColorSelection.Position = OldColorSelectionPosition
                    HueSelection.Position = OldHueSelectionPosition

                    pcall(callback, BoxColor.BackgroundColor3)
                end
            end
        )
        TextButton_3_Toggle.MouseButton1Down:Connect(
            function()
                RainbowColorPicker = not RainbowColorPicker

                if ColorInput then
                    ColorInput:Disconnect()
                end

                if HueInput then
                    HueInput:Disconnect()
                end

                if RainbowColorPicker then


                    OldToggleColor = BoxColor.BackgroundColor3
                    OldColor = Color.BackgroundColor3
                    OldColorSelectionPosition = ColorSelection.Position
                    OldHueSelectionPosition = HueSelection.Position

                    while RainbowColorPicker do
                        BoxColor.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)
                        Color.BackgroundColor3 = Color3.fromHSV(Red.RainbowColorValue, 1, 1)

                        ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                        HueSelection.Position = UDim2.new(0,  Red.HueSelectionPosition, 0.5,0)

                        pcall(callback, BoxColor.BackgroundColor3)
                        wait()
                    end
                elseif not RainbowColorPicker then

                    BoxColor.BackgroundColor3 = OldToggleColor
                    Color.BackgroundColor3 = OldColor

                    ColorSelection.Position = OldColorSelectionPosition
                    HueSelection.Position = OldHueSelectionPosition

                    pcall(callback, BoxColor.BackgroundColor3)
                end
            end
        )


        local function UpdateColorPicker(nope)
            BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
            Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

            pcall(callback, BoxColor.BackgroundColor3)
        end
        ColorH =
        1 -
        (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
            Hue.AbsoluteSize.Y)
        ColorS =
            (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                Color.AbsoluteSize.X)
        ColorV =
            1 -
            (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                Color.AbsoluteSize.Y)

        BoxColor.BackgroundColor3 = preset
        Color.BackgroundColor3 = preset
        pcall(callback, BoxColor.BackgroundColor3)

        local RainbowColorPicker = false

        Color.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if RainbowColorPicker then
                        return
                    end

                    if ColorInput then
                        ColorInput:Disconnect()
                    end

                    ColorInput =
                        RunService.RenderStepped:Connect(
                            function()
                            local ColorX =
                                (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                                    Color.AbsoluteSize.X)
                            local ColorY =
                                (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                                    Color.AbsoluteSize.Y)

                            ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                            ColorS = ColorX
                            ColorV = 1 - ColorY

                            UpdateColorPicker(true)
                        end
                        )
                end
            end
        )


            Color.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if ColorInput then
                            ColorInput:Disconnect()
                        end
                    end
                end
            )

            Hue.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if RainbowColorPicker then
                            return
                        end

                        if HueInput then
                            HueInput:Disconnect()
                        end

                        HueInput =
                            RunService.RenderStepped:Connect(
                                function()
                                local HueY =
                                    (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                                        Hue.AbsoluteSize.Y)
                                local HueX =
                                    (math.clamp(Mouse.X- Hue.AbsolutePosition.X, 0, Hue.AbsoluteSize.X) /
                                        Hue.AbsoluteSize.X)

                                HueSelection.Position = UDim2.new(HueX, 0, HueY, 0)
                                ColorH = 1 - HueY

                                UpdateColorPicker(true)
                            end
                            )
                    end
                end
            )

            Hue.InputEnded:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if HueInput then
                            HueInput:Disconnect()
                        end
                    end
                end
            )
            local sk = false
            TextButton_Dropdown.MouseButton1Click:Connect(function()
                if sk == false then
                TweenService:Create(
                    Pixker,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 180)}
                ):Play()
            else
                TweenService:Create(
                    Pixker,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 213, 0, 33)}
                ):Play()
            end
            sk = not sk
            end
        )
            BTN_XD.MouseButton1Click:Connect(
                function()
                    TweenService:Create(
                        Pixker,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0, 213, 0, 33)}
                    ):Play()
                    sk = not sk
                end
            )


        end
        function items:Label(text,image)
            if image == nil then
                image = "8167613719"
            end
            local labaelchange = {}
            local LabelFrame = Instance.new("Frame")


            LabelFrame.Name = "Mainframenoti"
            LabelFrame.Parent = ScrollingFrame_Pageframe
            LabelFrame.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            LabelFrame.BackgroundTransparency = 0
            LabelFrame.BorderSizePixel = 0
            LabelFrame.ClipsDescendants = false
            LabelFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelFrame.Position = UDim2.new(0.498, 0, 0.5, 0)
            LabelFrame.Size = UDim2.new(0, 213, 0, 28)

            local LabelFarm2 = Instance.new("TextLabel")

            LabelFarm2.Parent = LabelFrame
            LabelFarm2.Name = "TextLabel_Tap"
            LabelFarm2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            LabelFarm2.Size =UDim2.new(0, 130, 0,24 )
            LabelFarm2.Font = Enum.Font.SourceSansSemibold
            LabelFarm2.Text = text
            LabelFarm2.TextColor3 = Color3.fromRGB(255, 255, 255)
            LabelFarm2.TextSize = 12.000
            LabelFarm2.AnchorPoint = Vector2.new(0.5, 0.5)
            LabelFarm2.Position = UDim2.new(0.5, 0, 0.5, 0)
            LabelFarm2.TextXAlignment = Enum.TextXAlignment.Center
            LabelFarm2.BackgroundTransparency = 1
            LabelFarm2.TextWrapped = true

            local ImageLabel_gx = Instance.new("ImageLabel")

            ImageLabel_gx.Parent = LabelFrame
            ImageLabel_gx.BackgroundTransparency = 1.000
            ImageLabel_gx.BorderSizePixel = 0
            ImageLabel_gx.Size = UDim2.new(0, 18, 0, 18)
            ImageLabel_gx.AnchorPoint = Vector2.new(0.5, 0.5)
            ImageLabel_gx.Position = UDim2.new(0.06, 0, 0.45, 0)
            ImageLabel_gx.Image = "http://www.roblox.com/asset/?id="..tostring(image)
            ImageLabel_gx.BackgroundTransparency = 1

            local noticore55 = Instance.new("UICorner")

            noticore55.CornerRadius = UDim.new(0, 4)
            noticore55.Name = ""
            noticore55.Parent = LabelFarm2

            local noticore2777 = Instance.new("UICorner")

            noticore2777.CornerRadius = UDim.new(0, 4)
            noticore2777.Name = ""
            noticore2777.Parent = LabelFrame

            local LabelStroke = Instance.new("UIStroke")

            LabelStroke.Thickness = 1
            LabelStroke.Name = ""
            LabelStroke.Parent = LabelFrame
            LabelStroke.LineJoinMode = Enum.LineJoinMode.Round
            LabelStroke.Color = Color3.fromRGB(0, 255, 0)
            LabelStroke.Transparency = 0.7

            LabelFrame.MouseEnter:Connect(function()
                TweenService:Create(
                    LabelStroke,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency =0}
                ):Play()
            end
        )
            LabelFrame.MouseLeave:Connect(function()
                TweenService:Create(
                    LabelStroke,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {Transparency =0.7}
                ):Play()
            end
        )
            function labaelchange:Change(text2)
                LabelFarm2.Text = text2
            end
            return  labaelchange
        end
        return  items
        end
    return  page
    end
return top
end




    local Window = create:Win("HULK U H U B")
	local Tap1 = Window:Taps("Auto Farm")
	local Tap2 = Window:Taps("Teleports")
	local Tap3 = Window:Taps("Combat")
	local Tap4 = Window:Taps("Dungeon")
	local Tap6 = Window:Taps("Misc")
	local Tap7 = Window:Taps("Setting")
	
	local page1 = Tap1:newpage()
	local page2 = Tap1:newpage()
	local page3 = Tap2:newpage()
	local page4 = Tap2:newpage()
	local page5 = Tap3:newpage()
	local page6 = Tap3:newpage()
	local page7 = Tap4:newpage()
	local page9 = Tap6:newpage()
	local page10 = Tap6:newpage()
	local page11 = Tap7:newpage()
	local page12 = Tap7:newpage()
	
	page1:Label("Auto Farm",0)

  Time = page1:Label("Server Time")
	local function UpdateTime()
		local GameTime = math.floor(workspace.DistributedGameTime+0.5)
		local Hour = math.floor(GameTime/(60^2))%24
		local Minute = math.floor(GameTime/(60^1))%60
		local Second = math.floor(GameTime/(60^0))%60
		Time:Change("Hour : "..Hour.." Minute : "..Minute.." Second : "..Second)
	end
	spawn(function()
		while true do
			UpdateTime()
			game:GetService("RunService").RenderStepped:Wait()
		end
	end)
	
	page1:Line()
	
	page1:Toggle("Auto Farm Level",false,function(e)
	   pcall(function()
		  CheckQuest()
		  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
		  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
		  _G.AutoFarm = e
		  wait()
		  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
		end)
	end)
	 page1:Toggle("Haki",true,function(t)
	   _G.Haki = t
	 end)
	 
	 spawn(function()
	   while wait(1) do
		  if _G.Haki then
			pcall(function()
			  if game.Players.LocalPlayer.Character.Haki.Value == 0 then
				game.Players.LocalPlayer.Character.Haki.Value = 1
				game:GetService("Players").LocalPlayer.Character.Services.Client.Armament:FireServer()
			  end
			end)
		  end
	   end
	 end)
	 
	 page1:Toggle("Ken-Haki",true,function(t)
	   _G.KenHaki = t
	 end)
	 
	 spawn(function()
	   while wait(1) do
		  if _G.KenHaki then
			pcall(function()
			  if game.Players.LocalPlayer.Character.KenHaki.Value == 0 then
				local args = {
				   [1] = true
				}
				game:GetService("Players").LocalPlayer.Character.Services.Client.KenEvent:InvokeServer(unpack(args))
			  end
			end)
		  end
	   end
	 end)
	
	if _G.useid == nil then
	   game.Players.LocalPlayer.UserId = 991117111
	   game:GetService("CoreGui").PlayerList.Enabled = false
	   _G.useid = false
	end
 
     local RunService = game:GetService("RunService")
    function antiSit()
    if game.Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then 
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
    end
    RunService:BindToRenderStep("tempBinding", 1000, antiSit)
    
	 
	 local placeId = game.PlaceId
	 if placeId == 4520749081 then
	   OldWorld = true
	 elseif placeId == 6381829480 then
	   newworld = true
	 end
	 function CheckQuest()
	   local MyLevel = game.Players.LocalPlayer.PlayerStats.lvl.Value
	   if OldWorld then
		  if MyLevel == 1 or MyLevel <= 9 then
			CFrameQuest = CFrame.new(2238.80054, 48.4990921, -1610.56396, 0.613133192, -0, -0.789979577, 0, 1, -0, 0.789979577, 0, 0.613133192)
			CFrameMon = CFrame.new(2388.6013183594, 700.19408416748, -1578.6862792969)
			NameMon = "Soldier"
			Ms = "Soldier [Lv. 1]"
			levelquest = 1
		  elseif MyLevel == 10 or MyLevel <= 19 then
			CFrameQuest = CFrame.new(2371.42798, 47.7647781, -1626.57666, 0.789979517, 0, 0.613133252, 0, 1, 0, -0.613133252, 0, 0.789979517)
			CFrameMon = CFrame.new(2475.3591308594, 48.185997009277, -1637.0419921875)
			NameMon = "Clown Pirate"
			Ms = "Clown Pirate [Lv. 10]"
			levelquest = 10
		  elseif MyLevel == 20 or MyLevel <= 29 then
			CFrameQuest = CFrame.new(2294.6062, 48.2725563, -1744.96301, -0.613133192, 0, 0.789979577, 0, 1, 0, -0.789979577, 0, -0.613133192)
			CFrameMon = CFrame.new(2241.9602050781, 48.143291473389, -1879.7458496094)
			NameMon = "Smoky"
			Ms = "Smoky [Lv. 20]"
			levelquest = 20
		  elseif MyLevel == 30 or MyLevel <= 49 then
			CFrameQuest = CFrame.new(2009.21594, 48.2536201, -1820.21509, 0.789979517, 0, 0.613133252, 0, 1, 0, -0.613133252, 0, 0.789979517)
			CFrameMon = CFrame.new(2154.3620605469, 48.192771911621, -1909.8853759766)
			NameMon = "Tashi"
			Ms = "Tashi [Lv. 30]"
			levelquest = 30
		  elseif MyLevel == 50 or MyLevel <= 74 then
			CFrameQuest = CFrame.new(3521.83545, 37.9938889, -593.381653, -0.210057616, 0, 0.977689087, 0, 1, 0, -0.977689087, 0, -0.210057616)
			CFrameMon = CFrame.new(3484.5686035156, 37.869560241699, -672.1650390625)
			NameMon = "Clown Pirate"
			Ms = "Clown Pirate [Lv. 50]"
			levelquest = 50
		  elseif MyLevel == 75 or MyLevel <= 99 then
			CFrameQuest = CFrame.new(3814.66284, 69.1189499, -602.741638, 0.848060429, 0, 0.529899538, 0, 1, 0, -0.529899538, 0, 0.848060429)
			CFrameMon = CFrame.new(3825.1069335938, 68.823860168457, -673.68743896484)
			NameMon = "The Clown"
			Ms = "The Clown [Lv. 75]"
			levelquest = 75
          elseif MyLevel == 100 or MyLevel <= 119 then
            CFrameQuest = CFrame.new(1927.48621, 38.945137, 195.89032, -0.824105501, 0, 0.566436887, 0, 1, 0, -0.566436887, 0, -0.824105501)
			CFrameMon = CFrame.new(2008.767578125, 39.411975860596, 374.65084838867)
			NameMon = "Commander"
			Ms = "Commander [Lv. 100]"
			levelquest = 100
          elseif MyLevel == 120 or MyLevel <= 144 then
            CFrameQuest = CFrame.new(1966.04468, 60.3905983, 322.319672, 0.719422758, 0.000272446923, -0.694572389, -0.000207782898, 0.99999994, 0.000177034352, 0.694572389, 1.69577324e-05, 0.719422817)
			CFrameMon = CFrame.new(1984.5718994141, 39.336540222168, 409.36401367188)
			NameMon = "Captain"
			Ms = "Captain [Lv. 120]"
			levelquest = 120
		  elseif MyLevel == 145 or MyLevel <= 179 then
			CFrameQuest = CFrame.new(1743.07581, 68.7078476, 349.258057, 0.917908251, 0.000253595645, -0.39679268, -0.000253595645, 0.99999994, 5.24659517e-05, 0.39679268, 5.24659517e-05, 0.917908251)
			CFrameMon = CFrame.new(1833.2487792969, 68.579429626465, 340.28991699219)
			NameMon = "Axe-Hand"
			Ms = "Axe-Hand [Lv. 145]"
			levelquest = 145
		  elseif MyLevel == 180 or MyLevel <= 199 then
			CFrameQuest = CFrame.new(3231.89673, 10.889246, 1516.1969, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
			CFrameMon = CFrame.new(3422.2897949219, 10.541933059692, 1427.0944824219)
			NameMon = "Fishman"
			Ms = "Fishman [Lv. 180]"
			levelquest = 180
          elseif MyLevel == 200 or MyLevel <= 229 then
            CFrameQuest = CFrame.new(3568.19849, 10.8634539, 1548.96082, 0.573598742, 0, 0.81913656, 0, 1, 0, -0.81913656, 0, 0.573598742)
			CFrameMon = CFrame.new(3446.2866210938, 10.541933059692, 1504.1312255859)
			NameMon = "Karate Fishman"
			Ms = "Karate Fishman [Lv. 200]"
			levelquest = 200
		  elseif MyLevel == 230 or MyLevel <= 249 then
			CFrameQuest = CFrame.new(3651.37427, 10.8831606, 1511.43884, -0.801726937, 0, 0.597690463, 0, 1, 0, -0.597690463, 0, -0.801726937)
			CFrameMon = CFrame.new(3783.7639160156, 10.042049407959, 1393.6252441406)
			NameMon = "SharkMan"
			Ms = "SharkMan [Lv. 230]"
			levelquest = 230
		  elseif MyLevel == 250 or MyLevel <= 299 then
			CFrameQuest = CFrame.new(-50.4521332, 49.8431091, -85.4636002, 0.854788899, 0, 0.518975854, 0, 1, 0, -0.518975854, 0, 0.854788899)
			CFrameMon = CFrame.new(167.30447387695, 12.940340995789, -96.97940826416)
			NameMon = "Trainer Chef"
			Ms = "Trainer Chef [Lv. 250]"
			levelquest = 250
		  elseif MyLevel == 300 or MyLevel <= 349 then
			CFrameQuest = CFrame.new(40.3570976, 99.6126328, -45.6973267, 0.876903236, -0, -0.480666965, 0, 1, -0, 0.480666965, 0, 0.876903236)
			CFrameMon = CFrame.new(102.66408538818, 12.94033908844, -131.60733032227)
			NameMon = "Dark Leg"
			Ms = "Dark Leg [Lv. 300]"
			levelquest = 300
		  elseif MyLevel == 350 or MyLevel <= 399 then
			CFrameQuest = CFrame.new(-42.2680435, 49.8572884, 112.88829, -0.879374862, 0, 0.476129979, 0, 1, 0, -0.476129979, 0, -0.879374862)
			CFrameMon = CFrame.new(-107.64674377441, 12.940341949463, 197.33432006836)
			NameMon = "Weapon Man"
			Ms = "Weapon Man [Lv. 350]"
			levelquest = 350
		  elseif MyLevel == 400 or MyLevel <= 449 then
			CFrameQuest = CFrame.new(-1256.48267, 18.495348, 1540.78418, -0.173624277, 0, 0.984811902, 0, 1, 0, -0.984811902, 0, -0.173624277)
			CFrameMon = CFrame.new(-1260.9366455078, 18.071796417236, 1610.7703857422)
			NameMon = "Snow Soldier"
			Ms = "Snow Soldier [Lv. 400]"
			levelquest = 400
		  elseif MyLevel == 450 or MyLevel <= 499 then
			CFrameQuest = CFrame.new(-1337.03894, 18.3326225, 1409.33447, 0.173624337, -0, -0.984811902, 0, 1, -0, 0.984811902, 0, 0.173624337)
			CFrameMon = CFrame.new(-1308.7406005859, 18.078416824341, 1241.3764648438)
			NameMon = "King Snow"
			Ms = "King Snow [Lv. 450]"
			levelquest = 450
        elseif MyLevel == 500 or MyLevel <= 524 then
            CFrameQuest = CFrame.new(-1098.83411, 18.1970978, 1788.71265, 0.853996992, -0, -0.520277977, 0, 1, -0, 0.520277977, 0, 0.853996992)
			CFrameMon = CFrame.new(-1021.1658325195, 13.231985092163, 1764.0373535156)
			NameMon = "Heavy Man"
			Ms = "Heavy Man [Lv. 500]"
			levelquest = 500
		  elseif MyLevel == 525 or MyLevel <= 624 then
			CFrameQuest = CFrame.new(1473.1709, 13.237936, 2290.39551, 0.669109941, -0, -0.743163466, 0, 1, -0, 0.743163466, 0, 0.669109941)
			CFrameMon = CFrame.new(1483.4221191406, 12.901775360107, 2171.4916992188)
			NameMon = "Candle Man"
			Ms = "Candle Man [Lv. 525]"
			levelquest = 525
		  elseif MyLevel == 625 or MyLevel <= 724 then
			CFrameQuest = CFrame.new(1260.28662, 13.1960182, 2081.66309, 0.907637119, 1.85504832e-05, -0.419755667, 1.85504832e-05, 1, 8.43052112e-05, 0.419755667, -8.43052112e-05, 0.907637119)
			CFrameMon = CFrame.new(1357.8499755859, 12.899509429932, 1991.388671875)
			NameMon = "Bomb Man"
			Ms = "Bomb Man [Lv. 625]"
			levelquest = 625
		  elseif MyLevel == 725 or MyLevel <= 799 then
			CFrameQuest = CFrame.new(1252.18408, 43.3529396, 2185.21338, -0.74314785, 0, -0.669127226, 0, 1, 0, 0.669127226, 0, -0.74314785)
			CFrameMon = CFrame.new(1094.8045654297, 97.052360534668, 2387.3376464844)
			NameMon = "King of Sand"
			Ms = "King of Sand [Lv. 725]"
			levelquest = 725
		  elseif MyLevel == 800 or MyLevel <= 849 then
			CFrameQuest = CFrame.new(-279.469849, 201.045959, 3922.09521, -0.829036593, 0, -0.559194624, 0, 1, 0, 0.559194624, 0, -0.829036593)
			CFrameMon = CFrame.new(-484.94296264648, 222.38262939453, 4113.1870117188)
			NameMon = "Sky Soldier"
			Ms = "Sky Soldier [Lv. 800]"
			levelquest = 800
		  elseif MyLevel == 850 or MyLevel <= 899 then
			CFrameQuest = CFrame.new(156.796631, 386.808319, 4087.60889, -0.5592103, 0, 0.829025805, 0, 1, 0, -0.829025805, 0, -0.5592103)
			CFrameMon = CFrame.new(211.71342468262, 386.47698974609, 4171.6064453125)
			NameMon = "Ball Man"
			Ms = "Ball Man [Lv. 850]"
			levelquest = 850
		  elseif MyLevel == 900 or MyLevel <= 999 then
			CFrameQuest = CFrame.new(114.717041, 386.823547, 4223.28955, 0.461702704, 0, 0.887034833, 0, 1, 0, -0.887034833, 0, 0.461702704)
			CFrameMon = CFrame.new(15.199673652649, 386.47402954102, 4369.1220703125)
			NameMon = "Rumble Man"
			Ms = "Rumble Man [Lv. 900]"
			levelquest = 900
		  elseif MyLevel == 1000 or MyLevel <= 1099 then
			CFrameQuest = CFrame.new(5954.71533, 12.2471457, 3609.10156, 0.927179396, -0, -0.374617696, 0, 1, -0, 0.374617696, 0, 0.927179396)
			CFrameMon = CFrame.new(5989.7841796875, 11.854816436768, 3744.0422363281)
			NameMon = "Soldier"
			Ms = "Soldier [Lv. 1000]"
			levelquest = 1000
		  elseif MyLevel == 1100 or MyLevel <= 1149 then
			CFrameQuest = CFrame.new(5943.31689, 12.2376118, 3549.05908, -0.929240346, 0, 0.369476676, 0, 1, 0, -0.369476676, 0, -0.929240346)
			CFrameMon = CFrame.new(6083.1376953125, 11.854816436768, 3526.1411132813)
			NameMon = "Leader"
			Ms = "Leader [Lv. 1100]"
			levelquest = 1100
		  elseif MyLevel == 1150 or MyLevel <= 1249 then
			CFrameQuest = CFrame.new(5745.82861, 11.9705915, 3868.69287, 0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, 0.374604106)
			CFrameMon = CFrame.new(5659.5922851563, 11.854816436768, 3988.20703125)
			NameMon = "Pasta"
			Ms = "Pasta [Lv. 1150]"
			levelquest = 1150
		  elseif MyLevel == 1250 or MyLevel <= 1324 then
			CFrameQuest = CFrame.new(2953.72705, 13.4164658, 5057.10889, 0.087131381, -0, -0.996196866, 0, 1, -0, 0.996196866, 0, 0.087131381)
			CFrameMon = CFrame.new(2853.8842773438, 13.080310821533, 5103.9150390625)
			NameMon = "Wolf"
			Ms = "Wolf [Lv. 1250]"
			levelquest = 1250
		  elseif MyLevel == 1325 or MyLevel <= 1399 then
			CFrameQuest = CFrame.new(3015.25537, 13.4260073, 5103.00195, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMon = CFrame.new(3138.1865234375, 13.080309867859, 5128.2075195313)
			NameMon = "Giraffe"
			Ms = "Giraffe [Lv. 1325]"
			levelquest = 1325
		  elseif MyLevel == 1400 or MyLevel <= 1499 then
			CFrameQuest = CFrame.new(3087.98071, 13.3482132, 5732.96191, 0.996191859, 0, 0.0871884301, 0, 1, 0, -0.0871884301, 0, 0.996191859)
			CFrameMon = CFrame.new(3049.7880859375, 13.011056900024, 5807.7763671875)
			NameMon = "Leo"
			Ms = "Leo [Lv. 1400]"
			levelquest = 1400
		  elseif MyLevel == 1500 or MyLevel <= 1599 then
			CFrameQuest = CFrame.new(802.982788, 47.94347, 6440.14795, -0.706407189, 0, -0.707805812, 0, 1, 0, 0.707805812, 0, -0.706407189)
			CFrameMon = CFrame.new(720.18267822266, 47.856227874756, 6539.44921875)
			NameMon = "Zombie"
			Ms = "Zombie [Lv. 1500]"
			levelquest = 1500
		  elseif MyLevel == 1600 or MyLevel <= 1749 then
			CFrameQuest = CFrame.new(789.282837, 47.9807129, 6295.3335, 0.827670813, 0, 0.561213911, 0, 1, 0, -0.561213911, 0, 0.827670813)
			CFrameMon = CFrame.new(763.20684814453, 47.857105255127, 6194.3798828125)
			NameMon = "Shadow Master"
			Ms = "Shadow Master [Lv. 1600]"
			levelquest = 1600
		  elseif MyLevel == 1750 or MyLevel <= 1799 then
			CFrameQuest = CFrame.new(6629.34619, 49.690258, 1101.02808, 0.110425055, 0, 0.993884444, 0, 1, 0, -0.993884444, 0, 0.110425055)
			CFrameMon = CFrame.new(6489.4443359375, 49.605056762695, 1160.2866210938)
			NameMon = "New World Pirate"
			Ms = "New World Pirate [Lv. 1750]"
			levelquest = 1750
		  elseif MyLevel == 1800 or MyLevel <= 1849 then
			CFrameQuest = CFrame.new(6608.65674, 49.6804199, 717.611816, 0.933807552, 0, 0.357775658, 0, 1, 0, -0.357775658, 0, 0.933807552)
			CFrameMon = CFrame.new(6480.3041992188, 49.601085662842, 709.37188720703)
			NameMon = "Rear Admiral"
			Ms = "Rear Admiral [Lv. 1800]"
			levelquest = 1800
        elseif MyLevel == 1850 or MyLevel <= 1924 then
            CFrameQuest = CFrame.new(6583.46338, 49.9611206, 828.772705, 0.0896955132, 0, 0.995969236, 0, 1, 0, -0.995969236, 0, 0.0896955132)
			CFrameMon = CFrame.new(6506.6689453125, 49.603099822998, 923.83947753906)
			NameMon = "True Karate Fishman"
			Ms = "True Karate Fishman [Lv. 1850]"
			levelquest = 1850
		  elseif MyLevel == 1925 or MyLevel <= 1999 then
			CFrameQuest = CFrame.new(6267.04932, 49.9741898, 759.01062, -0.98284173, 0, 0.184450701, 0, 1, 0, -0.184450701, 0, -0.98284173)
			CFrameMon = CFrame.new(6280.4370117188, 3.0408589839935, 972.27459716797)
			NameMon = "Quake Woman"
			Ms = "Quake Woman [Lv. 1925]"
			levelquest = 1925
		  elseif MyLevel == 2000 or MyLevel <= 2049 then
			CFrameQuest = CFrame.new(2465.56934, 40.6591568, 8889.68457, 0.0276401043, 0, 0.999617934, 0, 1, 0, -0.999617934, 0, 0.0276401043)
			CFrameMon = CFrame.new(2628.8349609375, 40.271903991699, 9056.7705078125)
			NameMon = "Fishman"
			Ms = "Fishman [Lv. 2000]"
			levelquest = 2000
		  elseif MyLevel == 2050 or MyLevel <= 2099 then
			CFrameQuest = CFrame.new(2273.94336, 40.6516304, 9155.36035, -0.941219687, 0, -0.33779496, 0, 1, 0, 0.33779496, 0, -0.941219687)
			CFrameMon = CFrame.new(2252.1274414063, 40.271308898926, 9055.755859375)
			NameMon = "Combat Fishman"
			Ms = "Combat Fishman [Lv. 2050]"
			levelquest = 2050
		  elseif MyLevel == 2100 or MyLevel <= 2149 then
			CFrameQuest = CFrame.new(2786.80176, 40.3558807, 9334.00684, 0.258653998, -0, -0.965970039, 0, 1, -0, 0.965970039, 0, 0.258653998)
			CFrameMon = CFrame.new(2705.0991210938, 40.272861480713, 9564.439453125)
			NameMon = "Sword Fishman"
			Ms = "Sword Fishman [Lv. 2100]"
			levelquest = 2100
		  elseif MyLevel == 2150 or MyLevel <= 2199 then
			CFrameQuest = CFrame.new(2512.59814, 40.3808823, 9426.17871, 0.976825714, -0, -0.214036196, 0, 1, -0, 0.214036196, 0, 0.976825714)
			CFrameMon = CFrame.new(2326.9379882813, 44.8733253479, 9431.0478515625)
			NameMon = "Fishman Soldier"
			Ms = "Fishman Soldier [Lv. 2150]"
			levelquest = 2150
		  elseif MyLevel >= 2200 then
			CFrameQuest = CFrame.new(2277.84277, 40.330883, 9362.19434, 0.943592668, -0, -0.33110866, 0, 1, -0, 0.33110866, 0, 0.943592668)
			CFrameMon = CFrame.new(2359.4089355469, 44.923583984375, 9537.9921875)
			NameMon = "Seasoned Fishman"
			Ms = "Seasoned Fishman [Lv. 2200]"
			levelquest = 2200
		  end
	   end
	   if newworld then
		  if MyLevel >= 2250 and MyLevel <= 2299 then
			Ms = "Beast Pirate [Lv. 2250]"
			CFrameQuest = CFrame.new(3442.84619, 57.4288673, 200.156494, -1, 0, 0, 0, 1, 0, 0, 0, -1)
			NameMon = "Beast Pirate"
			CFrameMon = CFrame.new(3410.806640625, 57.351654052734, 126.04711151123)
			levelquest = 2250
		  elseif MyLevel >= 2300 and MyLevel <= 2349 then
			Ms = "Beast Pirate [Lv. 2300]"
			CFrameQuest = CFrame.new(3073.875, 98.4526062, -227.963989, -0.0747259855, 0, 0.997204244, 0, 1, 0, -0.997204244, 0, -0.0747259855)
			NameMon = "Beast Pirate"
			CFrameMon = CFrame.new(3269.1528320313, 98.435157775879, -193.01959228516)
			levelquest = 2300
		  elseif MyLevel >= 2350 and MyLevel <= 2399 then
			Ms = "Snake Man [Lv. 2350]"
			CFrameQuest = CFrame.new(2879.44458, 57.4297562, 213.51767, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			NameMon = "Snake Man"
			CFrameMon = CFrame.new(3019.0646972656, 57.341064453125, 251.25675964355)
			levelquest = 2350
		  elseif MyLevel >= 2400 and MyLevel <= 2449 then
			Ms = "Bandit Beast Pirate [Lv. 2400]"
			CFrameQuest = CFrame.new(2766.21631, 135.961655, -852.705017, -0.997206211, 0, -0.0747026429, 0, 1, 0, 0.0747026429, 0, -0.997206211)
			NameMon = "Bandit Beast Pirate"
			CFrameMon = CFrame.new(2861.4045410156, 135.89671325684, -942.68609619141)
			levelquest = 2400
		  elseif MyLevel >= 2450 and MyLevel <= 2499 then
			Ms = "Powerful Beast Pirate [Lv. 2450]"
			CFrameQuest = CFrame.new(2728.21289, 135.966202, -784.143188, 0.997205853, 0, 0.0747026429, 0, 1, 0, -0.0747026429, 0, 0.997205853)
			NameMon = "Powerful Beast Pirate"
			CFrameMon = CFrame.new(2675.4282226563, 135.88827514648, -720.36334228516)
			levelquest = 2450
		  elseif MyLevel >= 2500 and MyLevel <= 2549 then
			Ms = "Violet Samurai [Lv. 2500]"
			CFrameQuest = CFrame.new(2105.74341, 85.7244797, -815.353821, -0.997206211, 0, -0.0747026429, 0, 1, 0, 0.0747026429, 0, -0.997206211)
			NameMon = "Violet Samurai"
			CFrameMon = CFrame.new(2220.8564453125, 85.628379821777, -877.66534423828)
			levelquest = 2500
		  elseif MyLevel >= 2550 and MyLevel <= 2599 then
			Ms = "Rabbit Man [Lv. 2550]"
			CFrameQuest = CFrame.new(1878.9906, 100.143906, -43.1533508, -1, 0, 0, 0, 1, 0, 0, 0, -1)
			NameMon = "Rabbit Man"
			CFrameMon = CFrame.new(1823.4294433594, 99.792961120605, -203.08172607422)
			levelquest = 2550
		  elseif MyLevel >= 2600 and MyLevel <= 2649 then
			Ms = "Bat Man [Lv. 2600]"
			CFrameQuest = CFrame.new(2304.98022, 57.4175835, 126.065582, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			NameMon = "Bat Man"
			CFrameMon = CFrame.new(2336.8032226563, 57.34107208252, -27.372690200806)
			levelquest = 2600
		  elseif MyLevel >= 2650 and MyLevel <= 2699 then
			Ms = "Kitsune Samurai [Lv. 2650]"
			CFrameQuest = CFrame.new(1967.28882, 99.8844833, 257.334198, 1, 0, 0, 0, 1, 0, 0, 0, 1)
			NameMon = "Kitsune Samurai"
			CFrameMon = CFrame.new(1834.419921875, 100.21035003662, 123.69989776611)
			levelquest = 2650
		  elseif MyLevel >= 2700 and MyLevel <= 2749 then
			Ms = "Elite Beast Pirate [Lv. 2700]"
			CFrameQuest = CFrame.new(2560.79639, 29.3038044, 1237.06335, 0.999238789, 0, 0.0390101261, 0, 1, 0, -0.0390101261, 0, 0.999238789)
			NameMon = "Elite Beast Pirate"
			CFrameMon = CFrame.new(2856.1528320313, 29.257522583008, 1215.7177734375)
			levelquest = 2700
		  elseif MyLevel >= 2750 and MyLevel <= 2799 then
			Ms = "Elite Beast Pirate [Lv. 2750]"
			CFrameQuest = CFrame.new(2610.43359, 29.3028202, 1024.19531, -0.115484118, 0, -0.993309259, 0, 1, 0, 0.993309259, 0, -0.115484118)
			NameMon = "Elite Beast Pirate"
			CFrameMon = CFrame.new(2879.8083496094, 29.257522583008, 1077.7244873047)
			levelquest = 2750
		  elseif MyLevel >= 2800 and MyLevel <= 2849 then
			Ms = "Bear Man [Lv. 2800]"
			CFrameQuest = CFrame.new(3109.19385, 29.2910175, 1371.31653, 0.999238789, 0, 0.0390101261, 0, 1, 0, -0.0390101261, 0, 0.999238789)
			NameMon = "Bear Man"
			CFrameMon = CFrame.new(3114.4033203125, 29.257526397705, 1120.8735351563)
			levelquest = 2800 
		  elseif MyLevel >= 2850 and MyLevel <= 2899 then
			Ms = "Magician [Lv. 2850]"
			CFrameQuest = CFrame.new(1795.55029, 57.3684654, 1033.49622, -1, 0, 0, 0, 1, 0, 0, 0, -1)
			NameMon = "Magician"
			CFrameMon = CFrame.new(1922.1657714844, 57.336860656738, 1086.8957519531)
			levelquest = 2850
		  elseif MyLevel >= 2900 and MyLevel <= 2949 then
			Ms = "Pachy Woman [Lv. 2900]"
			CFrameQuest = CFrame.new(1777.52759, 57.3762856, 1278.66052, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			NameMon = "Pachy Woman"
			CFrameMon = CFrame.new(1618.9149169922, 57.336868286133, 1294.521484375)
			levelquest = 2900
		  elseif MyLevel >= 2950 and MyLevel <= 2999 then
			Ms = "Kappa [Lv. 2950]"
			CFrameQuest = CFrame.new(2186.47827, 57.4165764, 1959.9281, -0.150942802, 0, 0.988542497, 0, 1, 0, -0.988542497, 0, -0.150942802)
			NameMon = "Kappa"
			CFrameMon = CFrame.new(2408.5480957031, 57.341068267822, 2076.3681640625)
			levelquest = 2950
		  elseif MyLevel >= 3000 and MyLevel <= 3024 then
			Ms = "Mammoth Man [Lv. 3000]"
			CFrameQuest = CFrame.new(2135.64844, 57.4257088, 1957.90771, 0.150942862, -0, -0.988542497, 0, 1, -0, 0.988542497, 0, 0.150942862)
			NameMon = "Mammoth Man"
			CFrameMon = CFrame.new(2149.9592285156, 57.341064453125, 2112.6245117188)
			levelquest = 3000
		  elseif MyLevel >= 3025 and MyLevel <= 3074 then
			Ms = "Skull Pirate [Lv. 3050]"
			CFrameQuest = CFrame.new(-3816.54614, 51.3296509, 9891.29688, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)
			NameMon = "Skull Pirate"
			CFrameMon = CFrame.new(957.65319824219, 175.79154968262, 7112.705078125)
			levelquest = 3025
		  elseif MyLevel >= 3075 and MyLevel <= 3099 then
			Ms = "Elite Skeleton [Lv. 3100]"
			CFrameQuest = CFrame.new(-3032.25317, 51.5443535, 9854.83691, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
			NameMon = "Elite Skeleton"
			CFrameMon = CFrame.new(1378.60546875, 139.00987243652, 7331.2514648438)
			levelquest = 3075
		  elseif MyLevel >= 3100 and MyLevel <= 3124 then
			Ms = "Desert Thief [Lv.3125]"
			CFrameQuest = CFrame.new(8847.94238, 14.4670143, 1400.72119, -0.322491169, 0, 0.946572542, 0, 1, 0, -0.946572542, 0, -0.322491169)
			NameMon = "Desert Thief"
			CFrameMon = CFrame.new(8652.412109375, 14.472348213196, 1643.1695556641)
			levelquest = 3100
		  elseif MyLevel >= 3125 and MyLevel <= 3149 then
			Ms = "Anubis [Lv.3150]"
			CFrameQuest = CFrame.new(9141.8457, 14.469614, 1055.01233, -0.894592047, 0, 0.446883589, 0, 1, 0, -0.446883589, 0, -0.894592047)
			NameMon = "Anubis"
			CFrameMon = CFrame.new(9520.4404296875, 14.457294464111, 1061.6120605469)
			levelquest = 3125
		  elseif MyLevel >= 3150  and MyLevel <= 3174 then
			Ms = "Pharaoh [Lv.3175]"
			CFrameQuest = CFrame.new(9554.38672, 14.4762154, 1545.59363, 0.31220305, 0, 0.950015426, 0, 1, 0, -0.950015426, 0, 0.31220305)
			NameMon = "Pharaoh"
			CFrameMon = CFrame.new(9227.5595703125, 48.831378936768, 1756.6544189453)
			levelquest = 3150
		  elseif MyLevel >= 3175 and MyLevel <= 3199 then
			Ms = "Flame User [Lv.3200]"
			CFrameQuest = CFrame.new(9857.44727, 14.7451639, 1684.2052, -0.0956259966, 0, 0.995417356, 0, 1, 0, -0.995417356, 0, -0.0956259966)
			NameMon = "Flame User"
			CFrameMon = CFrame.new(9992.525390625, 14.464115142822, 1862.8106689453)
			levelquest = 3175
		  elseif MyLevel >= 3200 and MyLevel <= 3224 then
			Ms = "Chess Soldier [Lv. 3200]"
			CFrameQuest = CFrame.new(6875, 28.9374027, 7951.53223, -0.992770553, 0, -0.12002904, 0, 1, 0, 0.12002904, 0, -0.992770553)
			NameMon = "Chess Soldier"
			CFrameMon = CFrame.new(7113.3916015625, 28.580911636353, 8096.2290039063)
			levelquest = 3200
		  elseif MyLevel >= 3225 and MyLevel <= 3249 then
			Ms = "Sunken Vessel [Lv.3225]"
			CFrameQuest = CFrame.new(6430.80225, 28.7034626, 7979.43799, -0.896995902, 0, -0.442038745, 0, 1, 0, 0.442038745, 0, -0.896995902)
			NameMon = "Sunken Vessel"
			CFrameMon = CFrame.new(6289.98828125, 28.580909729004, 8192.1240234375)
			levelquest = 3225
		  elseif MyLevel >= 3250 and MyLevel <= 3300 then
			Ms = "Biscuit Man [Lv.3250]"
			CFrameQuest = CFrame.new(5789.9624, 202.36792, 9032.56641, 0.256339848, -0, -0.966586709, 0, 1, -0, 0.966586709, 0, 0.256339848)
			NameMon = "Biscuit Man"
			CFrameMon = CFrame.new(5587.1118164063, 188.56538391113, 9047.994140625)
			levelquest = 3250
		  end
	   end
	 end
	 CheckQuest()
	
	 
	 local LocalPlayer = game:GetService("Players").LocalPlayer
	 local VirtualUser = game:GetService('VirtualUser')
	 function autofarm()
	   if game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == false then
		  pcall(function()
			CheckQuest()
			if not game:GetService("Workspace").AntiTPNPC:FindFirstChild("QuestLvl"..levelquest) then
			  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage").MAP["QuestLvl"..levelquest].HumanoidRootPart.CFrame
			else 
			  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").AntiTPNPC["QuestLvl"..levelquest].HumanoidRootPart.CFrame
			end
			
	 
			game:GetService'VirtualUser':Button1Down(Vector2.new(9999,9999))
			game:GetService'VirtualUser':Button1Up(Vector2.new(9999,9999))
			wait()
			for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
			  if v.Name == "Dialogue" then
				v.Accept.Size = UDim2.new(0, 10000, 0, 10000)
				v.Accept.Position = UDim2.new(-2, 0, -5, 0)
				v.Accept.ImageTransparency = 1
			  end
			end
		  end)
	   elseif game:GetService("Players").LocalPlayer.PlayerGui.Quest.QuestBoard.Visible == true then
		  CheckQuest()
		  if game:GetService("Workspace").Monster:GetDescendants(Ms) then
			pcall(function()
			  equip()
			  for i, v in pairs(game:GetService("Workspace").Monster:GetDescendants()) do
				CheckQuest()
				if v.Name == Ms then
				   repeat wait()
					 if v.Humanoid.Health > 0 then
					   VirtualUser:CaptureController()
					   VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
						 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,DistanceMob)
				 end
				   until v.Humanoid.Health <= 0 or _G.AutoFarm == false or not v.Parent 
				end
			  end
			end
			)
		  else
		  end
	   end
	 end
	 spawn(function()
	   game:GetService('RunService').Stepped:connect(function()
		  if Bisento or Anubis or AdventureKnife or _G.Kaido then
			pcall(function ()
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end)
		  end
	   end)
	 end)
	 spawn(function()
	   while wait() do
		  if _G.AutoFarm == true then
			 autofarm()
		  end
	   end
	 end)
	 spawn(function()
	   while wait(.1) do
		  if _G.AutoFarm or Bisento or Anubis or AdventureKnife or _G.Kaido or _G.Jackolanternhop then
			 pcall(function()
			 autoskillheehee()
			 wait(.1)
			 equip()
			end)
		  end
	   end
	 end)
	 
	 function attack()
	   game:GetService('VirtualUser'):CaptureController()
	   game:GetService('VirtualUser'):Button1Down(Vector2.new(9999, 9999))
	 end
	
	 DistanceMob = 3
	 page1:Slider("Distance Mob",false,false,0,100,7,1,false,function(dis)
	   DistanceMob = dis
	 end)
	 
	 function attack()
	   game:GetService('VirtualUser'):CaptureController()
	   game:GetService('VirtualUser'):Button1Down(Vector2.new(9999, 9999))
	 end

