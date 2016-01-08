# sample-cookbooks
It's a sample Chef cookbook for AWS OpsWorks.


## rpm-app
This recipe could help you deploy rpm package which listed in OpsWorks App to the target instance.

To use this recipe, be sure you specify rpm package in OpsWorks App, and you have to add lifecycle events into OpsWorks layer:
```
"CustomRecipes":{
               "Deploy":[
                  "rpm-app::deploy"
               ],
               "Undeploy":[
                  "rpm-app::undeploy"
               ]
            }
```
You should be able to do the rpm deployment then.


