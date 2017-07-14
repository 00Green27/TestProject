using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
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
            SqlConnection myConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "GetObjectsWithParam";
            sqlCmd.Parameters.Add(new SqlParameter("@ParentId", ParentId));
            sqlCmd.Connection = myConnection;
            myConnection.Open();

            List<ObjectsWithParam> ObjWithParamList = new List<ObjectsWithParam>();

            using (SqlDataReader reader = sqlCmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    ObjectsWithParam ObjWithParam = new ObjectsWithParam();
                    ObjWithParam.Id = Convert.ToInt32(reader.GetValue(0).ToString());
                    ObjWithParamList.Add(ObjWithParam);
                }
            }
            myConnection.Close();
            return ObjWithParamList;
        }
    }
}
