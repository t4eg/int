
-- clu->AddToLog(DOUT_3454)

--DOUT_3454:SwitchOn(500)

function tellme(offset, story)
    local aaaa = "[AdamStart]"
    local n,v
    for n,v in pairs(story) do
        if n ~= "loaded" and n ~= "_G" then
            io.write (offset .. n .. " " )
            aaaa =aaaa .. tostring(v) .. "|"
            if type(v) == "table" then
                tellme(offset .. "--> ",v)
            end
        end
    end
    clu->AddToLog(aaaa)
end


tellme("",_G)

-- clu->AddToLog(DOUT_3454:get("Value"))
--abc = loadstring("clu:kotlownia_roller_down:SwitchOn(1000)")

--abc()



--ls = loadstring("kotlowniaRoller:aaa()")
--ls()



-- clu->AddToLog(kotlowniaRoller:close())
