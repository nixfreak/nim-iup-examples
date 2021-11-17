import niup
import niupext
import strformat
proc mainProc =
  niup.Open()

  let
    ver = Version()
    driver = GetGlobal("DRIVER")
    system = GetGlobal("SYSTEM")
    systemver = GetGlobal("SYSTEMVERSION")
    gtkver = GetGlobal("GTKVERSION")

  var msg = "IUP {ver}\nNim {NimVersion}\n{system} {systemver}\n{driver}".fmt

  if gtkver != nil:
    msg.add(" {gtkver}".fmt)

  let multitext = Text(nil)
  SetAttribute(multitext, "MULTILINE", "YES")
  SetAttribute(multitext, "EXPAND", "YES")
  SetAttribute(multitext, "VALUE", msg)

  let dlg = Dialog(Vbox(multitext,nil))
  SetAttribute(dlg, "TITLE", "Version")
  SetAttribute(dlg, "SIZE", "360x40")

  ShowXY(dlg, IUP_CENTER, IUP_CENTER)

  MainLoop()

  Close()

if isMainModule:
  mainProc()
