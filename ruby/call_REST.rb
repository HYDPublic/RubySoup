require 'net/http'

#url = 'http://www.acme.com/products/3322' # ACME boomerang
#url = 'http://engjira.int.kronos.com:8081/rest/api/2/search?jql=assignee=tony'

url = 'http://engjira.int.kronos.com:8081/rest/api/2/issue/WFC-2103'

uri = URI.parse(url)


http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
request = Net::HTTP::Get.new(uri.request_uri)
#request["user"] = "<username>"
#request["password"] = "<password>"  
request.basic_auth 'Stephen.Bergeron@kronos.com', '###########'
request["Content-Type"] = "application/json"  

puts http.request(request)



#resp = Net::HTTP.get_response(uri)
#puts resp_text = resp.body





#url = 'http://www.acme.com/user/details'
#params2 = {
#  firstName => 'John',
#  lastName => 'Doe'
#}
#resp = Net::HTTP.post_form(url, params)
#
#puts resp_text = resp.body
