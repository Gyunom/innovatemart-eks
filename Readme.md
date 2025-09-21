# My InnovateMart EKS Project - Project Bedrock

This is my submission for the InnovateMart EKS deployment assignment. It contains the complete implementation of Project Bedrock for InnovateMart Inc., successfully deploying a production-grade EKS cluster with the retail store microservices application..

## What I Created

I successfully deployed a complete retail store application on AWS using Kubernetes (EKS). 

**You can check out the live application here**: 
http://a3a4ed4d8619f41f596ef5ec92c34735-2014411719.eu-west-1.elb.amazonaws.com

## My Project Files

Here's how I organized everything in my GitHub repository:

```
innovatemart-eks/
├── README.md                     # This file you're reading
├── terraform/                    # All my infrastructure code
│   ├── main.tf                  # The main setup file
│   ├── variables.tf             # Configuration options
│   ├── outputs.tf               # What gets created
│   └── terraform.tfvars         # My specific settings
├── k8s-manifests/               # All the app deployment files
│   └── retail-store-sample-app/
│       ├── namespace.yaml       # Creates the app space
│       ├── mysql.yaml          # Database for products
│       ├── postgres.yaml       # Database for orders  
│       ├── redis.yaml          # Fast cache storage
│       ├── dynamodb.yaml       # Shopping cart storage
│       ├── rabbitmq.yaml       # Message system
│       ├── catalog-service.yaml # Product catalog
│       ├── orders-service.yaml  # Order management
│       ├── carts-service.yaml   # Shopping cart
│       ├── checkout-service.yaml # Payment processing
│       └── ui-service.yaml      # The website frontend
└── .github/workflows/           # Automatic deployment
    └── terraform.yml            # GitHub Actions setup
```

## What I Actually Built

### The Infrastructure
I used Terraform to create everything in AWS:
- A private network (VPC) with public and private sections
- An EKS Kubernetes cluster running in Ireland (eu-west-1)
- Two small servers (t3.small) to run everything
- Security settings to keep everything safe
- A load balancer so people can access the website

### The Application
I deployed a complete online store with these parts:
- **Website frontend** - What customers see and interact with
- **Product catalog** - Shows all the items for sale
- **Shopping cart** - Lets people add items to buy
- **Order system** - Handles when people want to purchase
- **Checkout system** - Processes payments
- **Multiple databases** - Stores all the data (MySQL, PostgreSQL, Redis, DynamoDB)

### Developer Access
I created a special user account for the development team:
- They can view everything in the cluster
- They can check logs when things go wrong  
- They can see the status of all services
- But they can't accidentally delete or break anything

### Automatic Deployment
I set up GitHub Actions so that:
- When I make changes to the code, it automatically checks if they are valid
- When I merge changes to the main branch, it deploys them automatically
- All AWS credentials are stored securely


## The Technical Details

**Where it's running**: AWS eu-west-1 (Ireland)
**Kubernetes version**: 1.28
**Server size**: 2 x t3.small instances  
**Database setup**: All running inside the cluster
**External access**: AWS Load Balancer

## My Developer Account

I created a read-only account for developers. Here's how to use it:

```bash
# Set up the credentials (I'll provide these separately)
export AWS_ACCESS_KEY_ID="AKIASZ5FJAYWPIJ2VHJL"
export AWS_SECRET_ACCESS_KEY="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%"
export AWS_DEFAULT_REGION="eu-west-1"

# Connect to the cluster
aws eks update-kubeconfig --region eu-west-1 --name innovatemart-eks

# Now you can look at everything
kubectl get pods --all-namespaces
kubectl logs [pod-name] -n retail-store-sample
```

## What I Learned

This project taught me so much. Here are some of my takeaways:
- How to use Terraform to create cloud infrastructure
- How Kubernetes manages containers and services
- How different services talk to each other
- How to set up proper security and access controls
- How to automate deployments with GitHub Actions
- How to troubleshoot when things go wrong (and they did)

## Challenges I Faced

I'll be honest, this wasn't easy! I ran into several problems:

1. **The t3.micro instances were too small** - They couldn't handle all the services, so I had to upgrade to t3.small
2. **DNS issues with kubectl** - Had to fix my local DNS settings to connect properly
3. **The shopping cart service kept crashing** - Took some debugging to get it working
4. **Load balancer took time to provision** - Had to be patient while AWS set everything up

But I worked through each problem and learned a lot in the process.


## Final Thoughts
The application is running live, all the services are talking to each other properly, and everything is automated.

This project shows I can:
- Write infrastructure code that actually works
- Deploy complex applications to Kubernetes
- Set up proper security and access controls  
- Create automated deployment pipelines
- Troubleshoot and solve problems when they come up

The retail store is live and functional - you can go use it right now! That feels pretty amazing.

**Application URL**: http://a3a4ed4d8619f41f596ef5ec92c34735-2014411719.eu-west-1.elb.amazonaws.com
**GitHub Repository**: https://github.com/Gyunom/innovatemart-eks/

Thanks for reviewing my work. 
