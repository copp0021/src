-- 🔁 Auto Redeem Codes (วนไม่จำกัดรอบ)
local CODES = {
    "ZooFish829",
    "BugFix829",
    "SurpriseGift",
    "FIXERROR819",
    "MagicFruit",
    "WeekendEvent89",
    "BugFixes",
    "U2CA518SC5",
    "X2CA821BA3",
    "55PA21N8y2",
    "60KCCU919",
    "DelayGift",
    "SeasonOne",
    "50KCCU0912",
    "CFJXEH4M8K5",
    "4XW5RG4CHRY",
    "N7A68Q82H83",
    "3XKK8Z2WB6G",
    "NA5Y874BAGG",
    "subtoZRGZeRoGhost",
    "Hallaween1018",
    "Nyaa",
    "DS5523YSQ3C",
    "Halloween1018",
    "ADQZP3MBW6N",
    "ZTWPH3WW8SJ",
    "CE8CWQDFZSH",
    "UPD18DINO",
     "druscxlla"
}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RedemptionCodeRE = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("RedemptionCodeRE")

-- 🔁 วนแลกโค้ดซ้ำไม่รู้จบ
while true do
	for round = 1, 3 do
		print("🌀 เริ่มรอบที่", round)
		for _, code in ipairs(CODES) do
			RedemptionCodeRE:FireServer({
				event = "usecode",
				code = code,
			})
			print("✅ แลกโค้ด:", code)
			task.wait(0.5)
		end
		print("🎯 รอบที่", round, "เสร็จสิ้น!")
	end
	print("🔄 เริ่มวนรอบใหม่อัตโนมัติ...")
	task.wait(1) -- หน่วงก่อนเริ่มรอบใหม่ 1 วินาที
end
