class ApplicationController < ActionController::API
  def string_to_number(string)
    string.tr('.', '').to_i
  end
end
