var http = require('http'),
    httpProxy = require('http-proxy');


// Create a proxy server with custom application logic
//
var proxy = httpProxy.createProxyServer({});

//
// Create your custom server and just call `proxy.web()` to proxy
// a web request to the target passed in the options
// also you can use `proxy.ws()` to proxy a websockets request
//
var server = http.createServer(function(req, res) {

    try {
        // You can define here your custom logic to handle the request
        // and then proxy the request.
        const url = ""+req.url

        if(url.includes("/api/")){
            proxy.web(req, res, { target: 'http://_server_' }, function(e) {console.error(e)});
        }else{
            proxy.web(req, res, { target: 'http://_client_' }, function(e) {console.error(e)});
        }
    }catch(error){
        console.error(error)
    }
});

console.log("listening on port 8080")
server.listen(8080);