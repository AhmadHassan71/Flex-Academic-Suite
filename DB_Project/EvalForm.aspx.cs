using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.ServiceModel.Security;
using System.Threading;
using System.Collections;

public partial class EvalForm : System.Web.UI.Page
{
    
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
    protected void Submit_Click(object sender, EventArgs e)
    {
        try {
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-9IGJJUR\\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True");
            con.Open();
            SqlCommand cm;
            string query="";
            cm = new SqlCommand(query, con);

            string _TN = TeacherName.Text;
            string _CC = CourseCode.Text;
            string _Attend = Tat.SelectedValue;
            string _classEnv = classEnv.SelectedValue;
            string _motiv = motiv.SelectedValue;
            string _artic = Articulate.SelectedValue;
            string _aq1 = aq1.SelectedValue;
            string _aq2 = aq2.SelectedValue;
            string _resp = resp.SelectedValue;
            string _str = str.SelectedValue;
            string _weak = weak.SelectedValue;
            string _comments = Comments.Text;




            cm.Dispose();
            con.Close();
            Response.Redirect("Student.aspx");
             int maxAuditTrailID = GetMaxAuditTrailID();
             InsertAuditTrail(maxAuditTrailID + 1, "ali123", DateTime.Now, "Feedback Submitted", Request.UserHostAddress);
        }

        catch { }
    }
}