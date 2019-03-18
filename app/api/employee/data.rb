module Employee
  class Data < Grape::API
    resource :employee_data do
      desc "List all Employee"
      get do
        EmpDatum.all
      end

      desc "Show specific Employee"
      params do 
        requires :id, type: String
      end
      get ":id" do
        EmpDatum.find(params[:id])
      end

      desc "Create a new employee"
      params do
        requires :name, type: String
        requires :address, type: String
        requires :age, type: Integer
      end
      post do
        EmpDatum.create!({
          name: params[:name],
          address: params[:address],
          age: params[:age],
        })
      end

      desc "Delete an employee"
      params do
        requires :id, type: String
      end
      delete ':id' do
        EmpDatum.find(params[:id]).destroy!
      end

      desc "Update an employee address"
      params do
        requires :id, type: String
        requires :address, type: String
      end

      put ':id' do
        EmpDatum.find(params[:id]).update({
          address:params[:address]
        })
      end
    end
  end
end