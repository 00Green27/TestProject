/*���������� �����*/
insert into TableType values ('float');
insert into TableType values ('datetime');
insert into TableType values ('varchar(255)');

/*���������� �������*/
insert into Classes values ('�����');
insert into Classes values ('���������');
insert into Classes values ('�������');

/*���������� ���������*/
/*�����*/
insert into Attributes values ('�����',(select TableType_id from TableType where "Type" = 'varchar(255)') );
insert into Attributes values ('�����',(select TableType_id from TableType where "Type" = 'float') );
insert into Attributes values ('����',(select TableType_id from TableType where "Type" = 'float') );
/*�����*/
insert into Attributes values ('���� ���������',(select TableType_id from TableType where "Type" = 'datetime') );
insert into Attributes values ('��������',(select TableType_id from TableType where "Type" = 'float') );
/*�������*/
insert into Attributes values ('���� ����������� �� �����',(select TableType_id from TableType where "Type" = 'datetime') );
/*���������*/
insert into Attributes values ('���� �������',(select TableType_id from TableType where "Type" = 'datetime') );

/*���������� ������ �������� � ������*/
/*����� �����*/
insert into ClassAttributes values ((select Classes_id from Classes where Name = '�����'),(select Attributes_id from Attributes where Name = '�����') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = '�����'),(select Attributes_id from Attributes where Name = '�����') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = '�����'),(select Attributes_id from Attributes where Name = '����') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = '�����'),(select Attributes_id from Attributes where Name = '���� ���������') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = '�����'),(select Attributes_id from Attributes where Name = '��������') );
/*����� ���������*/
insert into ClassAttributes values ((select Classes_id from Classes where Name = '���������'),(select Attributes_id from Attributes where Name = '�����') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = '���������'),(select Attributes_id from Attributes where Name = '�����') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = '���������'),(select Attributes_id from Attributes where Name = '����') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = '���������'),(select Attributes_id from Attributes where Name = '���� �������') );
/*����� �������*/
insert into ClassAttributes values ((select Classes_id from Classes where Name = '�������'),(select Attributes_id from Attributes where Name = '�����') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = '�������'),(select Attributes_id from Attributes where Name = '�����') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = '�������'),(select Attributes_id from Attributes where Name = '����') );
insert into ClassAttributes values ((select Classes_id from Classes where Name = '�������'),(select Attributes_id from Attributes where Name = '���� ����������� �� �����') );
/*���������� ��������� �������� � Objects*/
INSERT INTO "Objects" 
VALUES (HIERARCHYID::GetRoot(),(select Classes_id from Classes where Name = '�����') , '����� ���� ��������');





