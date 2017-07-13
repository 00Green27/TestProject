using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Http;
using TestProject.Models;

namespace TestProject.Controllers
{
    public class ObjectsWithParamController : ApiController
    {
        [HttpGet]
        [ActionName("GetObjectsWithParam")]
        public List<ObjectsWithParam> Get(int ParentId)
        {
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = @"Data Source=DNS;Initial Catalog=TestProject;Integrated Security=true;";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "GetObjectsWithParam";
            sqlCmd.Parameters.Add(new SqlParameter("@ParentId", ParentId));
            sqlCmd.Connection = myConnection;
            myConnection.Open();
            reader = sqlCmd.ExecuteReader();

            List<ObjectsWithParam> ObjWithParamList = new List<ObjectsWithParam>();
            ObjectsWithParam ObjWithParam = null;

            while (reader.Read())
            {
                ObjWithParam = new ObjectsWithParam();
                ObjWithParam.Id = Convert.ToInt32(reader.GetValue(0).ToString());
                ObjWithParamList.Add(ObjWithParam);
            }
            myConnection.Close();
            return ObjWithParamList;
        }
    }
}
