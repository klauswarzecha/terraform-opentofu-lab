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

## Renaming a bucket

The name of a bucket in `terraform.tfvars` can be changed.  

```hcl
bucket_definitions = {
  "archive" = {
    tags = {
      Purpose = "archiving"
    }
  },
  [...]
```

A `moved` block seemingly indicates that the bucket is just renamed.


```hcl
moved {
  from = aws_s3_bucket.this["logs"]
  to   = aws_s3_bucket.this["archive"]
}
```

This is a dangerous misconception. 

- A new bucket is created 
- The old bucket is destroyed. 
- The data in the old bucket is not moved!

### Changing keys in for_each results in resource replacement, not update.