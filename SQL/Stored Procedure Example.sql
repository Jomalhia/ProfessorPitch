CREATE PROCEDURE AllCustomers2
@City nvarchar(30),
@StateCode nvarchar(5)
AS


SELECT 
	p.firstName,  
	p.lastname,
	ct.[name],
	a.[AddressLine1],
	a.[AddressLine2],
	a.[City],
	sp.[StateProvinceCode],
	[PostalCode],
	ad.[Name]

FROM [Person].[BusinessEntityContact] bec
join [Person].[Person] p on p.BusinessEntityID = bec.PersonID
join [Person].[ContactType] ct on ct.ContactTypeID = bec.ContactTypeID
join person.BusinessEntityAddress bea on bea.BusinessEntityID = bec.BusinessEntityID
join [Person].[Address] a on a.AddressID = bea.AddressID
join [Person].[AddressType] ad on ad.AddressTypeID = bea.AddressTypeID
join [Person].[StateProvince] sp on sp.StateProvinceID = bea.AddressTypeID

WHERE City = @City 
	anD StateProvinceCode = @StateCode

GO

EXEC AllCustomers2 @City = 'Miami', @StateCode = 'AL';