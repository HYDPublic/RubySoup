require './BrandNewClass'

b = BrandNewClass.new

b.data=("My password")
b.save "secret.tmp"
b.load("secret.tmp")