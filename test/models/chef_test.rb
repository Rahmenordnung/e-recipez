require 'test_helper'

class ChefTest < ActiveSupport::TestCase
    
    def setup
        @chef = Chef.new(chefname: "tudor", email: "tudor@example.com",
                    password: "password", password_confirmation: "password")
    end
    
    test "chef should be valid" do
        assert @chef.valid?
    end
    
    test "chefname should be present" do
        @chef.chefname = " "
        assert_not @chef.valid?
    end
    
    test "chefname should be less than 31 characters" do
        @chef.chefname = "x" * 32
        assert_not @chef.valid?
    end
    
    test "email should be present" do
        @chef.email = " "
        assert_not @chef.valid?
    end
    
    test "email should not be to long" do
        @chef.email = "x" * 195 + "@example.com"
        assert_not @chef.valid?
    end
    
    test "email should contain correct format sign" do
        valid_emails = %w[tudor@tudor.com TUDOR@YAHOO.COM T.first@hotmail.com john+smith@co.uk.org]
        valid_emails.each do|valids|
        @chef.email = valids
        assert @chef.valid?, "#{valids.inspect} should be valid"
        end
    end
    
    test "email should reject invalid address" do
        invalid_emails = %w[tudor@tudor tudor@tudor,com tudor.name@gmail. tudor@tudor+food.com]
        invalid_emails.each do|invalids|
        @chef.email = invalids
        assert_not @chef.valid?, "#{invalids.inspect} should be invalid"
        end
    end
    
    test "email should be unique and case insensitive" do
       duplicate_chef = @chef.dup
       duplicate_chef.email = @chef.email.upcase
       @chef.save
       assert_not duplicate_chef.valid?
    end
    
    test "email should be lower case always in data base" do
        mixed_email = "Tudor@Example.com"
        @chef.email = mixed_email
        @chef.save
        assert_equal mixed_email.downcase, @chef.reload.email
    end
    
      test "password should be present" do
        @chef.password = @chef.password_confirmation = " "
        assert_not @chef.valid?
      end
    
    
    
    
end
    
