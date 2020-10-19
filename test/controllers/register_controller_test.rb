require 'test_helper'

class RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get register_url
    assert_response :success
  end

  test "judah registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Judah" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end

  test "reuben registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Reuben" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end

  test "gad registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Gad" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end

  test "asher registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Asher" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end

  test "naphtali registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Naphtali" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end

  test "manasseh registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Manasseh" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end

  test "simeon registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Simeon" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end

  test "levi registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Issachar" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end

  test "issachar registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Issachar" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end

  test "Zebulun registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Zebulun" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end

  test "Joseph registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Joseph" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end

  test "benjamin registration" do
    post register_url, params: { email: "test@test.com",
                                 firstname: "first name",
                                 lastname: "last name",
                                 Tribes: "Benjamin" }
    assert_response :redirect
    assert @response.redirect_url.include? "success"
  end
end
