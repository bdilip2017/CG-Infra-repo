# Infrastructure Repository

This repository contains Terraform configurations for the Azure infrastructure.

## Instructions

1. **Fork** this repository.
2. Configure Terraform with Azure Service Principal credentials in DevOps.
3. Run the pipeline to set up AKS, ACR, and PostgreSQL.

## Pipeline

- Initializes and deploys infrastructure on Azure using Terraform.

# Running destroy(cleanup) pipeline

Trigger the Pipeline Manually:

1.In Azure DevOps, go to Pipelines > Your Cleanup Pipeline > Run Pipeline.
Select the environment (dev, staging, prod) from the environment parameter dropdown.
Review the Destroy Plan:

2.After the Preview stage completes, review the tfplan artifact to see which resources are set for deletion.
Confirm that the resources marked for deletion match expectations for the cleanup.
Manual Approval:

3.If the plan is correct, approve the manual validation step to proceed with the destroy operation in the Destroy stage.
Once approved, the pipeline will apply the destroy plan, deleting the specified resources.
