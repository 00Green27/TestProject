using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = @"Data Source=DNS;Initial Catalog=TestProject;Integrated Security=true;";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "GetObjectTree";
            sqlCmd.Parameters.Add(new SqlParameter("@objects_id", id));
            sqlCmd.Connection = myConnection;
            myConnection.Open();
            reader = sqlCmd.ExecuteReader();

           List<TreeObjectList> TreeObjList = new List<TreeObjectList>();
           TreeObjectList TreeObj = null;

           while (reader.Read())
            {
               TreeObj = new TreeObjectList();
               TreeObj.Objects_hid = reader.GetValue(0).ToString();
               TreeObj.Name = reader.GetValue(1).ToString();
               TreeObjList.Add(TreeObj);
            }
            myConnection.Close();
            return TreeObjList;            
        }
    }
}
