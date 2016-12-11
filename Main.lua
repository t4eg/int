Classes = Classes()
CLU = CLU()
DOUT = DOUT()
DIGITAL_IN = DIGITAL_IN()
Tools = Tools()
Roller = Roller()
RollerButton = RollerButton()

kotlownia_roller_open = DOUT.new(DOUT_8076)
kotlownia_roller_close = DOUT.new(DOUT_6711)
kotlowniaRoller = Roller.new("kotlownia_roller", kotlownia_roller_open, kotlownia_roller_close, 2000, 500)

kotlownia_button_up = DIGITAL_IN.new(DIN_5173)
kotlownia_button_down = DIGITAL_IN.new(DIN_1318)
kotlownia_roller_button = RollerButton.new(kotlownia_button_up, kotlownia_button_down)
kotlownia_roller_button:setRoller(kotlowniaRoller)

--Tools.sleep(1000)

--DIN_5173:click()

--kotlowniaRoller:open()
--kotlowniaRoller:open()



--kotlowniaRoller:close()

