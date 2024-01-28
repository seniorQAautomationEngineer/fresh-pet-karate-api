@parallel=true
@integration
@positive

Feature: Products tests

  Background: Define URL
    * url apiUrl
    * def product1Response = read("classpath:com/freshPet/json/product1response.json")
    * def productJsonSchema = read("classpath:com/freshPet/json/productSchema.json")

  Scenario: Fetch Products test
    Given path "/api/v1/products"
    And header Accept = '*/*'
    And method Get
    Then status 200
    And match response.status == "success"
    And match response.products == '#array'

  Scenario: Fetch Product by id
    Given path "/api/v1/products/product/1"
    And header Accept = '*/*'
    And method Get
    Then status 201
    And match response == product1Response

  Scenario: Create new product
    Given path "/api/v1/products"
    And header Accept = '*/*'
    And request
     """
     {
  "name": "New product",
  "description": "New description",
  "petCategory": "cat",
  "subCategory": "food",
  "price": "9.48",
  "image": "https://img.chewy.com/is/catalog/99965_MAIN._AC_SS232_V1462999356_.jpg"
     }
     """
    And method Post
    Then status 200
    And match response.message == "Create Product Successfully 😉"
    And match response.data.id != null
    And match response == productJsonSchema


  Scenario: Update product
    Given path "/api/v1/products/product/10"
    And header Accept = '*/*'
    And request
     """
     {
  "name": "Updated product",
  "description": "Updated description",
  "petCategory": "cat",
  "subCategory": "food",
  "price": "9.48",
  "image": "https://img.chewy.com/is/catalog/99965_MAIN._AC_SS232_V1462999356_.jpg"
     }
     """
    And method Patch
    Then status 200
    And match response.message == "Product Update Successfully 😉"
    And match response.data.id == 10
    And match response.data.description == "Updated description"
    And match response == productJsonSchema















