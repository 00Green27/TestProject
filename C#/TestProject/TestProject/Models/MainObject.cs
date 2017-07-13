using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestProject.Models
{
    public class MainObject
    {
        public int Id { get; set; }
        public List<ObjectAttribute> Attributes { get; set; }
    }

    public class ObjectAttribute
    {
        public string Name { get; set; }
        public string Value { get; set; }
    }
}