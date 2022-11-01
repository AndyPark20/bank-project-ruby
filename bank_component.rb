
 #Feature 1:
 #This feature will allow user to either sign up for an account.
 #Or log in with their last name,last 4 digits of their social security number, and password.        




#class for log in and sign up method
class LogInSignUp

    USER_INFO=[
        {first: 'andy', last: 'park', password: 'hello123', ssn: '123456789'},
        {first: 'Jason', last: 'kim', password: 'bye123', ssn: '135791098'},
    ]

  #If attribute doesn't need to be edited after being initialized, only use reader
    attr_reader :last_name, :password, :ssn

    def initialize(last_name, password, ssn)
        @last_name = last_name
        @password = password
        @ssn = ssn
    end

    def validate_log_in_credentials
        user_found = USER_INFO.find {|user| user[:last].to_s == @last_name && user[:password] == @password && user[:ssn][-4..-1] == @ssn}

        #Notify the user if their log in credential is found
        # puts user_found ? "Welcome back #{user_found[:first]} #{user_found[:last]}!" : ("Access Denied! #{new_or_existing_user('y')}"

        if user_found 
            puts "Welcome back #{user_found[:first]} #{user_found[:last]}!"
        else
          puts "Access Denied!"
          new_or_existing_user('y')
        end
    
    end
end


#############################################
######### Main program starts here!##########
#############################################
puts "Welcome to Bank of Invoca!"
print "Are you an existing user?(Y/N):"
existing_new_user = gets.chomp.downcase


# Method to determine if the user is new or existing customer
def new_or_existing_user(user_response)
    case user_response
    when 'y'
        #Ask for credentials that will be used to validate sign in
        puts "Thank you for being a member of Bank of Invoca!!"

        print "Please enter your last name:"
        user_last_name_input = gets.chomp.downcase

        print "Please enter your password:"
        user_password_input = gets.chomp.downcase

        print "Please enter the last 4 digits of your SSN:"
        user_ssn_input = gets.chomp.downcase

        instance_for_log = LogInSignUp.new(user_last_name_input, user_password_input, user_ssn_input)
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
        if user_ssn.length.to_i <8
            print "Please re-enter your 8 digit SSN:"
        end 

    else
        print "Please re-enter Y or N:"
        $existing_new_user = gets.chomp.downcase
        new_or_existing_user($existing_new_user)
    end
end

new_or_existing_user(existing_new_user) 

