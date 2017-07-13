using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestProject.Models
{
    public class NewObject
    {
        public int ParentId { get; set; }
        public int ClassId { get; set; }
        public string Name { get; set; }
        public List<NewAttribute> Attributes { get; set; }

    }

    public class NewAttribute
    {
        public int Id { get; set; }
        public string Value { get; set; }
    }
}