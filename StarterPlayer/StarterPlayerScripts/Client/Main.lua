print("Loaded Client.Main")
local client = require(script.Parent)
client.Gui = require(script.Gui)
client.Process = require(script.Process)

client.Remotes.SynchronizeDatabase.OnClientEvent:Connect(function(database)
	client.Database = database
end)

local id_buffer = nil
client.Remotes.AccountCreated.OnClientEvent:Connect(function(id)
	if id then
		id_buffer = id
	else
		id_buffer = false
	end
end)

-- initializing gui elements

client.Gui.AddLayer("Yield", 10, {
	client.Menus.Yield
}, nil)

client.Gui.AddLayer("Prompt", 9, {
	client.Menus.Prompt
}, nil)

client.Gui.AddLayer("ManagerProjects", 8, {
	client.Menus.Main,
	client.Menus.Main.ManagerProjects
}, function()
	client.Menus.Main.Tabs.Size = UDim2.new(0, 640, 0, 60)
	client.Menus.Main.Tabs.Third.Visible = true
	client.Menus.Main.Tabs.First.ImageColor3 = Color3.fromRGB(50, 125, 50)
	client.Menus.Main.Tabs.First.TextLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
	client.Menus.Main.Tabs.First.TextLabel.Text = "Projects"
	client.Menus.Main.Tabs.Second.ImageColor3 = Color3.fromRGB(100, 100, 100)
	client.Menus.Main.Tabs.Second.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	client.Menus.Main.Tabs.Second.TextLabel.Text = "Create"
	client.Menus.Main.Tabs.Third.ImageColor3 = Color3.fromRGB(100, 100, 100)
	client.Menus.Main.Tabs.Third.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	client.Menus.Main.Tabs.Third.TextLabel.Text = "Profiles"
end)

client.Gui.AddLayer("ManagerProfile", 7, {
	client.Menus.Main,
	client.Menus.Main.ManagerProfile
}, function()
	client.Menus.Main.Tabs.Size = UDim2.new(0, 640, 0, 60)
	client.Menus.Main.Tabs.Third.Visible = true
	client.Menus.Main.Tabs.First.ImageColor3 = Color3.fromRGB(100, 100, 100)
	client.Menus.Main.Tabs.First.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	client.Menus.Main.Tabs.First.TextLabel.Text = "Projects"
	client.Menus.Main.Tabs.Second.ImageColor3 = Color3.fromRGB(100, 100, 100)
	client.Menus.Main.Tabs.Second.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	client.Menus.Main.Tabs.Second.TextLabel.Text = "Create"
	client.Menus.Main.Tabs.Third.ImageColor3 = Color3.fromRGB(50, 125, 50)
	client.Menus.Main.Tabs.Third.TextLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
	client.Menus.Main.Tabs.Third.TextLabel.Text = "Profiles"
end)

client.Gui.AddLayer("ManagerCreate", 6, {
	client.Menus.Main,
	client.Menus.Main.ManagerCreate
}, function()
	client.Menus.Main.Tabs.Size = UDim2.new(0, 640, 0, 60)
	client.Menus.Main.Tabs.Third.Visible = true
	client.Menus.Main.Tabs.First.ImageColor3 = Color3.fromRGB(100, 100, 100)
	client.Menus.Main.Tabs.First.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	client.Menus.Main.Tabs.First.TextLabel.Text = "Projects"
	client.Menus.Main.Tabs.Second.ImageColor3 = Color3.fromRGB(50, 125, 50)
	client.Menus.Main.Tabs.Second.TextLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
	client.Menus.Main.Tabs.Second.TextLabel.Text = "Create"
	client.Menus.Main.Tabs.Third.ImageColor3 = Color3.fromRGB(100, 100, 100)
	client.Menus.Main.Tabs.Third.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	client.Menus.Main.Tabs.Third.TextLabel.Text = "Profiles"
end)

