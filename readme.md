This repository is provide deploying of Wordpress CMS to amount of Web Servers in Amazon AWS cloud  
Teh code is realize solution as you see below  
THERE MUST BE SCEMATIC SOLUTION
Using tools:  
# Terraform - used for communication to AWS cloud and generating nessessary infrastructure  
# Asible - used for Web Servers Provisioning  
# Jenkins - used for automate installing latest Wordpress version  
# Docker (Docker-compose) - used for isolate nginx, mysql, and PHP-FPM services  

To apply the solution you must:  
## First of all define ENVIRONMENT variables in your OS to get access to AWS cloud  
The variables should be named as:  
AWS_ACCESS_KEY_ID  
AWS_SECRET_ACCESS_KEY  
## Rename file `\templates\terraform.tfvars.templ` to `terraform.templ` and put it into projects root directory  
## Edit `terraform.tfvars.templ` according to your needs. All defined variables described in comments  
## Edit Asible config file `settings.yml` according to your needs.

