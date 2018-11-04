local module = {}

function module.chat(message)
  if message.content == "expb.test" then
    message.channel:send("Bot Functional")
    end
  end

return module
