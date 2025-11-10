--==============================
-- ⚙ SETTINGS
--==============================
_G.AutoLottery = true
_G.AutoRedeem = true

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild("Remote")

local LotteryRE = Remote:WaitForChild("LotteryRE")
local RedeemRE = Remote:WaitForChild("RedemptionCodeRE")

--==============================
-- 🎁 CODES LIST
--==============================
local CODES = {
    "ZooFish829","BugFix829","SurpriseGift","FIXERROR819","MagicFruit",
    "WeekendEvent89","BugFixes","U2CA518SC5","X2CA821BA3","55PA21N8y2",
    "60KCCU919","DelayGift","SeasonOne","50KCCU0912","CFJXEH4M8K5",
    "4XW5RG4CHRY","N7A68Q82H83","3XKK8Z2WB6G","NA5Y874BAGG",
    "subtoZRGZeRoGhost","Hallaween1018","Nyaa","DS5523YSQ3C",
    "Halloween1018","ADQZP3MBW6N","ZTWPH3WW8SJ","CE8CWQDFZSH",
    "UPD18DINO","druscxlla"
}

--==============================
-- 🔁 LOOP: สุ่ม 10 ครั้ง
--==============================
spawn(function()
    while true do
        if _G.AutoLottery then
            pcall(function()
                LotteryRE:FireServer({{event="lottery", count=10}})
                print("🎰 10x Lottery")
            end)
        end
        task.wait(0.5)
    end
end)

--==============================
-- 🔁 LOOP: สุ่ม 1 ครั้ง
--==============================
spawn(function()
    while true do
        if _G.AutoLottery then
            pcall(function()
                LotteryRE:FireServer({{event="lottery", count=1}})
                print("🎰 1x Lottery")
            end)
        end
        task.wait(0.5)
    end
end)

--==============================
-- 🔁 LOOP: Redeem Codes
--==============================
spawn(function()
    while true do
        if _G.AutoRedeem then
            for round = 1, 3 do
                print("🌀 Redeem รอบ:", round)
                for _, code in ipairs(CODES) do
                    pcall(function()
                        RedeemRE:FireServer({
                            event = "usecode",
                            code = code
                        })
                    end)
                    print("🎁 แลกโค้ด:", code)
                    task.wait(0.4)
                end
            end
            print("♻️ เริ่มวงใหม่ (Auto Redeem ยังเปิดอยู่)")
        end
        task.wait(2)
    end
end)

--==============================
-- 📌 UI BUTTON
--==============================
local gui = Instance.new("ScreenGui")
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local function createButton(text, yPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 220, 0, 50)
    btn.Position = UDim2.new(0, 20, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text .. ": OFF"
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.Active = true
    btn.Draggable = true
    btn.Parent = gui

    local cr = Instance.new("UICorner", btn)
    cr.CornerRadius = UDim.new(0, 12)

    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(140, 180, 255)
    stroke.Thickness = 2

    return btn
end

-- ปุ่ม 1: Auto Lottery
local btnLottery = createButton("Auto Lottery", 200)

-- ปุ่ม 2: Redeem Codes
local btnRedeem = createButton("Redeem Codes", 260)

-- อัปเดตสีปุ่ม
local function updateButtons()
    -- Lottery
    if _G.AutoLottery then
        btnLottery.Text = "Auto Lottery: ON"
        btnLottery.BackgroundColor3 = Color3.fromRGB(60, 180, 110)
    else
        btnLottery.Text = "Auto Lottery: OFF"
        btnLottery.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    end

    -- Redeem
    if _G.AutoRedeem then
        btnRedeem.Text = "Redeem Codes: ON"
        btnRedeem.BackgroundColor3 = Color3.fromRGB(60, 180, 110)
    else
        btnRedeem.Text = "Redeem Codes: OFF"
        btnRedeem.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    end
end

-- คลิกปุ่มเปิด/ปิด
btnLottery.MouseButton1Click:Connect(function()
    _G.AutoLottery = not _G.AutoLottery
    updateButtons()
end)

btnRedeem.MouseButton1Click:Connect(function()
    _G.AutoRedeem = not _G.AutoRedeem
    updateButtons()
end)

updateButtons()
