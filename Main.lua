Classes = Classes()
CLU = CLU()
DOUT = DOUT()
Tools = Tools()
Roller = Roller()

kotlownia_roller_up = DOUT.new(DOUT_6711)
kotlownia_roller_up:getValue()

kotlownia_roller_down = DOUT.new(DOUT_2651)
kotlownia_roller_down:setValue(432)


--kotlowniaRoller = Roller.new("kotlownia_roller", kotlownia_roller_up, kotlownia_roller_down, 2000, 500)


--kotlowniaRoller:open()


--Tools.sleep(4)

--kotlowniaRoller:close()

