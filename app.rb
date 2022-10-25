# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative "./app/controllers/meals_controller"
require_relative "./app/controllers/customers_controller"
require_relative "./app/repositories/meal_repository"
require_relative "./app/repositories/customer_repository"
require_relative "router"


meals_csv_file_path = File.join(File.dirname(__FILE__), "/data/meals.csv")
meal_repository = MealRepository.new(meals_csv_file_path)
meals_controller = MealsController.new(meal_repository)

customers_csv_file_path = File.join(File.dirname(__FILE__), "/data/customers.csv")
customer_repository = CustomerRepository.new(customers_csv_file_path)
customers_controller = CustomersController.new(customer_repository)

router = Router.new(meals_controller, customers_controller)

router.run
