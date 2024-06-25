using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Luvuyo2.Private
{
    public partial class Guest : System.Web.UI.Page
    {
        
      
       

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            //Calendar2.SelectedDate = Calendar1.SelectedDate.AddDays(7);
            //Calendar2.VisibleDate = Calendar2.SelectedDate;
            //txtCheckInDate.Text = Calendar1.SelectedDate.ToShortDateString();
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            //if ((Calendar2.SelectedDate - Calendar1.SelectedDate).TotalDays > 7)
            //{
            //    // Set check-out date to 7 days after check-in date
            //    Calendar2.SelectedDate = Calendar1.SelectedDate.AddDays(7);
            //    Calendar2.VisibleDate = Calendar2.SelectedDate;
            //}
            //txtCheckOutDate.Text = Calendar2.SelectedDate.ToShortDateString();
        }

        private int GetRoomID(string RoomType)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["GroupPmb5ConnectionString"].ConnectionString;
            int roomID = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT RoomID FROM Rooms WHERE RoomType = @RoomType";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@RoomType", RoomType);

                var result = command.ExecuteScalar();
                if (result != DBNull.Value && result != null)
                {
                    roomID = Convert.ToInt32(result);
                }

                connection.Close();
            }

            return roomID;
        }


        private bool IsRoomAvailable(int roomID, DateTime checkInDate, DateTime checkOutDate)
        {
            if ((checkOutDate - checkInDate).TotalDays > 7)
            {
                lblResult.Text = "You cannot book for more than 7 days.";
                return false;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["GroupPmb5ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM Reservation WHERE RoomID = @RoomID AND (ReservationDate >= @CheckInDate AND ReservationDate <= @CheckOutDate)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@RoomID", roomID);
                command.Parameters.AddWithValue("@CheckInDate", checkInDate);
                command.Parameters.AddWithValue("@CheckOutDate", checkOutDate);

                int count = (int)command.ExecuteScalar();

                connection.Close();

                if (count > 0)
                {
                    lblResult.Text = "Room not available for the chosen dates. Please select different dates.";
                    return false;
                }

                return true;
            }
        }
        private int GetNextGuestID()
        {
            int nextGuestID = 0;
            string connectionString = ConfigurationManager.ConnectionStrings["GroupPmb5ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT ISNULL(MAX(GuestID), 0) FROM Guest";
                SqlCommand command = new SqlCommand(query, connection);

                var result = command.ExecuteScalar();
                if (result != DBNull.Value && result != null)
                {
                    nextGuestID = Convert.ToInt32(result) + 1;
                }

                connection.Close();
            }

            return nextGuestID;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DateTime checkInDate;
            DateTime checkOutDate;

            //if (!DateTime.TryParse(txtCheckInDate.Text, out checkInDate) || !DateTime.TryParse(txtCheckOutDate.Text, out checkOutDate))
            //{
            //    lblResult.Text = "Please select valid Check-In and Check-Out dates.";
            //    return;
            //}

            //if (checkOutDate == DateTime.MinValue || checkOutDate <= checkInDate)
            //{
            //    lblResult.Text = "Please select a valid Check-Out date.";
            //    return;
            //}

            // Replace 'yourRoomName' with the appropriate RoomName for the room you want to check
            string RoomType = "Delux Suite"; // Change this to the appropriate room name
            int roomID = GetRoomID(RoomType);

            //if (roomID != 0 && IsRoomAvailable(roomID, checkInDate, checkOutDate))
            //{
            //    int nextGuestID = GetNextGuestID();
              

            //    // Storing data in session variables before redirecting
            //    Session["RoomID"] = roomID;
            //    Session["RoomType"] = RoomType;

            //    Session["GuestID"] = nextGuestID;
            //    Session["RoomType"] = RoomType;
            //    Session["CheckInDate"] = checkInDate;
            //    Session["CheckOutDate"] = checkOutDate;
            //    Response.Redirect("Payment.aspx");
            //}
            //else
            //{
            //    lblResult.Text = "Room not available for the chosen dates. Please select different dates.";
            //}
        }


    }
}