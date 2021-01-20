<%@ Import Namespace="quickstart" %>

<script language="C#" runat="server" ContentType="text/xml" >

  public string str="";
  
  public void Page_Load(Object sender, EventArgs E)
  {
  	int zipcode;
 	double weight;
 	
  	if(Request.RequestType == "POST")
  	{
		zipcode = Int32.Parse(Request.Form["zipcode"].ToString()); 
		weight = Double.Parse(Request.Form["pounds"].ToString()); 
	}
	else
	{
		zipcode = Int32.Parse(Request.QueryString["zipcode"].ToString()); 
		weight = Double.Parse(Request.QueryString["pounds"].ToString()); 
	}	

  	ShippingCalculator shippingcalculator = new ShippingCalculator();
	ShippingOption shippingOption = new ShippingOption();
	
  	ArrayList al =  shippingcalculator.getShippingOptions(zipcode, weight);
  	StringBuilder stringBuilder = new StringBuilder("<options>");  	
	
  	foreach(Object obj in al)
  	{  		
  		shippingOption = (ShippingOption)obj;
  		stringBuilder.Append("<option><service>");
  		stringBuilder.Append(shippingOption.getService());
  		stringBuilder.Append("</service><price>");
  		stringBuilder.Append(shippingOption.getPrice());
  		stringBuilder.Append("</price></option>" );  				
  	}
  	stringBuilder.Append("</options>");
  	str = stringBuilder.ToString();  
  	
  }

</script>
<?xml version="1.0" encoding="utf-8"?>
<%
Response.ContentEncoding = Encoding.UTF8;
Response.Write(str); 
%>



 