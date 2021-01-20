<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="_3GWebCLI.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>.: Sistema 3GSat:.</title>
</head>
<body>
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="854">
<!-- fwtable fwsrc="TEMPLATE.png" fwbase="3GLOGIN.jpg" fwstyle="Dreamweaver" fwdocid = "736602381" fwnested="0" -->
        <tr>
            <td>
                <img alt="" border="0" height="1" src="img/spacer.gif" 
                    width="36" /></td>
            <td>
                <img alt="" border="0" height="1" src="img/spacer.gif" 
                    width="465" /></td>
            <td>
                <img alt="" border="0" height="1" src="img/spacer.gif" 
                    width="28" /></td>
            <td>
                <img alt="" border="0" height="1" src="img/spacer.gif" 
                    width="289" /></td>
            <td>
                <img alt="" border="0" height="1" src="img/spacer.gif" 
                    width="36" /></td>
            <td>
                <img alt="" border="0" height="1" src="img/spacer.gif" 
                    width="1" /></td>
        </tr>
        <tr>
            <td rowspan="8">
                <img id="n3GLOGIN_r1_c1" alt="" border="0" height="489" name="n3GLOGIN_r1_c1" 
                    src="img/3GLOGIN_r1_c1.jpg" width="36" /></td>
            <td colspan="2">
                <img id="n3GLOGIN_r1_c2" alt="" border="0" height="30" name="n3GLOGIN_r1_c2" 
                    src="img/3GLOGIN_r1_c2.jpg" width="493" /></td>
            <td colspan="2" rowspan="2">
                <asp:Login ID="Login3g" runat="server" BackColor="White" BorderColor="White" 
                    BorderStyle="None" BorderWidth="0px" 
                    FailureText="Usuário ou senha incorreto. Tente novamente" Font-Names="Verdana" 
                    Font-Size="10pt" Height="132px" LoginButtonText="Acessar" 
                    PasswordLabelText="Senha:" 
                    PasswordRequiredErrorMessage="Senha é obrigatório." 
                    RememberMeText="Lembrar-me neste computador" TitleText="Sistema 3GSat" 
                    UserNameLabelText="Usuário:" 
                    UserNameRequiredErrorMessage="Usuário é obrigatório" Width="300px" 
                    onauthenticate="Login3g_Authenticate" ForeColor="#666666" 
                    style="margin-left: 0px">
                    <TextBoxStyle BackColor="#F7F3F7" BorderStyle="None" Font-Size="0.8em" 
                        Width="150px" />
                    <ValidatorTextStyle Font-Size="Smaller" />
                    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                        BorderColor="White" BorderWidth="10px" Font-Size="0.9em" VerticalAlign="Top" 
                        Wrap="False" />
                </asp:Login>
            </td>
            <td>
                <img alt="" border="0" height="30" src="img/spacer.gif" 
                    width="1" /></td>
        </tr>
        <tr>
            <td rowspan="2">
                &nbsp;</td>
            <td>
                <img id="n3GLOGIN_r2_c3" alt="" border="0" height="134" name="n3GLOGIN_r2_c3" 
                    src="img/3GLOGIN_r2_c3.jpg" width="28" /></td>
            <td>
                <img alt="" border="0" height="134" src="img/spacer.gif" 
                    width="1" /></td>
        </tr>
        <tr>
            <td background="img/3GLOGIN_r3_c3.jpg" colspan="3" 
                rowspan="2">
                &nbsp;</td>
            <td>
                <img alt="" border="0" height="10" src="img/spacer.gif" 
                    width="1" /></td>
        </tr>
        <tr>
            <td background="img/3GLOGIN_r4_c2.jpg">
                <img id="n3GLOGIN_r4_c2" alt="" border="0" height="15" name="n3GLOGIN_r4_c2" 
                    src="img/3GLOGIN_r4_c2.jpg" width="465" /></td>
            <td>
                <img alt="" border="0" height="15" src="img/spacer.gif" 
                    width="1" /></td>
        </tr>
        <tr>
            <td bgcolor="#F1F1F1" colspan="3">
                &nbsp;</td>
            <td rowspan="4">
                <img id="n3GLOGIN_r5_c5" alt="" border="0" height="300" name="n3GLOGIN_r5_c5" 
                    src="img/3GLOGIN_r5_c5.jpg" width="36" /></td>
            <td>
                <img alt="" border="0" height="238" src="img/spacer.gif" 
                    width="1" /></td>
        </tr>
        <tr>
            <td colspan="3">
                <img id="n3GLOGIN_r6_c2" alt="" border="0" height="9" name="n3GLOGIN_r6_c2" 
                    src="img/3GLOGIN_r6_c2.jpg" width="782" /></td>
            <td>
                <img alt="" border="0" height="9" src="img/spacer.gif" 
                    width="1" /></td>
        </tr>
        <tr>
            <td colspan="3">
                <img id="n3GLOGIN_r7_c2" alt="" border="0" height="33" name="n3GLOGIN_r7_c2" 
                    src="img/3GLOGIN_r7_c2.jpg" width="782" /></td>
            <td>
                <img alt="" border="0" height="33" src="img/spacer.gif" 
                    width="1" /></td>
        </tr>
        <tr>
            <td colspan="3">
                <img id="n3GLOGIN_r8_c2" alt="" border="0" height="20" name="n3GLOGIN_r8_c2" 
                    src="img/3GLOGIN_r8_c2.jpg" width="782" /></td>
            <td>
                <img alt="" border="0" height="20" src="img/spacer.gif" 
                    width="1" /></td>
        </tr>
    </table>
    </form>
</body>
</html>
