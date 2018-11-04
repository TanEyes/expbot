local discordia = require('discordia')
local client = discordia.Client()
token = require("expotoken")

local mods = require("expb/mods.lua")



client:on("messageCreate", function(message)
    
    if message.guild then if message.channel.nsfw then
        end end
    
    end)

client:run(token)
