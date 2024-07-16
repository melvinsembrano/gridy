require "test_helper"

class AdminAccountsController < ApplicationController
  include Gridy::Controller::Actions
  gridy_resource Account

end

class Gridy::Controller::ActionsTest < ActiveSupport::TestCase

  def setup
    @controller = AdminAccountsController.new
  end

  test "should define gridy_collection" do
    assert_respond_to @controller, :gridy_collection
  end


  test "should define index" do
    assert_respond_to @controller, :index
  end


  test "should define show" do
    assert_respond_to @controller, :show
  end

  test "should define new" do
    assert_respond_to @controller, :new
  end

  test "should define edit" do
    assert_respond_to @controller, :edit
  end

  test "should define create" do
    assert_respond_to @controller, :create
  end

  test "should define update" do
    assert_respond_to @controller, :update
  end

  test "should define destroy" do
    assert_respond_to @controller, :destroy
  end

end
