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

    public partial class EvalForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            lblError.Visible = false; // Hide the label on page load
            lblError.Text = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
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

        private bool IsValueAlreadyExists(string value, string columnName, string tableName)
        {
        // Create a database connection
        using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-9IGJJUR\\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True"))
        {
            connection.Open();

                // Construct the query
                string query = "SELECT COUNT(*) FROM '"+tableName+ "' WHERE '"+columnName+"' = '"+value+"' ";

                // Create a SqlCommand object with the query and connection
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add a parameter for the value
                
                    // Execute the query and get the count
                    int count = (int)command.ExecuteScalar();

                    // Return true if the count is greater than 0 (value already exists), otherwise false

                    if (count > 0)
                        return true;
                    else
                        return false;
                }
            }
        }

    public static string GenerateNewUserID()
    {
        string newUserID = "";
        string connectionString = "Data Source=DESKTOP-9IGJJUR\\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT MAX(UserID) FROM Users";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                object result = command.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    int index = Convert.ToInt32(result.ToString().Substring(1));
                    newUserID = "u" + (index + 1).ToString("D3");
                }
                else
                {
                    newUserID = "u001";
                }
            }
        }

        return newUserID;
    }

    public static string GenerateNewFID()
    {
        string newUserID = "";
        string connectionString = "Data Source=DESKTOP-9IGJJUR\\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "SELECT MAX(F_ID) FROM Faculty";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                object result = command.ExecuteScalar();
                if (result != null && result != DBNull.Value)
                {
                    int index = Convert.ToInt32(result.ToString().Substring(1));
                    newUserID = "f" + (index + 1).ToString("D3");
                }
                else
                {
                    newUserID = "f001";
                }
            }
        }

        return newUserID;
    }

    protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-9IGJJUR\\SQLEXPRESS;Initial Catalog=FLEXDB;Integrated Security=True");
                con.Open();
                SqlCommand cm;

                string user = Username.Text;
                string cnic = CNIC.Text;
                string name = Name.Text;
                string email = Email.Text;
                string phoneNumber = Phonenum.Text;
                string address = Address.Text;
                string pass = Password.Text;
                string confirm = CP.Text;
                string userid = GenerateNewUserID();
                string fid = GenerateNewFID();


                string query1 = "INSERT INTO Users (UserID ,Name, MobileNum, CNIC, Email, Address, Username) VALUES (@Userid,@Name, @Phonenumber,@CNIC, @Email, @Address, @Username)";

            string query2 = "Insert into Logins(Username, Password) values (@Username, @Password)";
            string query3 = "Insert into Faculty(F_ID,UserID) values (@fid,@userId)";

            cm = new SqlCommand(query1, con);
                cm.Parameters.AddWithValue("@Userid", userid);
                cm.Parameters.AddWithValue("@Name", name);
                cm.Parameters.AddWithValue("@Username", user);
                cm.Parameters.AddWithValue("@CNIC", cnic);
                cm.Parameters.AddWithValue("@Email", email);
                cm.Parameters.AddWithValue("@Phonenumber", phoneNumber);
                cm.Parameters.AddWithValue("@Address", address);
                cm.Parameters.AddWithValue("@Password", pass);
                cm.ExecuteNonQuery();

            cm = new SqlCommand(query2, con);
            cm.Parameters.AddWithValue("@U sername", user);
            cm.Parameters.AddWithValue("@Password", pass);
            cm.ExecuteNonQuery();

            cm = new SqlCommand(query3, con);
            cm.Parameters.AddWithValue("@fid", fid);
            cm.Parameters.AddWithValue("@userId", userid);
            cm.ExecuteNonQuery();







            // Check if the entered password matches the re-entered password
            if (pass != confirm)
                {
                    lblError.Text = "Password and confirm password do not match.";
                    lblError.Visible = true;
                
                }


            Response.Redirect("Home_T.aspx");


            //Console.WriteLine("hello");


            cm.Dispose();
                con.Close();
             
                int maxAuditTrailID = GetMaxAuditTrailID();
                InsertAuditTrail(maxAuditTrailID + 1, userid, DateTime.Now, "Teacher Signup", Request.UserHostAddress);
            }

            catch (ThreadAbortException)
            {
                // Suppress the exception because it's expected due to Response.Redirect
            }
            catch (Exception ex)
            {
                // Handle any other exceptions that may occur
                // You can log the error or display an error message to the user
                //lblMessage.Text = "You have entered invalid details, please try again!";
                //lblMessage.Text = "An error occurred: " + ex.Message;
                //lblMessage.Visible = true; // Show the label message
            }
        }
        }