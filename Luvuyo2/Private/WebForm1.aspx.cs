using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace Luvuyo2.Private
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 

            if(Session["lastPg"].ToString() == "1")
            {
                MultiView1.ActiveViewIndex = 1;
            }
            else if (Session["lastPg"].ToString() == "2")
            {
                MultiView1.ActiveViewIndex = 2;
            }
            else if (Session["lastPg"].ToString() == "3")
            {
                MultiView1.ActiveViewIndex = 3;
            }

        }
        protected void Label1_Click(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["lastPg"] = "0";
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["lastPg"] = "1";
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["lastPg"] = "2";
            MultiView1.ActiveViewIndex = 2;
        }
        private int getID(string email)
        {
            try
            {
                SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT GuestID FROM Guest WHERE GuestEmail=@Email", conn);
                cmd.Parameters.AddWithValue("@Email", email);
                int id = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                conn.Close();
                return id;
            }catch { Response.Write("<script>alert('Connection Error Try Later')</script>"); return -1; }
            
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null)
            {
                Response.Write("<script>alert('Please select a room to checkout!')</script>");
                return;
            }
            
            string email =  DetailsView1.Rows[2].Cells[1].Text;
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            //get guest and room id
            conn.Open();
            int guestId = getID(email);
            if(guestId != -1)
            {
                int roomId = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
                SqlCommand checkOut = new SqlCommand("update ReservationRoom SET CheckoutDate=CONVERT(date,GETDATE()) where ReservationRoom.ReservationId in(select Reservation.ReservationID from Reservation where Reservation.GuestID=@guestID and Reservation.ReservationID in(SELECT ReservationRoom.ReservationId FROM ReservationRoom where convert(date,CheckInDate) <= convert(date,getdate()) and convert(date,CheckOutDate) > convert(date,getdate()) and ReservationRoom.RoomId=@roomID));", conn);
                checkOut.Parameters.AddWithValue("@guestID", guestId);
                checkOut.Parameters.AddWithValue("@roomID", roomId);
                if(checkOut.ExecuteNonQuery() > 0)
                {
                    string message = DetailsView1.Rows[0].Cells[1].Text+"  "+ DetailsView1.Rows[1].Cells[1].Text+"\n Checked Out From Room "+roomId;
                    Response.Write("<script>alert('" + message + "')</script>");
                }
            }
            conn.Close();
            Response.Redirect("WebForm1.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox4.Text == null || TextBox2.Text == null || TextBox3.Text == null) { Response.Write("<script>alert('Enter All Fields')</script>"); return; }
                SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
                conn.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Rooms VALUES(-1,@RoomType,@capacity,'available',@price)", conn);
                cmd.Parameters.AddWithValue("@RoomType", TextBox4.Text);
                cmd.Parameters.AddWithValue("@capacity", TextBox2.Text);
                cmd.Parameters.AddWithValue("@price", TextBox3.Text);
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("SELECT TOP(1) RoomID FROM Rooms order by RoomID DESC", conn);
                int id = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                cmd = new SqlCommand("UPDATE Rooms SET RoomNumber = @id WHERE RoomID = " + id, conn);
                cmd.Parameters.AddWithValue("@id", id);
                if (cmd.ExecuteNonQuery() > 0)
                {
                    conn.Close();
                    Response.Write("<script>alert('Successful.')</script>");
                    Session["lastPg"] = "2";
                    Response.Redirect("WebForm1.aspx");
                }    
            }
            catch { }
        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            if (GridView3.SelectedRow == null)
            {
                Response.Write("<script>alert('Click Room Grid For Room To Update.')</script>");
                return;
            }
            try
            {
                SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
                conn.Open();
                int i = 0, j = 0;
                if (!string.IsNullOrWhiteSpace(TextBox1.Text) || !string.IsNullOrWhiteSpace(TextBox5.Text))
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE Rooms SET RoomType = COALESCE(@newType, RoomType), Price = COALESCE(@price, Price) WHERE RoomID = @id", conn))
                    {
                        cmd.Parameters.AddWithValue("@newType", string.IsNullOrWhiteSpace(TextBox1.Text) ? (object)DBNull.Value : TextBox1.Text);
                        cmd.Parameters.AddWithValue("@price", string.IsNullOrWhiteSpace(TextBox5.Text) ? (object)DBNull.Value : TextBox5.Text);
                        cmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridView3.SelectedRow.Cells[1].Text));

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Update successful.')</script>");
                        }
                    }
                }
                conn.Close();
                Session["lastPg"] = "1";
                Response.Redirect("WebForm1.aspx");
            }
            catch { }

            }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button9.Visible = true;
        }
        private bool cCbox(TextBox t)
        {
            if (t.Text != null && t.Text.Length > 0)
            {
                return true;
            }
            return false;
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            Session["lastPg"] = "3";
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            try
            {
                conn.Open();
                if (cCbox(TextBox6) && cCbox(TextBox7) && cCbox(TextBox8))
                {
                    SqlCommand cmd2 = new SqlCommand("INSERT INTO Inventory VALUES(@name,@qty,@up,@tp,@supplierId)", conn);
                    cmd2.Parameters.AddWithValue("@name", TextBox6.Text);
                    cmd2.Parameters.AddWithValue("@qty", TextBox7.Text);
                    cmd2.Parameters.AddWithValue("@up", TextBox8.Text);
                    decimal d = Convert.ToDecimal(TextBox8.Text) * Convert.ToDecimal(TextBox7.Text);
                    cmd2.Parameters.AddWithValue("@tp", d);
                    int id = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
                    cmd2.Parameters.AddWithValue("@supplierId", id);
                    if (cmd2.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<script>alert('Stock Added')</script>");
                    }
                    Response.Redirect("WebForm1.aspx");
                }
                conn.Close();
            }
            catch { }
        }

        protected void Button8_Click1(object sender, EventArgs e)
        {
            Response.Redirect("https://app.powerbi.com/reportEmbed?reportId=4c42e6df-604d-4558-b27f-a62c12aef093&autoAuth=true&ctid=226827d6-a9d0-470d-8c15-b146b0192d51");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            try
            {
                conn.Open();
                if (GridView3.SelectedRow == null)
                {
                    Response.Write("<script>alert('Select A Room')</script>");
                }
                else if (GridView4.SelectedRow == null)
                {
                    Response.Write("<script>alert('Select A Guest')</script>");
                }
                else
                {
                    DateTime checkin = Convert.ToDateTime(GridView4.SelectedRow.Cells[5].Text);
                    DateTime checkout = Convert.ToDateTime(GridView4.SelectedRow.Cells[6].Text);
                    if (checkout.Date <= DateTime.Now.Date)
                    {
                        Response.Write("<script>alert('Guest Already Left Booking Not Cancelled')</script>");
                    }
                    else if (checkin.Date > DateTime.Now.Date && checkout.Date > DateTime.Now.Date)
                    {
                        SqlCommand getResID = new SqlCommand("SELECT ReservationId FROM ReservationRoom WHERE RoomId=@roomID AND CheckInDate=@checkIn AND CheckOutDate=@checkout", conn);
                        getResID.Parameters.AddWithValue("@roomID", Convert.ToInt32(GridView3.SelectedRow.Cells[1].Text.ToString()));
                        getResID.Parameters.AddWithValue("@checkin", checkin.ToString("yyyy-MM-dd 00:00:00"));
                        getResID.Parameters.AddWithValue("@checkout", checkout.ToString("yyyy-MM-dd 00:00:00"));
                        int ReservationId = Convert.ToInt32(getResID.ExecuteScalar().ToString());
                        SqlCommand cmd1 = new SqlCommand("DELETE FROM Reservation WHERE ReservationID=@id", conn);
                        cmd1.Parameters.AddWithValue("@id", ReservationId);
                        int i = cmd1.ExecuteNonQuery();
                        SqlCommand cmd2 = new SqlCommand("DELETE FROM ReservationRoom WHERE ReservationID=@id", conn);
                        cmd2.Parameters.AddWithValue("@id", ReservationId);
                        int j = cmd2.ExecuteNonQuery();
                        if (i > 0 && j > 0)
                            Response.Write("<script>alert('Successful')</script>");
                    }
                    else
                    {
                        string email = GridView4.SelectedRow.Cells[3].Text;
                        int guestId = getID(email);
                        if (guestId != -1)
                        {
                            int roomId = Convert.ToInt32(GridView3.SelectedRow.Cells[1].Text);
                            SqlCommand checkOut = new SqlCommand("update ReservationRoom SET CheckoutDate=CONVERT(date,GETDATE()) where ReservationRoom.ReservationId in(select Reservation.ReservationID from Reservation where Reservation.GuestID=@guestID and Reservation.ReservationID in(SELECT ReservationRoom.ReservationId FROM ReservationRoom where convert(date,CheckInDate) <= convert(date,getdate()) and convert(date,CheckOutDate) > convert(date,getdate()) and ReservationRoom.RoomId=@roomID));", conn);
                            checkOut.Parameters.AddWithValue("@guestID", guestId);
                            checkOut.Parameters.AddWithValue("@roomID", roomId);
                            if (checkOut.ExecuteNonQuery() > 0)
                            {
                                string message = GridView4.SelectedRow.Cells[1].Text + "  " + GridView4.SelectedRow.Cells[2].Text + "\n Checked Out From Room " + roomId;
                                Response.Write("<script>alert('" + message + "')</script>");
                            }
                        }
                    }
                }
                Response.Redirect("WebForm1.aspx");
                conn.Close();
            }
            catch { }
           
        }
        private bool inList(int i,List<int>list)
        {
            foreach (int p in list)
            {
                if (i == p)
                {
                    return true;
                }
            }
           

            return false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button4.Visible = true;
        }
        protected void Button10_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();

            HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            authCookie.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(authCookie);

            Session.Clear();
            Session.Abandon();

            Response.Redirect("~/default.aspx");
        }

    }
}