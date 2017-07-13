create table Classes (
Classes_Id int identity(1,1) not null,
Name varchar(100) not null
CONSTRAINT ClassesPK PRIMARY KEY (Classes_Id) 
)

create table TableType (
TableType_Id int identity(1,1) not null,
"Type" varchar(255) not null
CONSTRAINT TableTypePK PRIMARY KEY (TableType_Id) 
)

create table Attributes (
Attributes_Id Int identity(1,1) not null,
Name varchar(100) not null,
TableTypeOf Int not null
CONSTRAINT AttributesPK PRIMARY KEY (Attributes_Id),

CONSTRAINT Att_TableTypeFK FOREIGN KEY (TableTypeOf) 
REFERENCES TableType (TableType_Id) 
)

create table ClassAttributes (
ClassOf Int not null,
AttributeOf Int not null
CONSTRAINT ClAtt_ClassesFK FOREIGN KEY (ClassOf) 
REFERENCES Classes (Classes_Id),

CONSTRAINT ClAtt_AttributesFK FOREIGN KEY (AttributeOf) 
REFERENCES Attributes (Attributes_Id)
)


create table "Objects" (
Objects_Id int identity(1,1) not null,
Objects_hid hierarchyid not null, 
ClassOf Int not null,
Name varchar(255),
[level] as Objects_hid.GetLevel() persisted
CONSTRAINT ObjectsPK PRIMARY KEY (Objects_Id),

CONSTRAINT Obj_ClassesFK FOREIGN KEY (ClassOf) 
REFERENCES Classes (Classes_Id),
)


create table FloatValue (
FloatValue_Id Int identity(1,1) not null,
ObjectOf Int not null,
AttributeOf Int not null,
Value float not null
CONSTRAINT FloatValuePK PRIMARY KEY (FloatValue_Id),

CONSTRAINT FVal_ObjectsFK FOREIGN KEY (ObjectOf) 
REFERENCES "Objects" (Objects_Id),

CONSTRAINT FVal_AttributesFK FOREIGN KEY (AttributeOf) 
REFERENCES Attributes (Attributes_Id)
)

create table DateTimeValue (
DateTimeValue_Id Int identity(1,1) not null,
ObjectOf Int not null,
AttributeOf Int not null,
Value datetime not null
CONSTRAINT DateTimeValuePK PRIMARY KEY (DateTimeValue_Id),

CONSTRAINT DTVal_ObjectsFK FOREIGN KEY (ObjectOf) 
REFERENCES "Objects" (Objects_Id),

CONSTRAINT DTVal_AttributesFK FOREIGN KEY (AttributeOf) 
REFERENCES Attributes (Attributes_Id)
)

create table StringValue (
StringValue_Id Int identity(1,1) not null,
ObjectOf Int not null,
AttributeOf Int not null,
Value varchar(255) not null
CONSTRAINT StringValuePK PRIMARY KEY (StringValue_Id),

CONSTRAINT SVal_ObjectsFK FOREIGN KEY (ObjectOf) 
REFERENCES "Objects" (Objects_Id),

CONSTRAINT SVal_AttributesFK FOREIGN KEY (AttributeOf) 
REFERENCES Attributes (Attributes_Id)
)