
from http.server import HTTPServer , BaseHTTPRequestHandler
import json
import socketserver

massage="ok"

class WebServerHandler(BaseHTTPRequestHandler):
       
    def do_GET(self):
    	global massage
    	if self.path=='/api/v1/status':   
            	self.send_response(200)
            	self.send_header('Content-type', 'application/json')
            	self.end_headers()
            	response= {"status":massage}
            	self.wfile.write(bytes(json.dumps(response,ensure_ascii=False), 'utf-8'))
        	
       
    def do_POST(self):
    	global massage
    	if self.path=='/api/v1/status':
        	content_length = int(self.headers['Content-Length'])
        	post_data = self.rfile.read(content_length)
        	data=json.loads(post_data)
        	massage=data["status"]
        	self.send_response(201)
        	self.send_header('Content-type', 'application/json')
        	self.end_headers()
        	response=json.dumps({"status":massage})
        	self.wfile.write(bytes(response,'utf-8'))
        	
        
	
with HTTPServer(('',8000),WebServerHandler) as server:
	server.serve_forever()
	
#port = 8000
#server = HTTPServer(('localhost', port), WebServerHandler)
#print("Web server is running on port {}".format(port))
#server.serve_forever()
#server.server_close()

