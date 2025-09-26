//! Generated from registry.yaml
//! Namespace: cloud
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

pub const providerValue = enum {
    /// Alibaba Cloud
    alibaba_cloud,
    /// Amazon Web Services
    aws,
    /// Microsoft Azure
    azure,
    /// Google Cloud Platform
    gcp,
    /// Heroku Platform as a Service
    heroku,
    /// IBM Cloud
    ibm_cloud,
    /// Oracle Cloud Infrastructure (OCI)
    oracle_cloud,
    /// Tencent Cloud
    tencent_cloud,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .alibaba_cloud => "alibaba_cloud",
            .aws => "aws",
            .azure => "azure",
            .gcp => "gcp",
            .heroku => "heroku",
            .ibm_cloud => "ibm_cloud",
            .oracle_cloud => "oracle_cloud",
            .tencent_cloud => "tencent_cloud",
        };
    }
};

pub const platformValue = enum {
    /// Alibaba Cloud Elastic Compute Service
    alibaba_cloud_ecs,
    /// Alibaba Cloud Function Compute
    alibaba_cloud_fc,
    /// Red Hat OpenShift on Alibaba Cloud
    alibaba_cloud_openshift,
    /// AWS Elastic Compute Cloud
    aws_ec2,
    /// AWS Elastic Container Service
    aws_ecs,
    /// AWS Elastic Kubernetes Service
    aws_eks,
    /// AWS Lambda
    aws_lambda,
    /// AWS Elastic Beanstalk
    aws_elastic_beanstalk,
    /// AWS App Runner
    aws_app_runner,
    /// Red Hat OpenShift on AWS (ROSA)
    aws_openshift,
    /// Azure Virtual Machines
    azure_vm,
    /// Azure Container Apps
    azure_container_apps,
    /// Azure Container Instances
    azure_container_instances,
    /// Azure Kubernetes Service
    azure_aks,
    /// Azure Functions
    azure_functions,
    /// Azure App Service
    azure_app_service,
    /// Azure Red Hat OpenShift
    azure_openshift,
    /// Google Bare Metal Solution (BMS)
    gcp_bare_metal_solution,
    /// Google Cloud Compute Engine (GCE)
    gcp_compute_engine,
    /// Google Cloud Run
    gcp_cloud_run,
    /// Google Cloud Kubernetes Engine (GKE)
    gcp_kubernetes_engine,
    /// Google Cloud Functions (GCF)
    gcp_cloud_functions,
    /// Google Cloud App Engine (GAE)
    gcp_app_engine,
    /// Red Hat OpenShift on Google Cloud
    gcp_openshift,
    /// Red Hat OpenShift on IBM Cloud
    ibm_cloud_openshift,
    /// Compute on Oracle Cloud Infrastructure (OCI)
    oracle_cloud_compute,
    /// Kubernetes Engine (OKE) on Oracle Cloud Infrastructure (OCI)
    oracle_cloud_oke,
    /// Tencent Cloud Cloud Virtual Machine (CVM)
    tencent_cloud_cvm,
    /// Tencent Cloud Elastic Kubernetes Service (EKS)
    tencent_cloud_eks,
    /// Tencent Cloud Serverless Cloud Function (SCF)
    tencent_cloud_scf,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .alibaba_cloud_ecs => "alibaba_cloud_ecs",
            .alibaba_cloud_fc => "alibaba_cloud_fc",
            .alibaba_cloud_openshift => "alibaba_cloud_openshift",
            .aws_ec2 => "aws_ec2",
            .aws_ecs => "aws_ecs",
            .aws_eks => "aws_eks",
            .aws_lambda => "aws_lambda",
            .aws_elastic_beanstalk => "aws_elastic_beanstalk",
            .aws_app_runner => "aws_app_runner",
            .aws_openshift => "aws_openshift",
            .azure_vm => "azure.vm",
            .azure_container_apps => "azure.container_apps",
            .azure_container_instances => "azure.container_instances",
            .azure_aks => "azure.aks",
            .azure_functions => "azure.functions",
            .azure_app_service => "azure.app_service",
            .azure_openshift => "azure.openshift",
            .gcp_bare_metal_solution => "gcp_bare_metal_solution",
            .gcp_compute_engine => "gcp_compute_engine",
            .gcp_cloud_run => "gcp_cloud_run",
            .gcp_kubernetes_engine => "gcp_kubernetes_engine",
            .gcp_cloud_functions => "gcp_cloud_functions",
            .gcp_app_engine => "gcp_app_engine",
            .gcp_openshift => "gcp_openshift",
            .ibm_cloud_openshift => "ibm_cloud_openshift",
            .oracle_cloud_compute => "oracle_cloud_compute",
            .oracle_cloud_oke => "oracle_cloud_oke",
            .tencent_cloud_cvm => "tencent_cloud_cvm",
            .tencent_cloud_eks => "tencent_cloud_eks",
            .tencent_cloud_scf => "tencent_cloud_scf",
        };
    }
};

