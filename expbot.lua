local discordia = require('discordia')
local client = discordia.Client()
token = require "expotoken"

mods = require "expb/modules"



client:on("ready",function()
      client:setGame("NSFW")          
  end)

client:on("guildCreate", function(guild)
        if guild.systemChannel then
            guild.systemChannel:send("```css\nExponentia Has Joined!```")
            end
  end)

client:on("messageCreate", function(message)
    
    if message.guild then if message.channel.nsfw then
                for i, k in pairs(mods) do
                    k.chat(message)
                    end
        end end
    
    end)

client:run(token)
