using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Retrieve the user's information from the session variables
            string userId = Session["UserId"].ToString();
            string userName = Session["UserName"].ToString();
            string userEmail = Session["UserEmail"].ToString();
            string userPhone = Session["MobileNum"].ToString();


            // Set the text of the labels to display the user's information
            nameLabel.Text = userName;
            departmentLabel.Text = "Department of Computer Science";
            universityLabel.Text = "FAST - NUCES";
            emailLabel.Text = userEmail;
            phoneLabel.Text = userPhone;
        }
    }

    private int GetMaxAuditTrailID()
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-9IGJJUR\\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True");
        con.Open();
        SqlCommand cm = new SqlCommand("SELECT MAX(AuditTrailID) FROM AuditTrail", con);
        object result = cm.ExecuteScalar();
        con.Close();

        if (result != null && result != DBNull.Value)
        {
            return Convert.ToInt32(result);

        }
        else
        {
            // Handle the case when no maximum value is found
            // You can return a default value or throw an exception
            throw new Exception("Failed to retrieve the maximum AuditTrailID.");
        }

    }

    private void InsertAuditTrail(int auditTrailID, string userID, DateTime timeOfInteraction, string interactionDescription, string ipAddress)
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-9IGJJUR\\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True");
        con.Open();
        SqlCommand cm = new SqlCommand("INSERT INTO AuditTrail (AuditTrailID, UserID, timeOfInteraction, InteractionDescription, IPAddress) VALUES (@AuditTrailID, @UserID, @TimeOfInteraction, @InteractionDescription, @IPAddress)", con);
        cm.Parameters.AddWithValue("@AuditTrailID", auditTrailID);
        cm.Parameters.AddWithValue("@UserID", userID);
        cm.Parameters.AddWithValue("@TimeOfInteraction", timeOfInteraction);
        cm.Parameters.AddWithValue("@InteractionDescription", interactionDescription);
        cm.Parameters.AddWithValue("@IPAddress", ipAddress);
        cm.ExecuteNonQuery();
        con.Close();



    }
}