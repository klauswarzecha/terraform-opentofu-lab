# Example configuration

## Notes

- `.tfvars` files are not committed to avoid leaking sensitive data
- Example configurations are provided inline for demonstration purposes


```hcl
bucket_definitions = {
  "logs" = {
    tags = {
      Purpose = "logging"
    }
  },
  "export" = {
    tags = {
      Purpose = "exchange with QA"
      Team    = "quality"
    }
  },
  images = {
    tags = {
      Purpose = "image campaign"
      Team    = "marketing"
    }
  },
  videos = {
    tags = {
      Purpose = "TikTok"
      Team    = "multimedia"
    }
  }
}
```
