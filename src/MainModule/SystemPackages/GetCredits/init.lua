local module = {}
local HttpService = game:GetService("HttpService")


local BACKUP_CREDITS = {}
local CREDITS_URL = "https://raw.githubusercontent.com/7kayoh/commander/main/src/server/SystemPackages/GetCredits/Credits.json"

function module.get()
	local success, result = pcall(function()
		return HttpService:GetAsync(CREDITS_URL)
	end)

	if success then
		return HttpService:JSONDecode(result)
	else
		return BACKUP_CREDITS
	end
end

return setmetatable({},{
	__call = module.get
})
