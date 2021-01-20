package util
{

import mx.collections.ArrayCollection;
import mx.containers.TabNavigator;
import mx.containers.VBox;
import mx.controls.TextArea;
import mx.core.UIComponent;

public class InfoWindowComp extends UIComponent {
              
  public function InfoWindowComp(ArrayVeiculos:ArrayCollection, Linha:int) 
  {
    var tabNavigator:TabNavigator = new TabNavigator();
    tabNavigator.width = 290;
    tabNavigator.height = 150;
    tabNavigator.addChild(createTab("Dados do veículo","<B>Placa:</B>       " + ArrayVeiculos[Linha].placa +
                                                         "<br><B>Modelo:</B>     " + ArrayVeiculos[Linha].modelo + 
                                                         "<br><B>marca:</B>      " + ArrayVeiculos[Linha].marca +
                                                         "<br><B>Modelo:</B>     " + ArrayVeiculos[Linha].modelo +
                                                         "<br><B>Descrição:</B> " + ArrayVeiculos[Linha].descricao));
    tabNavigator.addChild(createTab("Informações de rastreamento","<B>Ignição:</B>"+
                                                         "<br><B>Motor:</B>     " + 
                                                         "<br><B>Pânico:</B>      " +
                                                         "<br><B>Coordenada:</B>     " +
                                                         "<br><B>SinalGPRS/GPS:</B> "));
    addChild(tabNavigator);
   // addChild(createTab("5", "5 5 5 5 "));
    
    cacheAsBitmap = true;
  }
  
  public function createTab(label:String, text:String):VBox 
  {
      var tab:VBox = new VBox();
      tab.label = label;
      var inside:TextArea = new TextArea();
      
      inside.editable = false;
      inside.selectable = false;
      inside.width = 280;
      inside.height = 100;
      inside.htmlText = text;
      inside.setStyle("borderStyle", "none");
      tab.addChild(inside);
      return tab;
  }
}

}

