This repository is provide deploying of Wordpress CMS to amount of Web Servers in Amazon AWS cloud  
The code is realize solution as you see below  
![GitHub Logo](/images/AWS.jpg)!

Used tools:  
1. Terraform - used for communication to AWS cloud and generating nessessary infrastructure  
2. Ansible - used for Web Servers Provisioning  
3. Jenkins - used for automate installing latest Wordpress version  
4. Docker (Docker-compose) - used for isolate nginx, mysql, and PHP-FPM services  

To apply the solution you must:  
* First of all define ENVIRONMENT variables in your OS to get access to AWS cloud  
* The variables should be named as:  
AWS_ACCESS_KEY_ID  
AWS_SECRET_ACCESS_KEY  
* Rename file `\templates\terraform.tfvars.templ` to `terraform.tfvars` and put it into projects root directory  
* Edit `terraform.tfvars` according to your needs. All defined variables described in comments  
* Edit Ansible config file `settings.yml` according to your needs. All defined variables described in comments
* Initialize terraform project from root directory via `terraform init` command  
* Apply terraform infrastructure via `terraform apply`  


