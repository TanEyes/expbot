local module = {}
local vars = {}
function module.init(mods)
    vars.mods = mods
    end
function module.chat(m)
    cur = vars.mods.userdata.getCurrency(m.member)
    if cur then print(cur.weigh) end
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
