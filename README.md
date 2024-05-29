# Despliegue de Pipeline en AWS con Terraform

## Descripción
Este repositorio contiene los archivos y la configuración necesarios para implementar un pipeline de despliegue en AWS utilizando Terraform. El pipeline utiliza AWS CodePipeline, AWS CodeBuild y AWS Secrets Manager para gestionar las credenciales.

## Estructura del Proyecto

ANALITIKA-PIPELINE: nombre del proyecto

- codigos/: Contiene la configuración de Terraform para los recursos de AWS.

- codigos/buildspec/: Incluye el archivo buildspec.yml utilizado por AWS CodeBuild.
- repositorio-de-cicd/: Contiene el repositorio de codecommit, se tiene que realizar mediante el codecommit y hacer clone dentro de la carpeta codigos dentro copear los 4 archivos que tenemos ahi para que funcione el primer stage del pipeline.

Requisitos Previos

- Terraform instalado.
- Credenciales de AWS configuradas.

Despliegue - Ejecucion del proyecto

- Clona este repositorio e ingresa a tu repositorio. 

```bash
git clone https://jesus_quispe@bitbucket.org/analitika-cloud/escuelita-pipelines-v1.git

cd escuelita-pipelines-v1/
```
- Inicia Terraform:  

```bash
terraform init
```

- Prepara Terraform:  

```bash
terraform plan
```

- Aplica la configuración  

```bash
terraform apply --auto-approve
```


### Mantenimiento y Contribuciones


Siéntete libre de contribuir abriendo problemas o enviando solicitudes de extracción. Consulta nuestras pautas de contribución para obtener más detalles.

### Notas Importantes  

- Asegúrate de tener las credenciales de AWS correctamente configuradas antes de ejecutar Terraform.
- Este proyecto utiliza AWS Secrets Manager para gestionar credenciales sensibles.

### Licencia  

- Este proyecto está bajo la licencia de Analitika.cloud by Jesus

### Agradecimientos

- Este proyecto se inspiró en el ejemplo de despliegue de Terraform en AWS de [diagrama del proyecto](https://lucid.app/documents/view/9b95ca47-6dde-4ed0-9acb-e7414a5c27db).

- diagrama del proyecto:  

![Logo de Markdown](DevOps_AWS.png)

![alt text](image.png)