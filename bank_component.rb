=begin
 Feature 1: 
 This feature will allow user to either sign up for an account.
 Or log in with their last name,last 4 digits of their social security number, and password.        
=end



#class for log in and sign up method
class LogInSignUp

    @@user_info=[
        {first:'andy', last:'park', password:'hello123', ssn:'123456789'},
        {first:'Jason', last:'kim', password:'bye123', ssn:'135791098'}
    ]

    #Instance variable to determine if the user's credential is validated
    @user_credential_validation = false
    
    attr_accessor :last_name, :password, :ssn

    def initialize(last_name, password, ssn)
        @last_name = last_name
        @password=password
        @ssn=ssn
    end

    def validate_log_in_credentials
        @@user_info.each do |x|
            if x[:last].to_s == @last_name && x[:password] == @password && x[:ssn][5,8] == @ssn
                puts "Welcome back #{x[:first]} #{x[:last]}!"
                return
            else
                puts "sorry access denied!"
                return
            end
        end
    end

    def create_new_user_account
      puts "HAHAH!"
    end

end


#############################################
######### Main program starts here!##########
#############################################
puts "Welcome to Bank of Invoca!"
print "Are you an existing user?(Y/N):"
$existing_new_user = gets.chomp.downcase


# Method to determine if the user is new or existing customer
def new_or_existing_user(user_response)
    case user_response
    when 'y'
        #Ask for credentials that will be used to validate sign in
        puts "Thank you for being a memeber of Bank of Invoca!!"

        print "Please enter your last name:"
        user_last_name_input = gets.chomp.downcase

        print "Please enter your password:"
        user_password_input = gets.chomp.downcase

        print "Please enter the last 4 digits of your SSN:"
        user_ssn_input = gets.chomp.downcase

        instance_for_log = LogInSignUp.new(user_last_name_input,user_password_input, user_ssn_input)
        instance_for_log.validate_log_in_credentials

    when 'n'
        print "Please enter your first name:"
        user_first_name = gets.chomp
        print "Please enter your last name:"
        user_last_nane = gets.chomp
        print "Please enter your password:"
        user_password = gets.chomp
        print "Please enter your 8 digit SSN number:"
        user_ssn = gets.chomp

        ##check to see if user_ssn is 8 digits
        case user_ssn
        when user_ssn.length.to_i <8
            print "Please re-enter your 8 digit SSN:"
        end
    else
        print "Please re-enter Y or N:"
        $existing_new_user = gets.chomp.downcase
        new_or_existing_user($existing_new_user)
    end
end

new_or_existing_user($existing_new_user)

