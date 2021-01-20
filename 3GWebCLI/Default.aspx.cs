using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Subgurim.Controles;

namespace _3GWebCLI
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Habilitando o zoom no mapa
            GoogleMaps.enableHookMouseWheelToZoom = true;

            // Definir o tipo do mapa
            // Satellite, Hybrid, Physical, Normal
            GoogleMaps.mapType = GMapType.GTypes.Normal;

            // Define a Latitude e Logitude inicial do Mapa
            // Como moro em Brasília, coloquei o Congresso Nacional
            GLatLng latitudeLongitude = new GLatLng(-25.366085, - 49.220698);

            // Definimos onde será o ponto inicial do nosso mapa
            // e o numero é o ZOOM inicial
            GoogleMaps.setCenter(latitudeLongitude, 17);

            GIcon icon = new GIcon();
            icon.image = "/img/3gsaticon.png";
            icon.iconSize = new GSize(32, 32);
            icon.shadowSize = new GSize(22, 20);
            icon.iconAnchor = new GPoint(6, 20);
            icon.infoWindowAnchor = new GPoint(5, 1);

            GMarkerOptions mOpts = new GMarkerOptions();
            mOpts.icon = icon;

            // Acionando os controles
            GControl overview = new GControl(GControl.preBuilt.GOverviewMapControl);
            GControl MapControl = new GControl(GControl.preBuilt.LargeMapControl3D);
            GoogleMaps.addControl(overview); 
            GoogleMaps.addControl(MapControl);

            GMarker marker = new GMarker(latitudeLongitude,mOpts);            
            GInfoWindow window = new GInfoWindow(marker, "<center><b>Teste 3GSat<BR>Teste linha<BR>"+latitudeLongitude+"</b></center>");
            GoogleMaps.addGMarker(marker);
            GoogleMaps.addInfoWindow(window);            

        }
    }
}
