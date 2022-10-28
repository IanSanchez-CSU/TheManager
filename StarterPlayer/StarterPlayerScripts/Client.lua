print("Loaded Client")

--Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

ReplicatedStorage:WaitForChild("Remotes")

return {
	
	MyId = nil,
	Database = {Accounts = {}, Projects = {}},
	
	Remotes = ReplicatedStorage.Remotes,
	Layers = {
		Yield = false,
		
		Prompt = false,
		
		ManagerProjects = false,
		ManagerProfile = false,
		ManagerCreate = false,
		
		EmployeeProjects = false,
		EmployeeProfile = false,
		
		Register = false,
		Forgot = false,
		Login = false
	}
}