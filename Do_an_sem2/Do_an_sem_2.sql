create database Do_an_sem_2
go
use Do_an_sem_2

	Create Table Categories (
		CateId Int PRIMARY KEY IDENTITY(1,1),	
		Name Nvarchar(150) UNIQUE not null,
		Status bit DEFAULT 1,
		CreatedAt Datetime DEFAULT(GETDATE()),
	)
 
	Create Table Brands (
		BrandId Int PRIMARY KEY IDENTITY(1,1),	
		Name Nvarchar(150) UNIQUE not null,
		ImageUrl Varchar(255) not null,
		Status Bit DEFAULT 1,
		CreatedAt Datetime DEFAULT(GETDATE()),
	)

	Create Table Products (
		ProId Int PRIMARY KEY IDENTITY(1,1),	
		Name Nvarchar(150) not null,
		ImageUrl Varchar(255) not null,
		Price Money check (Price > 0) not null,
		Discount Money DEFAULT(0),
		CateId Int FOREIGN KEY REFERENCES Categories(CateId),
		BrandId Int FOREIGN KEY REFERENCES Brands(BrandId),
		ShortDescription Nvarchar(255) not null,
		Description Ntext not null,
		Quanity Int not null, 
		Status Bit DEFAULT 1,
		CreatedAt Datetime DEFAULT(GETDATE()),
	)

    ALTER TABLE Products
    ADD CHECK (Price > Discount);

	Create Table Product_images (
		 Id Int PRIMARY KEY IDENTITY(1,1),
		 ProId Int FOREIGN KEY REFERENCES Products(ProId),
		 ImageUrl Varchar(255) not null,
	)

	Create Table Accounts (
		 AccId Int PRIMARY KEY IDENTITY(1,1),
		 AccName Nvarchar(100) UNIQUE not null,
		 FullName Nvarchar(150) not null,
		 Email Varchar(150) UNIQUE not null,
		 Address Nvarchar(255) not null,
		 Phone Varchar(20) not null,
		 Password Varchar(50) not null,
		 Status Bit DEFAULT 1,
		 RememberToken Varchar(150),
		 CreatedAt Datetime DEFAULT(GETDATE()),
	)

	Create Table Roles (
		RoleId Int PRIMARY KEY IDENTITY(1,1),
		Name Nvarchar(100) UNIQUE not null,
		Status Bit DEFAULT 1,

	)

	Create Table Account_Roles (
		Id Int PRIMARY KEY IDENTITY(1,1),
		AccId Int FOREIGN KEY REFERENCES Accounts(AccId),
		RoleId Int FOREIGN KEY REFERENCES Roles(RoleId),
	)

	Create Table Contacts (
		Id Int PRIMARY KEY IDENTITY(1,1),
		AccId Int,
		FullName Nvarchar(150) not null,
		Email Nvarchar(150) not null,
		Phone Varchar(20) not null,
		Message Ntext not null,
		Status Bit DEFAULT 1,
		CreatedAt Datetime DEFAULT(GETDATE()),
	)

	Create Table Configs (
		LogoImage Nvarchar(250) not null,
		BannerImage Nvarchar(250) not null,
		Address Varchar(250) not null,
		Map Text not null,
		Email Nvarchar(150) not null,
		Phone Varchar(20) not null,
		CreatedAt Datetime DEFAULT(GETDATE()),
	)

	Create Table Reviews (
		Id Int PRIMARY KEY IDENTITY(1,1),
		AccId Int FOREIGN KEY REFERENCES Accounts(AccId),
		ProId Int FOREIGN KEY REFERENCES Products(ProId),
		ProductQuality Int not null,
		ContentRated Ntext not null,
		Status Bit DEFAULT 1,
		CreatedAt Datetime DEFAULT(GETDATE()),
	)

	Create Table Orders (
		OrderId Int PRIMARY KEY IDENTITY(1,1),
		AccId Int FOREIGN KEY REFERENCES Accounts(AccId),
		FullName Nvarchar(150) not null,
		Address Nvarchar(150) not null,
		Phone Varchar(20) not null,
		Note Ntext null,
		TotalPrice Float not null,
		Status Tinyint DEFAULT 1,
		CreatedAt Datetime DEFAULT(GETDATE()),
	)

	Create Table OrderDetails (
		Id Int PRIMARY KEY IDENTITY(1,1),
		ProId Int FOREIGN KEY REFERENCES Products(ProId),
		OrderId Int FOREIGN KEY REFERENCES Orders(OrderId),
		Quantity Int check (Quantity > 0) not null,
		Price Float not null, 
	)

	Create Table Blogs (
		Id Int PRIMARY KEY IDENTITY(1,1),
		Name Nvarchar(255) not null,
		Title Nvarchar(255) not null,
		Image Varchar(255) not null,
		Image_1 Varchar(255) not null,
		Image_2 Varchar(255) not null,
		Content_1 Ntext not null,
		Content_2 Ntext not null,
		Status Int DEFAULT 1,
		CreatedAt Datetime DEFAULT(GETDATE()),
	)

	Create Table Cart (
		Id Int PRIMARY KEY IDENTITY(1,1),
		AccId Int FOREIGN KEY REFERENCES Accounts(AccId),
		ProId Int FOREIGN KEY REFERENCES Products(ProId),
		Quantity Int check (Quantity > 0) not null,
	)




