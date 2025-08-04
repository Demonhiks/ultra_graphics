-- Roblox Ultra Graphics + FPS Boost Script
-- Размещать только для ознакомительных целей

-- Ультра графика
settings().Rendering.QualityLevel = Enum.QualityLevel.Level21
game:GetService("Lighting").Technology = Enum.Technology.Future
game:GetService("Lighting").GlobalShadows = true
game:GetService("Lighting").Ambient = Color3.fromRGB(128, 128, 128)
game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
game:GetService("Lighting").Brightness = 3
game:GetService("Lighting").EnvironmentDiffuseScale = 1
game:GetService("Lighting").EnvironmentSpecularScale = 1

-- FPS Boost (оптимизация)
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("BasePart") then
        v.Material = Enum.Material.SmoothPlastic
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v:Destroy()
    end
end

-- Убираем ненужные эффекты
game:GetService("Lighting").FogEnd = 1000000
game:GetService("Lighting").Blur = nil
game:GetService("Lighting"):ClearAllChildren()  -- Удаляет эффекты, но может удалить важные скрипты (осторожно)

-- Отключение теней игроков
for _, v in pairs(game.Players:GetPlayers()) do
    if v.Character then
        for _, part in pairs(v.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CastShadow = false
            end
        end
    end
end

-- Повышение FPS путём снижения частоты рендеринга на заднем плане
setfpscap(240) -- Работает только в некоторых эксплойтах
