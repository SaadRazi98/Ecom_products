require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/product.json", params: {name: "Skull Slides", category: "footwear", price: 15, website_url: "https://skullslidesshop.com/products/skull-slides-%E2%84%A2", image_url: "https://cdn.shopify.com/s/files/1/0744/1396/5610/products/1.png?v=1681259026&width=600"}
      assert_response 200
    end
  end 
  
  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

end
