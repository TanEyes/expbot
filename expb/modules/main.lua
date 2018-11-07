local module = {}

function module.chat(message)
  if message.content == "expb.update" and message.author.id == "115529446370443265" then
    os.execute('cd "C:\Users\mrfee\Luvit"')
os.execute("git pull https://github.com/TanEyes/expbot --allow-unrelated-histories")
print("Updated.")
io.close()

    message.channel:send("Updated. Restarting...")
    os.execute("luvit expbot")
    os.execute("exit")
    end
  end

return module
