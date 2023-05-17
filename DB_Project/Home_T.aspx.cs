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

        lblMessage.Visible = false; // Hide the label on page load
        lblMessage.Text = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        try
        {

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-9IGJJUR\\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True");
            con.Open();
            SqlCommand cm;
            string user = TextBox1.Text;
            string pass = TextBox2.Text;
            string query = "select Faculty.F_ID, Users.UserID, Logins.Password, Users.Username, Users.MobileNum,Users.Email from Faculty join Users on dbo.Users.UserID=Faculty.UserID join Logins on dbo.Users.Username=Logins.Username where Faculty.F_ID= @user and Logins.Password= @pass";

            cm = new SqlCommand(query, con);
            cm.Parameters.AddWithValue("@user", user);
            cm.Parameters.AddWithValue("@pass", pass);
            SqlDataReader res = cm.ExecuteReader();

            if (!res.HasRows)
            {
                lblMessage.Text = "Incorrect login details. Please try again.";
                lblMessage.Visible = true; // Show the label message
            }
            else
            {
                if (res.Read()) // Move to the first row of the result set
                {
                    string facultyId = res["F_ID"].ToString();
                    string userId = res["UserID"].ToString();
                    string username = res["Username"].ToString();
                    string email = res["Email"].ToString();
                    string mobileNum = res["MobileNum"].ToString();

                    Session["UserId"] = facultyId;
                    Session["UserName"] = username;
                    Session["UserEmail"] = email;
                    Session["MobileNum"] = mobileNum;
                }
            

            con.Close();
            int maxAuditTrailID = GetMaxAuditTrailID();
            InsertAuditTrail(maxAuditTrailID + 1, user, DateTime.Now, "Teacher login", Request.UserHostAddress);
            Response.Redirect("Facult.aspx");
                return; // Exit the method after redirecting
            }

            cm.Dispose();
            con.Close();
        }
        catch (ThreadAbortException)
        {
            // Suppress the exception because it's expected due to Response.Redirect
        }
        catch (Exception ex)
        {
            // Handle any other exceptions that may occur
            // You can log the error or display an error message to the user
            lblMessage.Text = "You have entered invalid details, please try again!";
            //lblMessage.Text = "An error occurred: " + ex.Message;
            lblMessage.Visible = true; // Show the label message
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