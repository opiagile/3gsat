<%@ Import Namespace="quickstart" %>

<script language="C#" runat="server">

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
  	StringBuilder stringBuilder;;
  	
  	foreach(Object obj in al)
  	{
  		stringBuilder = new StringBuilder();
  		shippingOption = (ShippingOption)obj;
  		stringBuilder.Append(shippingOption.getService());
  		stringBuilder.Append(": ");
  		stringBuilder.Append(shippingOption.getPrice());
  		stringBuilder.Append(" USD" + "\n");
  		Response.Write(stringBuilder.ToString());  		
  	}
  }

</script>


 