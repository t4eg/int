Classes = Classes()
CLU = CLU()
DOUT = DOUT()
Tools = Tools()
Roller = Roller()

kotlownia_roller_open = DOUT.new(DOUT_8076)
kotlownia_roller_close = DOUT.new(DOUT_6711)
kotlowniaRoller = Roller.new("kotlownia_roller", kotlownia_roller_open, kotlownia_roller_close, 2000, 500)

--Tools.sleep(1000)

kotlowniaRoller:open()



--Tools.sleep(4000)

--kotlowniaRoller:close()

