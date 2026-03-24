# Workspaces vs `envs/` directories

A typical Infrastructure as Code (IaC) scenario is deploying the same or similar resources to separate stages, for example:

- `dev`
- `testing`
- `prod`


Two common approaches are:

- `workspaces`
- `envs/` directories


## Workspaces

With workspaces, there is a single code base for multiple environments or stages. The configuration stays the same, but each workspace gets its own separate state.

Typical workspace commands are:

- `tofu workspace list`    
There is always a `default` workspace!


- `tofu workspace new dev`     
Creates the `dev` workspace and switches into it.


- `tofu workspace new prod`    
Creates the `prod` workspace and switches into it.


- `tofu workspace select dev`    
Switches into the already existing `dev` workspace.

Creating additional workspaces creates the `terraform.tfstate.d` directory with one subdirectory per workspace.

When you execute `tofu apply`, the state file is stored in the corresponding workspace directory.

```bash
.
├── main.tf
├── outputs.tf
├── providers.tf
├── terraform.tfstate.d
│   ├── dev
│   │   └── terraform.tfstate
│   └── prod
│       └── terraform.tfstate
├── variables.tf
└── versions.tf
```

In summary: 

- one configuration
- multiple state files
- one state per workspace


If you do not explicitly create or select another workspace, you are working in the `default` workspace. 


## `envs/` directories

With `envs/`, you create separate directories for each stage or environment.

```bash
.
├── dev
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── terraform.tfstate
│   ├── variables.tf
│   └── versions.tf
└── prod
    ├── main.tf
    ├── outputs.tf
    ├── providers.tf
    ├── variables.tf
    └── versions.tf
```

This approach gives you stronger separation between environments. The configurations may still be similar, but they are managed from separate directories.


## Summary

### Workspaces

#### Advantages

- very little code duplication
- fast to set up
- useful for labs, experiments, and simple setups

#### Disadvantages

- weaker separation between environments
- easier to operate on the wrong workspace by mistake
- often less suitable for production-grade isolation

### `envs/` directories

#### Advantages

- cleaner separation between environments
- easier to reason about in larger or more critical setups
- safer for production-oriented workflows

#### Disadvantages

- more boilerplate
- potential code duplication unless modules are used carefully


#### Advantages

- very little code duplication
- fast to set up
- useful for labs, experiments, and simple setups

#### Disadvantages

- weaker separation between environments
- easier to operate on the wrong workspace by mistake
- often less suitable for production-grade isolation

In this lab, workspaces are elegant and concise, but `envs/` provide stronger operational separation.


