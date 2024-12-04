# HWCloudTFTemplates

Este repositorio contiene un conjunto de plantillas de Terraform diseñadas para la creación y gestión de recursos en Huawei Cloud. Incluye configuraciones para instancias ECS, VPC, Subnets y otros componentes, organizados en una estructura modular y reusable.

## Estructura del Proyecto

El repositorio tiene la siguiente estructura:

```tree
HWCloudTFTemplates
├── Templates
│   ├── ecs
│   │   └── main.tf
│   ├── ecs-in-batch
│   │   └── main.tf
│   ├── ecs-sg-vpc-peering
│   │   ├── ecs.tf
│   │   ├── secgroup.tf
│   │   ├── vpc-peering.tf
│   │   └── vpc.tf
│   ├── ecs-with-vpc-subnet
│   │   └── main.tf
├── libs.tf 
├── provider.tf 
├── variables.tf 
├── terraform.tfvars (excluido del repositorio) 
└── README.md
```


### Descripción de Carpetas y Archivos

- **Templates/**: Carpeta que contiene las plantillas para distintos escenarios:
  - **ecs/**:
    - `main.tf`: Configuración para una ECS con una imagen de Windows.
  - **ecs-in-batch/**:
    - `main.tf`: Configuración para la creación de ECS en lote.
  - **ecs-sg-vpc-peering/**:
    - `ecs.tf`: Configuración de las ECS que comparten un Security Group.
    - `secgroup.tf`: Configuración del Security Group.
    - `vpc-peering.tf`: Configuración del emparejamiento (peering) entre VPC.
    - `vpc.tf`: Configuración de las VPC y Subnets.
  - **ecs-with-vpc-subnet/**:
    - `main.tf`: Configuración para una ECS con una VPC, una Subnet y un Security Group.

- **libs.tf**: Contiene el llamado a la librería `HWCloudTFLib` con enumerables comunes. Puedes revisar la descripción de la librería en su [repositorio](https://github.com/JuanRoeder/HWCloudTFLib.git)

- **provider.tf**: Configuración del proveedor de nube (Huawei Cloud).

- **variables.tf**: Declaración de variables utilizadas en el proyecto.

- **terraform.tfvars**: Contiene los valores para las variables declaradas en `variables.tf`. Este archivo está excluido del repositorio para proteger las credenciales y la información sensible.

- **README.md**: Documento de referencia del proyecto.

## Requisitos Previos

Antes de usar este proyecto, asegúrate de contar con lo siguiente:

1. **Terraform** instalado en tu máquina. [Instrucciones de instalación](https://www.terraform.io/downloads).
2. Credenciales de acceso a Huawei Cloud configuradas en el archivo `terraform.tfvars`.
3. Configuración de Git para clonar este repositorio desde GitHub.

## Uso

1. **Clonar el repositorio:**
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd HWCloudTFTemplates

2. **Configurar credenciales:** Crea un archivo `terraform.tfvars` en la raíz del proyecto con las credenciales necesarias. Ejemplo:
   ```hcl
   HWCLOUD_AK = "your access key"
   HWCLOUD_SK = "your secret key"
   HWCLOUD_REGION = "la-south-2"

3. **Inicializar Terraform:** Ejecuta el siguiente comando para inicializar el entorno de Terraform:
   ```bash
   terraform init

4. **Seleccionar la plantilla a usar:** Dirígete a la carpeta correspondiente en Templates/ y selecciona el escenario deseado y cópialo a la raíz de tu proyecto.

5. **Aplicar la configuración:** Ejecuta el siguiente comando para crear los recursos:
   ```bash
   terraform plan
   terraform apply
   ```

    Considerar que el primer comando `plan` únicamente realizará una verificación de los elementos que se van a crear, modificar o destruir en nube. No se aplicará ningún cambio hasta ejecutar el comando `apply`

## Exclusión del Archivo terraform.tfvars

Por motivos de seguridad, el archivo `terraform.tfvars` no se encuentra en el repositorio. Asegúrate de no incluir credenciales sensibles en el control de versiones. Se ha añadido al archivo .gitignore:
   ```plaintext
   terraform.tfvars
   ```

## Contribuciones

Si deseas contribuir a este proyecto, sigue las mejores prácticas de Terraform y realiza un `pull request` con una descripción detallada de los cambios.