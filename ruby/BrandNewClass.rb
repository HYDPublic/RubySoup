require './Persistence'
class BrandNewClass
  include Persistence
  attr :my_data

  def data=(someData)
    @my_data = someData
  end
end