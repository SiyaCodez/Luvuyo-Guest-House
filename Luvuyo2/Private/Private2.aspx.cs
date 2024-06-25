using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Luvuyo2.Private
{
    public partial class Private2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=146.230.177.46;Initial Catalog=GroupPmb5;Integrated Security=False;User ID=GroupPmb5;Password=vgtrc4");
            conn.Open();
            SqlCommand cmd = new SqlCommand("" +
                "SELECT RoomNumber,RoomType,PaymentDate,PaymentAmount,ReservationDate,CheckInDate,CheckOutDate" +
                " FROM Rooms,Payment,Reservation,ReservationRoom WHERE" +
                "Rooms.RoomID=Reservation.RoomID AND Rooms.RoomID = ReservationRoom.RoomId" +
                "AND Payment.GuestId = @guest AND Payment.PaymentId=Reservation.PaymentID" +
                "AND Reservation.GuestID=@guest AND Reservation.ReservationId=ReservationRoom.ReservationId",conn);
            conn.Close();
            if (GridView1.Rows.Count > 1)
                 GridView1.Rows[GridView1.Rows.Count-1].ForeColor = System.Drawing.Color.Red;           
        }

    }
}


    
