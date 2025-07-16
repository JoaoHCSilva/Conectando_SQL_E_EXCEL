USE [AdventureWorksDW2019]
GO

/****** Object:  View [dbo].[vwTotalProd_categorizado]    Script Date: 15/07/2025 00:49:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW vwTotalProd_categorizado AS
	-- VIEW CRIADA PARA OBTER TODOS OS DADOS QUE SERÃO UTILIZADOS NO EXCEL
	SELECT
		f.SalesOrderNumber AS 'Numero_pedido',
		f.OrderDate 'Data_compra',
		cat.EnglishProductCategoryName 'Categoria_produto',
		CONCAT_WS(' ',cs.firstname,cs.lastname) AS 'Nome_Completo',
		cs.Gender 'Genero',
		tr.SalesTerritoryCountry 'Estado',
		f.OrderQuantity 'Quantidade',
		f.TotalProductCost 'Custo_total',
		f.SalesAmount 'Valor_de_vendas'
	FROM FactInternetSales AS f
	INNER JOIN DimProduct AS p
		ON f.ProductKey = p.ProductKey
		INNER JOIN DimProductCategory AS cat
			ON p.ProductSubcategoryKey = cat.ProductCategoryKey
	INNER JOIN DimSalesTerritory AS tr
		ON f.SalesTerritoryKey = tr.SalesTerritoryKey
	INNER JOIN DimCustomer AS cs
		ON f.CustomerKey = cs.CustomerKey
WHERE YEAR(f.OrderDate) = '2013'
GO


