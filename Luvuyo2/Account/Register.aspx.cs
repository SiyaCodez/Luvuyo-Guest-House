using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Luvuyo2.Models;
using System.Data.SqlClient;
namespace Luvuyo2.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
                conn.Open();
                //try
                //{
                SqlCommand cmd = new SqlCommand("INSERT INTO Guest VALUES(@surname,@name,@email,@contact)", conn);
                cmd.Parameters.AddWithValue("@surname", Surname.Text);
                cmd.Parameters.AddWithValue("@name", Name.Text);
                cmd.Parameters.AddWithValue("@email", Email.Text);
                cmd.Parameters.AddWithValue("@contact", Phone.Text);
                cmd.ExecuteNonQuery();
                SqlCommand cmd2 = new SqlCommand("SELECT GuestID FROM Guest WHERE GuestEmail=@email", conn);
                cmd2.Parameters.AddWithValue("@email", Email.Text);
                Session["UserLogged"] = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
                //}catch { Response.Write("<script>alert('network error')</script>"); }
                conn.Close();
                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
              
            }
        
    }
}