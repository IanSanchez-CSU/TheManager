print("Loaded Client.Menus")
local client = require(script.Parent)

--Services
local Players = game:GetService("Players")

--Preloading
local gui = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Gui")
gui:WaitForChild("Forgot")
gui:WaitForChild("Login")
gui:WaitForChild("Main")
gui:WaitForChild("Prompt")
gui:WaitForChild("Register")
gui:WaitForChild("Yield")

return {
	Gui = gui,
	Forgot = gui.Forgot,
	Login = gui.Login,
	Main = gui.Main,
	Prompt = gui.Prompt,
	Register = gui.Register,
	Yield = gui.Yield
}