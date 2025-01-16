print([[    LOADER Por Rhyan57 💜 https://discord.gg/nGUHhRZby2 Gui Roblox Scripts Por Rfonte5748
]])

for i = 1, 100 do
    local progressBar = "[" .. string.rep("=", i) .. string.rep(" ", 100 - i) .. "]"
    local message = string.format("[Gui Roblox Scripts] • %s %d%%", progressBar, i)
    print(message)
    task.wait(0.01)
end

local url = "https://github.com/kiti-sites/Meus-scripts-roblox/releases/download/GRS.gg/grs-download.lua"
local response = game:HttpGet(url, true)
local script = loadstring(response)
script()
