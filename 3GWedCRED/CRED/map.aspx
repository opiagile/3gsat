<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="iso-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;charset=ISO-8859-1">
<title>Exemplo de Google Maps API</title>
 <script src="http://maps.google.com/maps?file=api&v=1&key=ABQIAAAA60Yi54TYljE0FQ-0E4d0nBQbQQtspPKytngpyCGhFiH97vLYsRT_WtomBMsPuZncSsVrLzD7ulJ7wQ" type="text/javascript"></script>  type="text/javascript"></script>
<script type="text/javascript">
   //<![CDATA[
   
   //função para carregar um mapa de Google. 
   //Esta função é chamada quando a página termina de carregar. Evento onload
   function load() {
      //comprovamos se o navegador é compatível com os mapas de google
      if (GBrowserIsCompatible()) {
         //instanciamos um mapa com GMap, passando-lhe uma referência à camada ou <div> onde quisermos mostrar o mapa
         var map = new GMap2(document.getElementById("map"));   
         //centralizamos o mapa em uma latitude e longitude desejadas
         map.setCenter(new GLatLng(40.407,-3.68), 5);   
         //adicionamos controles ao mapa, para interação com o usuário
         map.addControl(new GLargeMapControl());
         map.addControl(new GMapTypeControl()); 
         map.addControl(new GOverviewMapControl()); ;
      }
   }
   
   //]]>
   </script>
</head>
<body onload="load()" onunload="GUnload()">
<div id="map" style="width: 615px; height: 400px"></div>
</body>
</html> 

