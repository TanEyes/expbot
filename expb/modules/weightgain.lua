local module = {}
local vars = {}
function module.init(mods)
    vars.mods = mods
    end
function module.chat(m)
    local cur = vars.mods.userdata.getCurrency(m.member)
    print(cur.weigh)
    vars.mods.userdata.nUpdate(m.member, "weight", 1, 100000000000000000000000000000000000000000000000000000000000)
    print("big")
    if m.content == "expb.weigh" then
        weigh = vars.mods.userdata.getCurrency(m.member)
        if weigh.weight[#weigh.weight-1] then str = string.format("%.0f", weigh.weight[#weigh.weight-1])
            while string.len(str) < string.len("100000000000000000000000000000000000000000000000000000000000") do
                str = "0" .. str end str = "." ..str 
        else str = "" end
        m:reply(weigh.weight[#weigh.weight] .. str)
        end
end

return module
