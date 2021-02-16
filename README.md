# Helm
This repository uses for creating a general Helm template that can be used for any applications.

## A little description of current infrastructure.

The field `.deployment.imageName` is binding. For the name will be able to use the `.Release.Name` as prefix everywhere that it needs, in the case if the '.generalInfo.name' is absent.

The value file has to contain the below general fields for correct work of chart by default:
‘generalInfo: {}
 
deployment:
  imageName: nginx
 
service: {}
 
ingress: {}
 
configmap: {}‘


### Deployment

Currently, the `deployment.yaml` file is taking the provided value from the `values.yaml` file, else using default options for execution and creation deployment object.

### Service

Actually `service.yaml` has the condition to get a map from the `.Values.service.ports` else will be used default options for including a result of deployment creation.
Pay attention to the fields which you are indicating in the `.Values.service.ports `. If they are present the indicated lines provide without any changes.

### Ingress

Ingress is an optional object that disabled by default. For enabling, you have to put in `true` for the .Values.ingressenabled field.

If even it was enabled, you have to set annotation and provide the external domain. It can be indicated as in `.ingress.domain` field or you indicate multiple-hosts in the `ingress.hosts[]`.
Else you will get the message: 
"Ingress is enabled but you didn't put in a value for the host field. Please set the `.ingress.domain` or `.ingress.hosts[]`."

There are a couple additional conditions that check the `.path` field and using them if it’s present, else will be used default value based on information from service or default values. 

### ConfigMap

Configmap expects to receive the value from your configuration file, for example, `appsettings.json` or another file that is needed for the proper work of your application. If this file hadn't provided or was provided wrong - you will get the bellow notification:
“Please check the app_setting value that was put in.”

The default name of the file in configmap is `appsettings.json`. You have to set the value for the `configmap_internal_name_offile` in the value file if you want to change the file name.

Path to file is able to indicate the file name that will be geted by configmap. 
If you have to indicate the full path using the folder's names - please use the set-file option.