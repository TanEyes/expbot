local discordia = require('discordia')
local client = discordia.Client()
token = require("expotoken")

local mods = require("expb/mods")



client:on("messageCreate", function(message)
    
    if message.guild then if message.channel.nsfw then
                for i, k in pairs(mods) do
                    k.chat(message)
                    end
        end end
    
    end)

client:run(token)
