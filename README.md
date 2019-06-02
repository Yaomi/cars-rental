# cars-rental

Preferable solution: 
CI + CD with AzureDevops + Azure k8s

Build definition:
1. Import source code to AzureDevops Agent
2. Get tag from latest master (it will represent source code version, using Semantic Versioning)
3. Build and docker image and set tag
4. Publish image to Azure Container Registry
5. Create Artefact with service deployment.yaml where is the instance definition that k8s will use to create insatnce

Release definition:
1. Tokenize deployment.yaml so it's per environment (dev, prod, etc.)
2. Deploy tokenized file to k8s and trigger environment deployment
 
