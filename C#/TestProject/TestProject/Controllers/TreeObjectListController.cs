using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Http;
using TestProject.Models;

namespace TestProject.Controllers
{
    public class TreeObjectListController : ApiController
    {
        [HttpGet]
        [ActionName("GetObjectTree")]
        public List<TreeObjectList> Get(int id)
        {
            SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "GetObjectTree";
            sqlCmd.Parameters.Add(new SqlParameter("@objects_id", id));
            sqlCmd.Connection = myConnection;
            myConnection.Open();

            List<TreeObjectList> TreeObjList = new List<TreeObjectList>();
                        
            using (SqlDataReader reader = sqlCmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    TreeObjectList TreeObj = new TreeObjectList();
                    TreeObj.Objects_hid = reader.GetValue(0).ToString();
                    TreeObj.Name = reader.GetValue(1).ToString();
                    TreeObjList.Add(TreeObj);
                }
            }
            myConnection.Close();
            return TreeObjList;            
        }
    }
}
