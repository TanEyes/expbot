local module = {}

currency = {}
function loads(mem)
if currency[mem.id] == nil then
	survive = false
	aa = io.open("expb/userdata/".. mem.id ..".lua" ,"r")
	if aa then
	for line in io.lines("expb/userdata/".. mem.id ..".lua") do if string.find(line, "return ret") then survive = true end end
end
	if aa and survive then
		currency[mem.id] = require("expb/userdata/".. mem.id)
		aa:close()
	else
		currency[mem.id] = {
				weight = {0}, eatCount = {1}, prestige = {0}
		}
	end
end
end
function save(guild)
	if type(currency[guild.id]) == "table" then
aa = io.open("expb/userdata/".. guild.id ..".lua", "w")
io.output(aa)
ee= ""
for i, k in pairs(currency[guild.id]) do
	if type(k) == "table" then str = ""
				for c, v in pairs(k) do if c < #k then str = str .. v .."," else str = str .. v end end
		ee = ee .."ret.".. i .." = {".. str .."}\n"
		else
		ee = ee .."ret.".. i .." = ".. k .."\n"
		end
end
io.write("ret = {} ".. ee .."\nreturn ret")
io.close()
end
	end
function curfind(guild) 
  load = false
  for i, k in pairs(currency) do
    if i == guild.id then load = true end
    end
  if not load then loads(guild) end
	return currency[guild.id]
  end
function module.chat(message)
	curfind(message.guild)
	for i=1, #currency[message.guild.id].weight do
		if currency[message.guild.id].weight[i] >= 1000000000000000000000000000000 then
			if currency[message.guild.id].weight[i+1] then
				currency[message.guild.id].weight[i+1] = currency[message.guild.id].weight[i+1] + 1
				currency[message.guild.id].weight[i] = currency[message.guild.id].weight[i] - 1000000000000000000000000000000
				else currency[message.guild.id].weight[i+1] = 1
				currency[message.guild.id].weight[i] = currency[message.guild.id].weight[i] - 1000000000000000000000000000000
				end
			end
		end
	for i=1, #currency[message.guild.id].eatCount do
		if currency[message.guild.id].eatCount[i] >= 1000000000000000000000000000000 then
			if currency[message.guild.id].eatCount[i+1] then
				currency[message.guild.id].eatCount[i+1] = currency[message.guild.id].eatCount[i+1] + 1
				currency[message.guild.id].eatCount[i] = currency[message.guild.id].eatCount[i] - 1000000000000000000000000000000
				else currency[message.guild.id].prestige[i+1] = 1
				currency[message.guild.id].eatCount[i] = currency[message.guild.id].eatCount[i] - 1000000000000000000000000000000
				end
			end
		end
	for i=1, #currency[message.guild.id].prestige do
		if currency[message.guild.id].prestige[i] >= 1000000000000000000000000000000 then
			if currency[message.guild.id].prestige[i+1] then
				currency[message.guild.id].prestige[i+1] = currency[message.guild.id].prestige[i+1] + 1
				currency[message.guild.id].prestige[i] = currency[message.guild.id].prestige[i] - 1000000000000000000000000000000
				else currency[message.guild.id].prestige[i+1] = 1
				currency[message.guild.id].prestige[i] = currency[message.guild.id].prestige[i] - 1000000000000000000000000000000
				end
			end
		end
	save(message.guild)
  end

function module.getCurrency(guild)
	return curfind(guild)
	end

function module.nUpdate(guild, table, id, value)
	currency[guild.id][table][id] = value
	save(guild)
	end

return module
