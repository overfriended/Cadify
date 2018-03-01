local discordia = require('discordia')
local client = discordia.Client()
local version = "1.0"
local author = "@Cad#3482"

client:on('ready', function()
	print('Logged in as '.. client.user.username)
	client:setGame("!help")
end)

client:on('messageCreate', function(message)
	if message.content == "!info" then
		message.channel:send {
  			embed = {
    			title = "CadBot Information",
    			fields = {
     				{name = "Status", value = "Operational", inline = true},
      				{name = "Version", value = version, inline = false},
      				{name = "Author", value = author, inline = false},
    },
    color = discordia.Color.fromRGB(255, 0, 0).value,
    timestamp = discordia.Date():toISO('T', 'Z')
  }
}
	end
	if message.content == "!exit" then
		if message.author == message.client.owner then
			message.channel:send {
			embed = {
				title = "CadBot Maintenance",
				fields = {
					{name = "Issuer", value = message.author.username, inline = true},
					{name = "Reason", value = "Maintenance", inline = true},
				},
				color = discordia.Color.fromRGB(0, 255, 0).value,
			}
		}
		end
	end
end)

client:run('Bot NDExMjkwMTI0NTE3OTAwMjk5.DV5lQA.RbRCJfyOfhwuQrnIwQEJAieOFMA')