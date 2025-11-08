/*

Cleaning Data in SQL Queries

*/

-- Standardise Date Format

Select *
From [Nashville Housing ].dbo.[Nashville Housing Dataset]


Select SaleDate
FROM [Nashville Housing ].dbo.[Nashville Housing Dataset];


ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
Add SalesDateConverted Date;

Update [Nashville Housing ].dbo.[Nashville Housing Dataset]
SET SalesDateConverted = CONVERT(Date,SaleDate)


Select SaleDate
From [Nashville Housing ].dbo.[Nashville Housing Dataset]

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Populate Property Address data

Select *
From [Nashville Housing ].dbo.[Nashville Housing Dataset]
Where PropertyAddress is Null
order by ParcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
From [Nashville Housing ].dbo.[Nashville Housing Dataset] a
JOIN [Nashville Housing ].dbo.[Nashville Housing Dataset] b
   On a.ParcelID = b.ParcelID
   AND a.UniqueID <> b.UniqueID
   Where a.PropertyAddress is null


Update a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From [Nashville Housing ].dbo.[Nashville Housing Dataset] a
JOIN [Nashville Housing ].dbo.[Nashville Housing Dataset] b
   On a.ParcelID = b.ParcelID
   AND a.UniqueID <> b.UniqueID
   Where a.PropertyAddress is null

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Breaking out Address into Individual Columns (Address, City, State)

Select PropertyAddress
From [Nashville Housing ].dbo.[Nashville Housing Dataset]
Where PropertyAddress is Null
order by ParcelID

Select PropertySplitAddress
From [Nashville Housing ].dbo.[Nashville Housing Dataset]
Where PropertySplitAddress is Null
order by ParcelID



Select
SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)) as Address
From [Nashville Housing ].dbo.[Nashville Housing Dataset]

Select
SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) -1) as Address
From [Nashville Housing ].dbo.[Nashville Housing Dataset]


Select
SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) -1) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress) +1, LEN(PropertyAddress)) as Address
From [Nashville Housing ].dbo.[Nashville Housing Dataset]

Select *
From [Nashville Housing ].dbo.[Nashville Housing Dataset]

ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
Add PropertySplitAddress Nvarchar(255);

Update [Nashville Housing ].dbo.[Nashville Housing Dataset]
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) -1) 

ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
Add PropertySplitCity Nvarchar(255);

Update [Nashville Housing ].dbo.[Nashville Housing Dataset]
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress) +1, LEN(PropertyAddress))


ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
Add OwnerSplitState Nvarchar(255);

Update [Nashville Housing ].dbo.[Nashville Housing Dataset]
SET OwnerSplitState = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress) +1, LEN(PropertyAddress))

ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
Add SaleDateConverted Date;

Update [Nashville Housing ].dbo.[Nashville Housing Dataset]
SET SaleDateConverted = CONVERT(Date,Saledate)

ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
Add PropertySplitAddress Nvarchar (255);

Update [Nashville Housing ].dbo.[Nashville Housing Dataset]
SET  PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress) -1)

ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
Add PropertySplitCity Nvarchar (255);

Update [Nashville Housing ].dbo.[Nashville Housing Dataset]
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',',PropertyAddress) +1, LEN(PropertyAddress))



Select *
from [Nashville Housing ].dbo.[Nashville Housing Dataset]

Select OwnerAddress
from [Nashville Housing ].dbo.[Nashville Housing Dataset]

Select 
PARSENAME(OwnerAddress,1)
FROM [Nashville Housing ].dbo.[Nashville Housing Dataset]


Select 
PARSENAME(REPLACE(OwnerAddress,',', '.'),1)
FROM [Nashville Housing ].dbo.[Nashville Housing Dataset]

Select 
PARSENAME(REPLACE(OwnerAddress,',', '.'),1)
,PARSENAME(REPLACE(OwnerAddress,',', '.'),2)
,PARSENAME(REPLACE(OwnerAddress,',', '.'),3)
FROM [Nashville Housing ].dbo.[Nashville Housing Dataset]

Select 
PARSENAME(REPLACE(OwnerAddress,',', '.'),3)
,PARSENAME(REPLACE(OwnerAddress,',', '.'),2)
,PARSENAME(REPLACE(OwnerAddress,',', '.'),1)
FROM [Nashville Housing ].dbo.[Nashville Housing Dataset]


ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
Add OwnerSplitAddress Nvarchar(255);

Update [Nashville Housing ].dbo.[Nashville Housing Dataset]
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',', '.'),3)

ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
Add OwnerSplitCity Nvarchar(255);

Update [Nashville Housing ].dbo.[Nashville Housing Dataset]
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',', '.'),2)

ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
Add OwnerSplitState Nvarchar(255);

Update [Nashville Housing ].dbo.[Nashville Housing Dataset]
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',', '.'),1)

Select *
from [Nashville Housing ].dbo.[Nashville Housing Dataset]




SELECT SalesDateConverted
FROM [Nashville Housing ].dbo.[Nashville Housing Dataset]
WHERE SalesDateConverted = SalesDateConverted;

ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
DROP COLUMN SaleDateConverted;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Change Y and N to Yes and No in "Sold as Vacant" field


Select *
From [Nashville Housing ].dbo.[Nashville Housing Dataset]


Select Distinct(SoldAsVacantText), Count(SoldAsVacantText)
From [Nashville Housing ].dbo.[Nashville Housing Dataset]
Group By SoldAsVacantText
Order By 2






ALTER TABLE [Nashville Housing].dbo.[Nashville Housing Dataset]
ADD SoldAsVacantText VARCHAR(10);

UPDATE [Nashville Housing ].dbo.[Nashville Housing Dataset]
SET SoldAsVacantText = 
    CASE 
        WHEN SoldAsVacantText = 1 THEN 'Yes'
        WHEN  SoldAsVacantText  = 0 THEN 'No'
        ELSE 'Unknown'
    END;


Select  SoldAsVacantText  
, CASE 
        WHEN  SoldAsVacantText  = '1' THEN 'Yes'
        WHEN  SoldAsVacantText  = '0' THEN 'No'
        ELSE  SoldAsVacantText 
    END
From [Nashville Housing ].dbo.[Nashville Housing Dataset]

Select SoldAsVacantText
From [Nashville Housing ].dbo.[Nashville Housing Dataset]

ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
DROP COLUMN SoldAsVacant;

Select Distinct(SoldAsVacantText), Count(SoldAsVacantText)
From [Nashville Housing ].dbo.[Nashville Housing Dataset]
Group By SoldAsVacantText
Order By 2

Select SoldAsVacantText
From [Nashville Housing ].dbo.[Nashville Housing Dataset]

Select (SoldAsVacantText), Count(SoldAsVacantText)
From [Nashville Housing ].dbo.[Nashville Housing Dataset]
Group By SoldAsVacantText
Order By SoldAsVacantText

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Remove Duplicates

WITH RowNumCTE AS(
Select *, 
  ROW_NUMBER() OVER (
  PARTITION BY ParcelID,
               PropertyAddress,
               SalePrice,
               SaleDate,
               LegalReference
               ORDER BY
                 UniqueID
                 ) row_num

From [Nashville Housing ].dbo.[Nashville Housing Dataset]
--Order By ParcelID
)
select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Delete Unused Columns


Select *
From [Nashville Housing ].dbo.[Nashville Housing Dataset]

ALTER TABLE [Nashville Housing ].dbo.[Nashville Housing Dataset]
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------