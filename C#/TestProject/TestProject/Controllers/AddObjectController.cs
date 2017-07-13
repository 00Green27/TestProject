using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TestProject.Models;

namespace TestProject.Controllers
{
    public class AddObjectController : ApiController
    {
        [HttpPost]
        [ActionName("InsertObject")]
        public int Post([FromBody]NewObject newobject)
        {
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = @"Data Source=DNS;Initial Catalog=TestProject;Integrated Security=true;";

            SqlCommand ObjectsqlCmd = new SqlCommand();
            ObjectsqlCmd.CommandType = CommandType.StoredProcedure;
            ObjectsqlCmd.CommandText = "ObjectInsert";
            ObjectsqlCmd.Parameters.Add(new SqlParameter("@ParentID", newobject.ParentId));
            ObjectsqlCmd.Parameters.Add(new SqlParameter("@ClassID", newobject.ClassId));
            ObjectsqlCmd.Parameters.Add(new SqlParameter("@ObjectName", newobject.Name));
            SqlParameter outputParam = ObjectsqlCmd.Parameters.Add("@ObjectId", SqlDbType.Int);
            outputParam.Direction = ParameterDirection.Output;
            ObjectsqlCmd.Connection = myConnection;

            myConnection.Open();
            reader = ObjectsqlCmd.ExecuteReader();
            reader.Close();
            int ObjectId = Convert.ToInt32(outputParam.Value);

            foreach(NewAttribute ObjAttr in newobject.Attributes)
            {
                SqlCommand AttrsqlCmd = new SqlCommand();
                AttrsqlCmd.CommandType = CommandType.StoredProcedure;
                AttrsqlCmd.CommandText = "ObjectValuesInsert";
                AttrsqlCmd.Parameters.Add(new SqlParameter("@ObjectId", ObjectId));
                AttrsqlCmd.Parameters.Add(new SqlParameter("@AttributId", ObjAttr.Id));
                AttrsqlCmd.Parameters.Add(new SqlParameter("@AttributValue", ObjAttr.Value));
                AttrsqlCmd.Connection = myConnection;
                AttrsqlCmd.ExecuteNonQuery();
            }
            myConnection.Close();
            return ObjectId;
        }
    }
}
