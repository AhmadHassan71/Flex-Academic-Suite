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
using System.Xml.Linq;
using System.Data;

public partial class FeedbackReport : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FeedbackDisplay(sender, e);
        }
    }

    /*
    private int GetMaxAuditTrailID()
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-9IGJJUR\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True");
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
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-9IGJJUR\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True");
        con.Open();
        SqlCommand cm = new SqlCommand("INSERT INTO AuditTrail (AuditTrailID, UserID, timeOfInteraction, InteractionDescription, IPAddress) VALUES (@AuditTrailID, @UserID, @TimeOfInteraction, @InteractionDescription, @IPAddress)", con);
        cm.Parameters.AddWithValue("@AuditTrailID", auditTrailID);
        cm.Parameters.AddWithValue("@UserID", userID);
        cm.Parameters.AddWithValue("@TimeOfInteraction", timeOfInteraction);
        cm.Parameters.AddWithValue("@InteractionDescription", interactionDescription);
        cm.Parameters.AddWithValue("@IPAddress", ipAddress);
        cm.ExecuteNonQuery();
        con.Close();
    }*/

    protected void FeedbackDisplay(object sender, EventArgs e)
    {
        try
        {
            string connectionString = "Data Source=DESKTOP-9IGJJUR\\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = "SELECT TeacherAttendance, class, motiv, atriculate, aq1, aq2, res, str, weak FROM TeacherEvaluation";
                SqlCommand cm = new SqlCommand(query, con);

                SqlDataAdapter adapter = new SqlDataAdapter(cm);
                DataTable table = new DataTable();
                adapter.Fill(table);

                // Calculate the average of each column using LINQ
                var averages = new object[] {
                table.AsEnumerable().Average(row => row.Field<int>("TeacherAttendance")) * 20,
                table.AsEnumerable().Average(row => row.Field<int>("class")) * 20,
                table.AsEnumerable().Average(row => row.Field<int>("motiv")) * 20,
                table.AsEnumerable().Average(row => row.Field<int>("atriculate")) * 20,
                table.AsEnumerable().Average(row => row.Field<int>("aq1")) * 20,
                table.AsEnumerable().Average(row => row.Field<int>("aq2")) * 20,
                table.AsEnumerable().Average(row => row.Field<int>("res")) * 20,
                table.AsEnumerable().Average(row => row.Field<int>("str")) * 20,
                table.AsEnumerable().Average(row => row.Field<int>("weak")) * 20
            };

                // Create a new DataTable with the calculated averages as a single row
                DataTable result = new DataTable();
                result.Columns.AddRange(new[] {
                new DataColumn("TeacherAttendance %", typeof(decimal)),
                new DataColumn("Class %", typeof(decimal)),
                new DataColumn("Motivation %", typeof(decimal)),
                new DataColumn("Atriculation %", typeof(decimal)),
                new DataColumn("AQ1 %", typeof(decimal)),
                new DataColumn("AQ2 %", typeof(decimal)),
                new DataColumn("Res %", typeof(decimal)),
                new DataColumn("Strengths %", typeof(decimal)),
                new DataColumn("Weaknesses %", typeof(decimal))
            });

                result.Rows.Add(averages);

                TeacherEvaluationGrid.DataSource = result;
                TeacherEvaluationGrid.DataBind();

                con.Close();
            }
        }
        catch (Exception ex)
        {
            // Handle and log the exception
          /*  lblMessage.Text = "An error occurred: " + ex.Message;
            lblMessage.Visible = true;*/
        }
    }

}