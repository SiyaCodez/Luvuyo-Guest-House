using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Luvuyo2.Private
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        private void ManageTb(ref TextBox tb)
        {
            if (tb.Enabled)
            {
               // tb.Enabled = false;
               // tb.BackColor = System.Drawing.Color.LightGray;
            }
            else
            {
                //tb.Enabled = true;
                //tb.BackColor = System.Drawing.Color.White;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){
                try
                {
                    SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Guest WHERE [GuestEmail]=@email", conn);
                    cmd.Parameters.AddWithValue("@email", User.Identity.Name);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    TextBox1.Text = dt.Rows[0][2].ToString();
                    TextBox2.Text = dt.Rows[0][1].ToString();
                    TextBox3.Text = dt.Rows[0][3].ToString();
                    TextBox4.Text = dt.Rows[0][4].ToString();
                    ManageTb(ref TextBox1);
                    ManageTb(ref TextBox2);
                    ManageTb(ref TextBox3);
                    ManageTb(ref TextBox4);

                    conn.Close();
                }
                catch { }
               
            }

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }
        public int getID(string tableName, string rhs)
        {
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM " + tableName + " WHERE GuestEmail=@rhs", conn);
            cmd.Parameters.AddWithValue("@rhs", rhs);
            string value = cmd.ExecuteScalar().ToString();
            conn.Close();
            return Convert.ToInt32(value);

        }
        //save-btn
        protected void Button1_Click(object sender, EventArgs e)
        {
            bool updated = false;
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            try
            {
                conn.Open();
                int id = getID("Guest", User.Identity.Name);
                if (TextBox1.Text != null && TextBox1.Text.Length > 0)
                {
                    SqlCommand cmd1 = new SqlCommand("UPDATE Guest SET GuestName=@name WHERE GuestID=@id", conn);
                    cmd1.Parameters.AddWithValue("@name", TextBox1.Text);
                    cmd1.Parameters.AddWithValue("@id", id);
                    cmd1.ExecuteNonQuery();
                    updated = true;
                }
                if (TextBox2.Text != null && TextBox2.Text.Length > 0)
                {
                    SqlCommand cmd2 = new SqlCommand("UPDATE Guest SET GuestSurname=@sname WHERE GuestID=@id", conn);
                    cmd2.Parameters.AddWithValue("@sname", TextBox2.Text);
                    cmd2.Parameters.AddWithValue("@id", id);
                    cmd2.ExecuteNonQuery();
                }
                if (TextBox3.Text != null && TextBox3.Text.Length > 0)
                {
                    SqlCommand cmd4 = new SqlCommand("UPDATE Guest SET GuestEmail=@email WHERE GuestID=@id", conn);
                    cmd4.Parameters.AddWithValue("@email", User.Identity.Name);
                    cmd4.Parameters.AddWithValue("@id", id);
                    cmd4.ExecuteNonQuery();

                    SqlCommand cmd3 = new SqlCommand("UPDATE AspNetUsers SET UserName=@uname,Email=@uname WHERE Email=@old", conn);
                    cmd3.Parameters.AddWithValue("@old", User.Identity.Name);
                    cmd3.Parameters.AddWithValue("@uname", TextBox3.Text);
                    cmd3.ExecuteNonQuery();
                    updated = true;
                }
                if (TextBox4.Text != null && TextBox4.Text.Length > 0)
                {
                    SqlCommand cmd5 = new SqlCommand("UPDATE Guest SET GuestContact=@contact WHERE GuestID=@id", conn);
                    cmd5.Parameters.AddWithValue("@contact", TextBox4.Text);
                    cmd5.Parameters.AddWithValue("@id", id);
                    cmd5.ExecuteNonQuery();
                    updated = true;
                }
                conn.Close();
                if(updated)
                    Response.Write("<script>alert('Successfully Updated Profile')</script>");
            }
            catch { Response.Write("<script>alert('SqlConnection Error')</script>"); }
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
    }
}