client.Gui.AddLayer("EmployeeProjects", 5, {
	client.Menus.Main,
	client.Menus.Main.EmployeeProjects
}, function()
	client.Menus.Main.Tabs.Size = UDim2.new(0, 430, 0, 60)
	client.Menus.Main.Tabs.Third.Visible = false
	client.Menus.Main.Tabs.First.ImageColor3 = Color3.fromRGB(50, 125, 50)
	client.Menus.Main.Tabs.First.TextLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
	client.Menus.Main.Tabs.First.TextLabel.Text = "Projects"
	client.Menus.Main.Tabs.Second.ImageColor3 = Color3.fromRGB(100, 100, 100)
	client.Menus.Main.Tabs.Second.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	client.Menus.Main.Tabs.Second.TextLabel.Text = "My Profile"
end)

client.Gui.AddLayer("EmployeeProfile", 4, {
	client.Menus.Main,
	client.Menus.Main.EmployeeProfile
}, function()
	client.Menus.Main.Tabs.Size = UDim2.new(0, 430, 0, 60)
	client.Menus.Main.Tabs.Third.Visible = false
	client.Menus.Main.Tabs.First.ImageColor3 = Color3.fromRGB(100, 100, 100)
	client.Menus.Main.Tabs.First.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	client.Menus.Main.Tabs.First.TextLabel.Text = "Projects"
	client.Menus.Main.Tabs.Second.ImageColor3 = Color3.fromRGB(50, 125, 50)
	client.Menus.Main.Tabs.Second.TextLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
	client.Menus.Main.Tabs.Second.TextLabel.Text = "My Profile"
end)

client.Gui.AddLayer("Register", 3, {
	client.Menus.Register
}, function()
	client.Menus.Register.Input1.TextBox.Text = ""
	client.Menus.Register.Input2.TextBox.Text = ""
end)

client.Gui.AddLayer("Forgot", 2, {
	client.Menus.Forgot
}, function()
	client.Menus.Forgot.Input.TextBox.Text = ""
end)

client.Gui.AddLayer("Login", 1, {
	client.Menus.Login
}, function()
	client.Menus.Login.Input.TextBox.Text = ""
end)

coroutine.wrap(function()
	client.Process.AddTask("Connecting")
	repeat
		game:GetService("RunService").Heartbeat:Wait()
	until game:GetService("ReplicatedStorage"):FindFirstChild("Ready")
	client.Process.EndTask("Connecting")
	client.Remotes.SynchronizeDatabase:FireServer()
	client.Layers.Login = true
end)()

client.Gui.Button.Add(
	client.Menus.Login.Access.Button, {client.Menus.Login}, nil, nil, nil,
	{
		Clicked = function()
			local sample = client.Menus.Login.Input.TextBox.Text
			for account, data in pairs(client.Database.Accounts) do
				if data.Id == sample then
					client.MyId = data.Id
					client.Menus.Prompt.Header.Text = "Welcome,"
					client.Menus.Prompt.Caption.Text = "<font color=\"rgb(255,255,100)\">" .. data.FullName .. "</font>"
					client.Menus.Prompt.Action.ImageColor3 = Color3.fromRGB(50, 125, 50)
					client.Menus.Prompt.Action.TextLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
					client.Menus.Prompt.Action.TextLabel.Text = "Continue"
					if data.Manager then
						client.Layers.ManagerProjects = true
						client.Menus.Main.Identification.Text = data.FullName.. ", Manager"
					else
						client.Layers.EmployeeProjects = true
						client.Menus.Main.Identification.Text = data.FullName.. ", Employee"
					end
					client.Layers.Prompt = true
					client.Layers.Login = false
					break
				end
			end
		end
	}
)
client.Gui.Button.Add(
	client.Menus.Login.Register.Button, {client.Menus.Login}, nil, nil, nil,
	{
		Clicked = function()
			client.Layers.Register = true
		end
	}
)
client.Gui.Button.Add(
	client.Menus.Login.Forgot.Button, {client.Menus.Login}, nil, nil, nil,
	{
		Clicked = function()
			client.Layers.Forgot = true
		end
	}
)
do
	local function Refresh()
		local sample = client.Menus.Login.Input.TextBox.Text
		local highlight = false
		if sample:match("%d%d%d%d") then
			for account, data in pairs(client.Database.Accounts) do
				if data.Id == sample then
					highlight = true
					break
				end
			end
		end
		if highlight then
			client.Menus.Login.Access.ImageColor3 = Color3.fromRGB(50, 125, 50)
			client.Menus.Login.Access.TextLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
		else
			client.Menus.Login.Access.ImageColor3 = Color3.fromRGB(100, 100, 100)
			client.Menus.Login.Access.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		end
	end
	Refresh()
	client.Menus.Login.Input.TextBox:GetPropertyChangedSignal("Text"):Connect(Refresh)
	client.Menus.Login.Input.TextBox.FocusLost:Connect(function()
		if not (tonumber(client.Menus.Login.Input.TextBox.Text) and client.Menus.Login.Input.TextBox.Text:len() == 4) then
			game:GetService("RunService").Heartbeat:Wait()
			client.Menus.Login.Input.TextBox.Text = ""
		end
	end)
