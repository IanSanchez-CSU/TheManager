local MANAGER_KEY = "test"

local TheManager = game:GetService("DataStoreService"):GetDataStore("TheManager_v0.0")
local database = TheManager:GetAsync("Database")
if not database then
	database = {
		Accounts = {},
		Projects = {}
	}
end

local synchronize = game:GetService("ReplicatedStorage").Remotes.SynchronizeDatabase
synchronize.OnServerEvent:Connect(function(client)
	synchronize:FireClient(client, database)
end)

local created = game:GetService("ReplicatedStorage").Remotes.AccountCreated
local register = game:GetService("ReplicatedStorage").Remotes.RegisterNewAccount
register.OnServerEvent:Connect(function(client, name, key)
	for account, data in pairs(database.Accounts) do
		if data.FullName:lower() == name:lower() then
			created:FireClient(client, nil)
			print("Duplicate")
			return nil
		end
	end
	
	local id, attempts = nil, 0
	repeat
		local sample = string.format("%04d", math.random(0, 9999))
		local unique = true
		for account, data in pairs(database.Accounts) do
			if data.Id == sample then
				unique = false
				break
			end
		end
		if unique then
			id = sample
		else
			attempts += 1
		end
	until id or attempts == 100
	
	if id then
		database.Accounts[#database.Accounts + 1] = {
			FullName = name,
			Id = id,
			Manager = (key == MANAGER_KEY) and true or false
		}
		print(database)
		created:FireClient(client, id)
		synchronize:FireAllClients(database)		
		TheManager:SetAsync("Database", database)
	else
		print("No id created")
		created:FireClient(client, nil)
	end
end)


Instance.new("Flag", game:GetService("ReplicatedStorage")).Name = "Ready"