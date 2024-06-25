using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Luvuyo2
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Khokha_Click(object sender, EventArgs e)
        {
            Response.Redirect("Private2.aspx");
        }
    }
}