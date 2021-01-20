<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_3GWebCLI.WebForm1" Title=".: Sistema 3GSat:." %>
<%@ register assembly="GMaps"
    namespace="Subgurim.Controles"
    tagprefix="maps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Button ID="Button1" runat="server" PostBackUrl="~/AreaSeguranca.aspx" 
    Text="Cerca" Width="135px" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <maps:GMap ID="GoogleMaps"
           runat="server"
           Key="ABQIAAAA60Yi54TYljE0FQ-0E4d0nBQbQQtspPKytngpyCGhFiH97vLYsRT_WtomBMsPuZncSsVrLzD7ulJ7wQ" 
           Width="627px" Height="332px" DataGIconImageField="" DataSourceType="PolygonsAndMarkers"
    />
    </div>
</asp:Content>
