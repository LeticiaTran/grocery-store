require 'csv'
require 'awesome_print'

#_______________ Grocery::Customer _______________

module Grocery
  class Customer

    attr_reader :costumer_id, :email, :address

    # Initialize class Customer:
    def initialize(costumer_id, email, customer_address)
      @costumer_id = costumer_id
      @email = email
      @address = customer_address
    end


    #############################################################################################
    # ALL CUSTOMERS:

    # self.all - returns a collection of OnlineOrder instances, representing all of the OnlineOrders described in the CSV. See below for the CSV file specifications
    def self.all

      @all_customers = []

      # Read file:
      file_to_read = CSV.read('support/customers.csv', 'r')

      file_to_read.each do |row|

        #Select the order costumer_id number from the file and assign it:
        costumer_id = row[0].to_i
        email = row[1]
        customer_address = "#{row[2]}, #{row[3]}, #{row[4]}, #{row[5]}"

        # Create new customer:
        new_customer = Customer.new(costumer_id, email, customer_address)

        # Push this customer to all_custumers array
        @all_customers << new_customer
      end
      return @all_customers

    end

    #############################################################################################
    # FIND CUSTOMERS:

    def self.find(find_costumer_id)
       found_customer = nil
       @all_customers.each do |customer|
         if customer.costumer_id == find_costumer_id
           found_customer = customer
         end
       end
       # If it were to raise an error:
       # unless found_customer != nil
       #   raise ArgumentError.new("Customer doesn't exist.")
       # end
       return found_customer
    end

  end
end
