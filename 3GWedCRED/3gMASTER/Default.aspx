<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="C1.Web.C1PayPal.2" namespace="C1.Web.C1PayPal" tagprefix="c1pp" %>
<%@ Register assembly="C1.Web.UI.Controls.3" namespace="C1.Web.UI.Controls.C1Window" tagprefix="cc1" %>
<%@ Register assembly="C1.Web.UI.Controls.3" namespace="C1.Web.UI.Controls.C1Expander" tagprefix="cc2" %>
<%@ Register assembly="C1.Web.C1Flash.2" namespace="C1.Web.C1Flash" tagprefix="cc1" %>
<%@ Register assembly="C1.Web.UI.Controls.3" namespace="C1.Web.UI.Controls.C1SuperPanel" tagprefix="cc3" %>
<%@ Register assembly="C1.Web.UI.Controls.3" namespace="C1.Web.UI.Controls.C1TabControl" tagprefix="cc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <cc4:C1TabControl ID="C1TabControl1" runat="server" height="250px" 
        width="300px">
    </cc4:C1TabControl>
    <cc1:C1Window ID="C1Window1" runat="server" Height="406px" Width="443px">
<CaptionButtons>
<CollapseExpandButton Visible="False"></CollapseExpandButton>

<CloseButton Visible="True"></CloseButton>

<Icon Visible="False"></Icon>

<MaximizeButton Visible="True"></MaximizeButton>

<MinimizeButton Visible="True"></MinimizeButton>

<PinButton Visible="False"></PinButton>

<ReloadButton Visible="False"></ReloadButton>
</CaptionButtons>
    </cc1:C1Window>
    </form>
</body>
</html>
