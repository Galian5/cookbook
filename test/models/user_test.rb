require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example', email: 'user@example.com')
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

  # this test is copied, but seems to work
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end


end
