#file status <package>
#set(print) noautonewline (on)
#remove(__main__)

import package.Interface.*

def m = new Module()

def Gui = NULL;

def m.addMember(Init:bool(){
  wait Interface, Element;
  Gui = new Interface.CreateWindow("MyApp", Element.Size.Balance, Element.Size.Balance, Element.Position.Balance, Element.Position.Balance, Element.ColorRGB(155,155,155))
  if(Gui.Failed){
    error("Create Window Failed\n");
    return true;
  }
  return false;
});

def m.addMember(Destroy:bool(){
  if (!Gui){
    error("Gui is not init\n");
    return true;
  }
  Interface.DestroyWindow(Gui);
  return false;
});

export {m};
