using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace Luvuyo2.Private
{
    public partial class Delux : System.Web.UI.Page
    {
           
        public bool check(string bannerText,string contains)
        {
            string c = "";
            foreach(char ch in bannerText)
            {
                c = c + ch;
                if (c == contains)
                    return true;
            }
            return false;
        }
            protected void Page_Load(object sender, EventArgs e)
            {
            if (!IsPostBack)
            {
                checkInDate.SelectedDate = DateTime.Today;
                checkInDate.VisibleDate = DateTime.Today; 
            }

            // int numberOfRoomsRemaining = GetNumberOfRoomsRemaining();

            // Update the status label
            // Remaining.Text = "Number of rooms remaining: " + numberOfRoomsRemaining;

            string rommType = Request.QueryString["RoomType"];
            
            Image1.ImageUrl = "~/images/" + rommType + ".jpg";
            Image2.ImageUrl = "~/images/" + rommType+" Lounge" + ".jpg";//Delux Bath
            Image3.ImageUrl = "~/images/" + rommType+" Bath" + ".jpg"; 
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            conn.Open();
            if ((checkInDate.SelectedDate == null || checkOutDate.SelectedDate == null))
            {
                Response.Write("<script>alert('You Are Required To Select Dates')</script>");
            }
            else
            { 
                string query = "SELECT COUNT(RoomId) FROM Rooms WHERE RoomType = '" + rommType + "' AND RoomID NOT IN " +
                                         "(SELECT RoomID FROM ReservationRoom WHERE RoomType = '" + rommType + "' AND " +
                                         "(('" + Session["checkInDate"] + "' >= CONVERT(date, CheckInDate) AND '" + Session["checkInDate"] + "' <= CONVERT(date, CheckOutDate)) " +
                                         "OR ('" + Session["checkOutDate"] + "' >= CONVERT(date, CheckInDate) AND '" + Session["checkOutDate"] + "' <= CONVERT(date, CheckOutDate)) " +
                                         "OR ('" + Session["checkInDate"] + "' <= CONVERT(date, CheckInDate) AND '" + Session["checkOutDate"] + "' >= CONVERT(date, CheckOutDate))))";

                SqlCommand cmd = new SqlCommand(query, conn);
                int numberOfRoomsAvailable = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                if (numberOfRoomsAvailable > 0)
                {
                    BannerPanel.Visible = false;
                    DeluxeRoomBookingButton.BackColor = System.Drawing.Color.Green;
                    DeluxeRoomBookingButton.Enabled = true;
                    RoomNotAvailable.Visible = false;
                }
                else
                {
                    if(!check(RoomNotAvailable.Text,rommType))
                            RoomNotAvailable.Text = rommType + "" + RoomNotAvailable.Text;
                    BannerPanel.Visible = true;
                    DeluxeRoomBookingButton.BackColor = System.Drawing.Color.Gray;
                    DeluxeRoomBookingButton.Enabled = false;
                    RoomNotAvailable.Visible = true;

                }
                conn.Close();



             
            }        
            
        }
        public int roomTypeCapacity(string type)
        {
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT capacity FROM Rooms WHERE RoomType = @p1", conn);
            cmd.Parameters.AddWithValue("@p1", type);
            string value = cmd.ExecuteScalar().ToString();
            conn.Close();
            return Convert.ToInt32(value);
        }
        public double priceOfType(string type)
        {
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT Price FROM Rooms WHERE RoomType = @p1", conn);
            cmd.Parameters.AddWithValue("@p1", type);
            string value = cmd.ExecuteScalar().ToString();
            conn.Close();
            return Convert.ToDouble(value);
        }
        public int getLastID(string tableName,string idcolumnname)
        {
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM "+tableName+" ORDER BY "+idcolumnname+" DESC", conn);
            string value = cmd.ExecuteScalar().ToString();
            conn.Close();
            return Convert.ToInt32(value);
        }
        public int getID(string tableName,string rhs)
        {
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM " + tableName + " WHERE GuestEmail=@rhs", conn);
            cmd.Parameters.AddWithValue("@rhs", rhs);
            string value = cmd.ExecuteScalar().ToString();
            conn.Close();
            return Convert.ToInt32(value);
        }
        protected void BookingButton_Click(object sender, EventArgs e)
            {
            if (checkInDate.SelectedDate == null || checkOutDate == null)
                return;
            else if (checkInDate.SelectedDate > checkOutDate.SelectedDate)
                return;
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            conn.Open();
            //insert payment
            string now = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
            SqlCommand cmd1 = new SqlCommand("INSERT INTO Payment VALUES(@guestID,@PaymentDate,@PaymentAmount)",conn);
            cmd1.Parameters.AddWithValue("@guestID", getID("Guest",User.Identity.Name));
            cmd1.Parameters.AddWithValue("@PaymentDate",now);
            string type = Request.QueryString["RoomType"];
            cmd1.Parameters.AddWithValue("@PaymentAmount", priceOfType(type));
            cmd1.ExecuteNonQuery();
                    string query = "SELECT RoomId FROM Rooms WHERE RoomType = '" + type + "' AND RoomId NOT IN"
            + "(SELECT RoomID FROM ReservationRoom WHERE "
            + "(("
            + "CONVERT(date, '" + Convert.ToDateTime(Session["checkInDate"]).ToString("yyyy-MM-dd") + "') >= CheckInDate AND "
            + "CONVERT(date, '" + Convert.ToDateTime(Session["checkInDate"]).ToString("yyyy-MM-dd") + "') <= CheckOutDate) "
            + "OR "
            + "(CONVERT(date, '" + Convert.ToDateTime(Session["checkOutDate"]).ToString("yyyy-MM-dd") + "') >= CheckInDate AND "
            + "CONVERT(date, '" + Convert.ToDateTime(Session["checkOutDate"]).ToString("yyyy-MM-dd") + "') <= CheckOutDate) "
            + "OR "
            + "(CONVERT(date, '" + Convert.ToDateTime(Session["checkInDate"]).ToString("yyyy-MM-dd") + "') <= CheckInDate AND "
            + "CONVERT(date, '" + Convert.ToDateTime(Session["checkOutDate"]).ToString("yyyy-MM-dd") + "') >= CheckOutDate)))";

            
             //reservation
            SqlCommand cmd3 = new SqlCommand(query, conn);
            int roomId = Convert.ToInt32(cmd3.ExecuteScalar().ToString());
           // Response.Write("<script>alert('"+(roomId)+"')</script>");
            SqlCommand cmd2 = new SqlCommand("INSERT INTO Reservation VALUES(@PaymentID,@RoomID,@GuestID,null,@NumberOfGuest,@ReservationDate)", conn);
            cmd2.Parameters.AddWithValue("@paymentID", getLastID("Payment", "PaymentId"));
            cmd2.Parameters.AddWithValue("@RoomID", roomId);
            cmd2.Parameters.AddWithValue("@GuestID", getID("Guest",User.Identity.Name));
            cmd2.Parameters.AddWithValue("@NumberOfGuest", roomTypeCapacity(type));
            cmd2.Parameters.AddWithValue("@ReservationDate", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));
            cmd2.ExecuteNonQuery();
            int reservationid = getLastID("Reservation", "ReservationID");
            //reservation room
            SqlCommand cmd4 = new SqlCommand("INSERT INTO ReservationRoom VALUES(@reservationId,@roomId,@checkin,@checkout)", conn);
            cmd4.Parameters.AddWithValue("@reservationId", reservationid);

            cmd4.Parameters.AddWithValue("@roomId", roomId);
            cmd4.Parameters.AddWithValue("@checkin", Session["checkInDate"].ToString());
            cmd4.Parameters.AddWithValue("@checkout", Session["checkOutDate"].ToString());
            cmd4.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Payment.aspx");
        }

        protected void checkInDate_SelectionChanged(object sender, EventArgs e)
        {
            checkOutDate.Enabled = true;
            if (checkInDate.SelectedDate.Date < DateTime.Now.Date)
            {
                Response.Write("<script>alert('Checkin Date Cannot be before Today s Date')</script>");
                return;
            }
            Session["checkInDate"] = checkInDate.SelectedDate.Date.ToString("yyyy-MM-dd");
            Page_Load(sender, e);
         
        }

        protected void checkOutDate_SelectionChanged(object sender, EventArgs e)
        {
            if (checkOutDate.SelectedDate.Date <= checkInDate.SelectedDate.Date)
            {
                checkOutDate.SelectedDate = checkInDate.SelectedDate.AddDays(1);
                return;
            }
            Session["checkOutDate"] = checkOutDate.SelectedDate.Date.ToString("yyyy-MM-dd");
            Page_Load(sender, e);
        }
        private int GetNumberOfRoomsRemaining()
        {
            return 0;
        }

    }
    }
