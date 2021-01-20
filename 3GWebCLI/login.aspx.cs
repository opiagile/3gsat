using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace _3GWebCLI
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login3g_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if ((Login3g.UserName == "admin") && (Login3g.Password == "123"))
            {
                e.Authenticated = true;
                FormsAuthentication.RedirectFromLoginPage(Login3g.UserName, false);
            }
            else
            {
                e.Authenticated = false;
            }
        }  
    }
}
