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