# Workspaces vs env directories

A typical scenario for Infrastructure as Code (IaC) is deploying the same or similar ressources on separate platforms, e.g. 

- `dev`
- `testing`
- `prod`

with a maximum of safety and/or a minimum of code duplication. 

## Workspaces

- `tofu workspace list`    
Note that there will always be a `default` workspace!
- `tofu workspace new dev`    
Creates the `dev` workspace and switches into it
- `tofu workspace new prod`    
Creates the `dev` workspace and switches into it
- `tofu workspace select dev`    
Switches into the `dev` workspace

Creating a new workspace will automatically create the `terraform.tfstate.d` directory with a subdirectory for that workspace.

When you execute `tofu apply` your state file will be stored in the coresponding subdirectory.

```bash
.
├── main.tf
├── outputs.tf
├── providers.tf
├── terraform.tfstate.d
│   ├── dev
│   │   └── terraform.tfstate
│   └── prod
├── variables.tf
└── versions.tf
```



## `env` directories