end


client.Gui.Button.Add(
	client.Menus.Register.Action.Button, {client.Menus.Register}, nil, nil, nil,
	{
		Clicked = function()
			if client.Menus.Register.Input1.TextBox.Text == "" then
				return
			end
			client.Layers.Register = false
			local name, key = client.Menus.Register.Input1.TextBox.Text, client.Menus.Register.Input2.TextBox.Text
			id_buffer = nil
			client.Process.AddTask("Creating")
			client.Remotes.RegisterNewAccount:FireServer(name, key)
			repeat
				game:GetService("RunService").Heartbeat:Wait()
			until id_buffer ~= nil
			client.Process.EndTask("Creating")
			if id_buffer then
				client.Menus.Prompt.Header.Text = id_buffer
				client.Menus.Prompt.Caption.Text = "is the account id for <font color=\"rgb(255,255,100)\">" .. name .. "</font>"
			else
				client.Menus.Prompt.Header.Text = "Process Failed"
				client.Menus.Prompt.Caption.Text = "when creating an account for <font color=\"rgb(255,255,100)\">" .. name .. "</font>"
			end
			client.Menus.Prompt.Action.ImageColor3 = Color3.fromRGB(125, 100, 50)
			client.Menus.Prompt.Action.TextLabel.TextColor3 = Color3.fromRGB(255, 170, 100)
			client.Menus.Prompt.Action.TextLabel.Text = "Return"
			client.Layers.Prompt = true
		end
	}
)
client.Gui.Button.Add(
	client.Menus.Register.Cancel.Button, {client.Menus.Register}, nil, nil, nil,
	{
		Clicked = function()
			client.Layers.Register = false
		end
	}
)
do
	local function Refresh()
		if client.Menus.Register.Input1.TextBox.Text ~= "" then
			client.Menus.Register.Action.ImageColor3 = Color3.fromRGB(50, 125, 50)
			client.Menus.Register.Action.TextLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
		else
			client.Menus.Register.Action.ImageColor3 = Color3.fromRGB(100, 100, 100)
			client.Menus.Register.Action.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		end
	end
	Refresh()
	client.Menus.Register.Input1.TextBox:GetPropertyChangedSignal("Text"):Connect(Refresh)
end


