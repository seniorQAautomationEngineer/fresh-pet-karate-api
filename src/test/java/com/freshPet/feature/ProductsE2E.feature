@parallel=true
@integration
@positive

Feature: Products E2E tests

  Background: Define URL
    * url apiUrl
    * def productRequest = read("classpath:com/freshPet/json/requestNewProduct.json")
    * def updateProductRequest = read("classpath:com/freshPet/json/requestUpdateProduct.json")

  Scenario: CRUD E2E operations
    # Create new product
    Given path "/api/v1/products"
    And header Accept = '*/*'
    And request productRequest
    And method Post
    Then status 200
    And match response.message == "Create Product Successfully 😉"
    And match response.data.id != null
    * def newProductId = response.data.id
    # Fetch new product
    Given path "/api/v1/products/product/" + newProductId
    And header Accept = '*/*'
    And method Get
    Then status 201
    And match response.data.id == newProductId
    # Update product
    Given path "/api/v1/products/product/" + newProductId
    And header Accept = '*/*'
    And request updateProductRequest
    And method Patch
    Then status 200
    And match response.message == "Product Update Successfully 😉"
    And match response.data.description == "Updated description"
    # Delete product
    Given path "/api/v1/products/product/" + newProductId
    And header Accept = '*/*'
    And method Delete
    Then status 204
     # Verify that product is deleted
    Given path "/api/v1/products/product/" + newProductId
    And header Accept = '*/*'
    And method Get
    Then status 201
    And match response.data == '#notpresent'














