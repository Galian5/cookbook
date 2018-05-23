require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example', email: 'user@example.com',
                     password: 'dupa123', password_confirmation: 'dupa123')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should not be blank' do
    @user.name = '      '
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = 'x' * 51
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'x' * 100 + '@example.com'
    assert_not @user.valid?
  end

  test 'email should not be blank' do
    @user.email = '     '
    assert_not @user.valid?
  end

  test 'email should be unique' do
    non_unique = @user.dup
    non_unique.email = @user.email.downcase
    @user.save
    assert_not non_unique.valid?
  end

  test 'email should be lower-case' do
    tested_email = 'test@EXAMPLE.com'
    @user.email = tested_email
    @user.save
    assert_equal tested_email.downcase, @user.reload.email
  end


  # this test is copied, but seems to work
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'password should not be blank' do
    @user.password = @user.password_confirmation = ' '*10
    assert_not @user.valid?
  end

  test 'password should not be too short' do
    @user.password = @user.password_confirmation = 'x'*3
    assert_not @user.valid?
  end



end
