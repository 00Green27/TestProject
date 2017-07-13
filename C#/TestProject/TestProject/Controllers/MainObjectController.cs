using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Http;
using TestProject.Models;

namespace TestProject.Controllers
{
    public class MainObjectController : ApiController
    {
        [HttpGet]
        [ActionName("GetObjectAttributes")]
        public MainObject Get(int id)
        {
            SqlDataReader reader = null;
            SqlConnection myConnection = new SqlConnection();
            myConnection.ConnectionString = @"Data Source=DNS;Initial Catalog=TestProject;Integrated Security=true;";

            SqlCommand sqlCmd = new SqlCommand();
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "GetObjectAttributes";
            sqlCmd.Parameters.Add(new SqlParameter("@objects_id", id));
            sqlCmd.Connection = myConnection;
            myConnection.Open();
            reader = sqlCmd.ExecuteReader();

            MainObject MObject = new MainObject();
            List<ObjectAttribute> attributes = new List<ObjectAttribute>();
            ObjectAttribute ObjAtr = null;

            MObject.Id = id;
            
            while (reader.Read())
            {
                ObjAtr = new ObjectAttribute();
                ObjAtr.Name = reader.GetValue(0).ToString();
                ObjAtr.Value = reader.GetValue(1).ToString();
                attributes.Add(ObjAtr);
            }
            MObject.Attributes = attributes;
            myConnection.Close();
            return MObject;
        }

    }
}

