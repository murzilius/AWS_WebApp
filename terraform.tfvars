/* First of all define ENVIRONMENT variables in your OS to get access to AWS cloud
The variables should be named as:
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY

*/

region= "us-east-2"                                   //Region defenition for AWS servers landing
instance = "t2.micro"                                 //Instance type defenition
id_rsa_key_path  = "d:\\Job2\\AWS_WebApp\\keys\\id_rsa"       //Path to PRIVATE key for Servers to grant aceess via SSH
instance_tags = ["Web1", "Web2"]
 
 // List of Evironment variables for Deploy server
 EnvVARS ={
    "USERNAME_J"="admin"
    "USERPASS_J"="admin" 
    "MYSQL_ROOT_PASSWORD"="admin" 
    "MYSQL_PASSWORD"="admin"
    "MYSQL_USER"="wordpress" 
    "GITHUB_TOKEN"="11b7191ab18d0324f888afbc1fbd35f9df1d33db"
    "GITHUB_REPO_NAME"="AWS_WebApp"
    "GITHUB_REPO_PATH"="github.com/murzilius/AWS_WebApp"} 


ingress_ports  = [  "80","8080","22","443"  ]         // Define List of outter ports to open to access Servers
egress_ports  =  [  "0"  ]                             // Define List of inner ports to open for upstream data 
ingress_IPs = [  "0.0.0.0/0" ]                         //Define ingress cidr block IP's
egress_IPs = [  "0.0.0.0/0" ]                          // Define egress cidr block IP's
pub_key_path="d:\\Job2\\AWS_WebApp\\keys\\AWS.pub"            //Path for Server's PUBLIC KEY