client.Gui.Button.Add(
	client.Menus.Forgot.Action.Button, {client.Menus.Forgot}, nil, nil, nil,
	{
		Clicked = function()
			if client.Menus.Forgot.Input.TextBox.Text == "" then
				return
			end
			client.Layers.Forgot = false
			local found = nil
			local name = client.Menus.Forgot.Input.TextBox.Text:lower()
			for account, data in pairs(client.Database.Accounts) do
				if data.FullName:lower() == name then
					found = data.Id
					break
				end
			end
			if found then
				client.Menus.Prompt.Header.Text = found
				client.Menus.Prompt.Caption.Text = "is the account id for <font color=\"rgb(255,255,100)\">" .. name .. "</font>"
			else
				client.Menus.Prompt.Header.Text = "No Matches"
				client.Menus.Prompt.Caption.Text = "of an account id for <font color=\"rgb(255,255,100)\">" .. name .. "</font>"
			end
			client.Menus.Prompt.Action.ImageColor3 = Color3.fromRGB(125, 100, 50)
			client.Menus.Prompt.Action.TextLabel.TextColor3 = Color3.fromRGB(255, 170, 100)
			client.Menus.Prompt.Action.TextLabel.Text = "Return"
			client.Layers.Prompt = true
		end
	}
)
client.Gui.Button.Add(
	client.Menus.Forgot.Cancel.Button, {client.Menus.Forgot}, nil, nil, nil,
	{
		Clicked = function()
			client.Layers.Forgot = false
		end
	}
)
do
	local function Refresh()
		if client.Menus.Forgot.Input.TextBox.Text ~= "" then
			client.Menus.Forgot.Action.ImageColor3 = Color3.fromRGB(50, 125, 50)
			client.Menus.Forgot.Action.TextLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
		else
			client.Menus.Forgot.Action.ImageColor3 = Color3.fromRGB(100, 100, 100)
			client.Menus.Forgot.Action.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		end
	end
	Refresh()
	client.Menus.Forgot.Input.TextBox:GetPropertyChangedSignal("Text"):Connect(Refresh)
end


local function IsManager()
	for account, data in pairs(client.Database.Accounts) do
		if data.Id == client.MyId then
			return data.Manager
		end
	end
end
client.Gui.Button.Add(
	client.Menus.Main.Tabs.First.Button, {client.Menus.Main}, nil, nil, nil,
	{
		Clicked = function()
			local order = IsManager() and {"ManagerProjects", "ManagerProfile", "ManagerCreate"} or {"EmployeeProjects", "EmployeeProfile"}
			for i = 1, #order do
				client.Layers[order[i]] = i == 1
			end
		end
	}
)
client.Gui.Button.Add(
	client.Menus.Main.Tabs.Second.Button, {client.Menus.Main}, nil, nil, nil,
	{
		Clicked = function()
			local order = IsManager() and {"ManagerCreate", "ManagerProjects", "ManagerProfile"} or {"EmployeeProfile", "EmployeeProjects"}
			for i = 1, #order do
				client.Layers[order[i]] = i == 1
			end
		end
	}
)
client.Gui.Button.Add(
	client.Menus.Main.Tabs.Third.Button, {client.Menus.Main, client.Menus.Main.Tabs.Third}, nil, nil, nil,
	{
		Clicked = function()
			if not IsManager() then return end
			local order = {"ManagerProfile", "ManagerCreate", "ManagerProjects"}
			for i = 1, #order do
				client.Layers[order[i]] = i == 1
			end
		end
	}
)
client.Gui.Button.Add(
	client.Menus.Main.Exit.Button, {client.Menus.Main}, nil, nil, nil,
	{
		Clicked = function()
			for _, i in pairs({"ManagerProjects", "ManagerProfile", "ManagerCreate", "EmployeeProjects", "EmployeeProfile"}) do
				client.Layers[i] = false
			end
			client.Layers.Login = true
			client.MyId = nil
		end
	}
)




client.Gui.Button.Add(
	client.Menus.Prompt.Action.Button, {client.Menus.Prompt}, nil, nil, nil,
	{
		Clicked = function()
			client.Layers.Prompt = false
		end
	}
)


return function(dt)
	client.Gui.Update(dt)
end