/// Name of the cloud provider.
pub const cloud_provider = types.EnumAttribute(providerValue){
    .base = types.StringAttribute{
        .name = "cloud.provider",
        .brief = "Name of the cloud provider.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = providerValue.alibaba_cloud,
};

/// The cloud account ID the resource is assigned to.
pub const cloud_account_id = types.StringAttribute{
    .name = "cloud.account.id",
    .brief = "The cloud account ID the resource is assigned to.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The geographical region within a cloud provider. When associated with a resource, this attribute specifies the region where the resource operates. When calling services or APIs deployed on a cloud, this attribute identifies the region where the called destination is deployed.
pub const cloud_region = types.StringAttribute{
    .name = "cloud.region",
    .brief = "The geographical region within a cloud provider. When associated with a resource, this attribute specifies the region where the resource operates. When calling services or APIs deployed on a cloud, this attribute identifies the region where the called destination is deployed.",
    .note = "Refer to your provider's docs to see the available regions, for example [Alibaba Cloud regions](https://www.alibabacloud.com/help/doc-detail/40654.htm), [AWS regions](https://aws.amazon.com/about-aws/global-infrastructure/regions_az/), [Azure regions](https://azure.microsoft.com/global-infrastructure/geographies/), [Google Cloud regions](https://cloud.google.com/about/locations), or [Tencent Cloud regions](https://www.tencentcloud.com/document/product/213/6091).",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Cloud provider-specific native identifier of the monitored cloud resource (e.g. an [ARN](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) on AWS, a [fully qualified resource ID](https://learn.microsoft.com/rest/api/resources/resources/get-by-id) on Azure, a [full resource name](https://google.aip.dev/122
pub const cloud_resource_id = types.StringAttribute{
    .name = "cloud.resource_id",
    .brief = "Cloud provider-specific native identifier of the monitored cloud resource (e.g. an [ARN](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) on AWS, a [fully qualified resource ID](https://learn.microsoft.com/rest/api/resources/resources/get-by-id) on Azure, a [full resource name](https://google.aip.dev/122",
    .note = "On some cloud providers, it may not be possible to determine the full ID at startup,\nso it may be necessary to set `cloud.resource_id` as a span attribute instead.\n\nThe exact value to use for `cloud.resource_id` depends on the cloud provider.\nThe following well-known definitions MUST be used if you set this attribute and they apply:\n\n- **AWS Lambda:** The function [ARN](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html).\nTake care not to use the \"invoked ARN\" directly but replace any\n[alias suffix](https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html)\nwith the resolved function version, as the same runtime instance may be invocable with\nmultiple different aliases.\n- **GCP:** The [URI of the resource](https://cloud.google.com/iam/docs/full-resource-names)\n- **Azure:** The [Fully Qualified Resource ID](https://learn.microsoft.com/rest/api/resources/resources/get-by-id) of the invoked function,\n*not* the function app, having the form\n`/subscriptions/<SUBSCRIPTION_GUID>/resourceGroups/<RG>/providers/Microsoft.Web/sites/<FUNCAPP>/functions/<FUNC>`.\nThis means that a span attribute MUST be used, as an Azure function app can host multiple functions that would usually share\na TracerProvider.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Cloud regions often have multiple, isolated locations known as zones to increase availability. Availability zone represents the zone where the resource is running.
pub const cloud_availability_zone = types.StringAttribute{
    .name = "cloud.availability_zone",
    .brief = "Cloud regions often have multiple, isolated locations known as zones to increase availability. Availability zone represents the zone where the resource is running.",
    .note = "Availability zones are called \"zones\" on Alibaba Cloud and Google Cloud.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The cloud platform in use.
pub const cloud_platform = types.EnumAttribute(platformValue){
    .base = types.StringAttribute{
        .name = "cloud.platform",
        .brief = "The cloud platform in use.",
        .note = "The prefix of the service SHOULD match the one specified in `cloud.provider`.\n\n",
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = platformValue.alibaba_cloud_ecs,
};

/// A cloud environment (e.g. GCP, Azure, AWS).
/// Display name: Cloud Attributes
pub const Registry = struct {
    /// Name of the cloud provider.
    pub const provider = cloud_provider;
    /// The cloud account ID the resource is assigned to.
    pub const accountId = cloud_account_id;
    /// The geographical region within a cloud provider. When associated with a resource, this attribute specifies the region where the resource operates. When calling services or APIs deployed on a cloud, this attribute identifies the region where the called destination is deployed.
    pub const region = cloud_region;
    /// Cloud provider-specific native identifier of the monitored cloud resource (e.g. an [ARN](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) on AWS, a [fully qualified resource ID](https://learn.microsoft.com/rest/api/resources/resources/get-by-id) on Azure, a [full resource name](https://google.aip.dev/122
    pub const resourceId = cloud_resource_id;
    /// Cloud regions often have multiple, isolated locations known as zones to increase availability. Availability zone represents the zone where the resource is running.
    pub const availabilityZone = cloud_availability_zone;
    /// The cloud platform in use.
    pub const platform = cloud_platform;
};

