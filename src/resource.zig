// DO NOT EDIT, this is an auto-generated file
//
// If you want to update the file:
// - Edit the template at scripts/templates/registry/zig/resource.zig.j2
// - Run the script at scripts/generate-consts-from-spec.sh

//! # Semantic Resource Attributes
//!
//! The entire set of semantic resource attributes (or [conventions](https://opentelemetry.io/docs/concepts/semantic-conventions/)) defined by the project.

/// Uniquely identifies the framework API revision offered by a version (`os.version`) of the android operating system. More information can be found [here](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels).

/// 
/// # Examples
/// 
/// - 33
/// - 32
/// Note: This attribute is experimental and may change in the future.
pub const ANDROID_OS_API_LEVEL: []const u8 = "android.os.api_level";

/// A unique identifier representing the installation of an application on a specific device

/// 
/// # Examples
/// 
/// - 2ab2916d-a51f-4ac8-80ee-45ac31a28092
/// Note: This attribute is experimental and may change in the future.
pub const APP_INSTALLATION_ID: []const u8 = "app.installation.id";

/// The ARN of an [ECS cluster](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html).

/// 
/// # Examples
/// 
/// - arn:aws:ecs:us-west-2:123456789123:cluster/my-cluster
/// Note: This attribute is experimental and may change in the future.
pub const AWS_ECS_CLUSTER_ARN: []const u8 = "aws.ecs.cluster.arn";

/// The Amazon Resource Name (ARN) of an [ECS container instance](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_instances.html).

/// 
/// # Examples
/// 
/// - arn:aws:ecs:us-west-1:123456789123:container/32624152-9086-4f0e-acae-1a75b14fe4d9
/// Note: This attribute is experimental and may change in the future.
pub const AWS_ECS_CONTAINER_ARN: []const u8 = "aws.ecs.container.arn";

/// The [launch type](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html) for an ECS task.

/// Note: This attribute is experimental and may change in the future.
pub const AWS_ECS_LAUNCHTYPE: []const u8 = "aws.ecs.launchtype";

/// The ARN of a running [ECS task](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html#ecs-resource-ids).

/// 
/// # Examples
/// 
/// - arn:aws:ecs:us-west-1:123456789123:task/10838bed-421f-43ef-870a-f43feacbbb5b
/// - arn:aws:ecs:us-west-1:123456789123:task/my-cluster/task-id/23ebb8ac-c18f-46c6-8bbe-d55d0e37cfbd
/// Note: This attribute is experimental and may change in the future.
pub const AWS_ECS_TASK_ARN: []const u8 = "aws.ecs.task.arn";

/// The family name of the [ECS task definition](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html) used to create the ECS task.

/// 
/// # Examples
/// 
/// - opentelemetry-family
/// Note: This attribute is experimental and may change in the future.
pub const AWS_ECS_TASK_FAMILY: []const u8 = "aws.ecs.task.family";

/// The ID of a running ECS task. The ID MUST be extracted from `task.arn`.

/// 
/// # Examples
/// 
/// - 10838bed-421f-43ef-870a-f43feacbbb5b
/// - 23ebb8ac-c18f-46c6-8bbe-d55d0e37cfbd
/// Note: This attribute is experimental and may change in the future.
pub const AWS_ECS_TASK_ID: []const u8 = "aws.ecs.task.id";

/// The revision for the task definition used to create the ECS task.

/// 
/// # Examples
/// 
/// - 8
/// - 26
/// Note: This attribute is experimental and may change in the future.
pub const AWS_ECS_TASK_REVISION: []const u8 = "aws.ecs.task.revision";

/// The ARN of an EKS cluster.

/// 
/// # Examples
/// 
/// - arn:aws:ecs:us-west-2:123456789123:cluster/my-cluster
/// Note: This attribute is experimental and may change in the future.
pub const AWS_EKS_CLUSTER_ARN: []const u8 = "aws.eks.cluster.arn";

/// The Amazon Resource Name(s) (ARN) of the AWS log group(s).

/// 
/// # Examples
/// 
/// - [\"arn:aws:logs:us-west-1:123456789012:log-group:/aws/my/group:*\"]
/// Note: This attribute is experimental and may change in the future.
pub const AWS_LOG_GROUP_ARNS: []const u8 = "aws.log.group.arns";

/// The name(s) of the AWS log group(s) an application is writing to.

/// 
/// # Examples
/// 
/// - [\"/aws/lambda/my-function\", \"opentelemetry-service\"]
/// Note: This attribute is experimental and may change in the future.
pub const AWS_LOG_GROUP_NAMES: []const u8 = "aws.log.group.names";

/// The ARN(s) of the AWS log stream(s).

/// 
/// # Examples
/// 
/// - [\"arn:aws:logs:us-west-1:123456789012:log-group:/aws/my/group:log-stream:logs/main/10838bed-421f-43ef-870a-f43feacbbb5b\"]
/// Note: This attribute is experimental and may change in the future.
pub const AWS_LOG_STREAM_ARNS: []const u8 = "aws.log.stream.arns";

/// The name(s) of the AWS log stream(s) an application is writing to.

/// 
/// # Examples
/// 
/// - [\"logs/main/10838bed-421f-43ef-870a-f43feacbbb5b\"]
/// Note: This attribute is experimental and may change in the future.
pub const AWS_LOG_STREAM_NAMES: []const u8 = "aws.log.stream.names";

/// Array of brand name and version separated by a space
/// 
/// # Examples
/// 
/// - [\" Not A;Brand 99\", \"Chromium 99\", \"Chrome 99\"]
/// Note: This attribute is experimental and may change in the future.
pub const BROWSER_BRANDS: []const u8 = "browser.brands";

/// Preferred language of the user using the browser
/// 
/// # Examples
/// 
/// - en
/// - en-US
/// - fr
/// - fr-FR
/// Note: This attribute is experimental and may change in the future.
pub const BROWSER_LANGUAGE: []const u8 = "browser.language";

/// A boolean that is true if the browser is running on a mobile device
/// Note: This attribute is experimental and may change in the future.
pub const BROWSER_MOBILE: []const u8 = "browser.mobile";

/// The platform on which the browser is running
/// 
/// # Examples
/// 
/// - Windows
/// - macOS
/// - Android
/// Note: This attribute is experimental and may change in the future.
pub const BROWSER_PLATFORM: []const u8 = "browser.platform";

/// The human readable name of the pipeline within a CI/CD system.

/// 
/// # Examples
/// 
/// - Build and Test
/// - Lint
/// - Deploy Go Project
/// - deploy_to_environment
/// Note: This attribute is experimental and may change in the future.
pub const CICD_PIPELINE_NAME: []const u8 = "cicd.pipeline.name";

/// The unique identifier of a pipeline run within a CI/CD system.

/// 
/// # Examples
/// 
/// - 120912
/// Note: This attribute is experimental and may change in the future.
pub const CICD_PIPELINE_RUN_ID: []const u8 = "cicd.pipeline.run.id";

/// The [URL](https://wikipedia.org/wiki/URL) of the pipeline run, providing the complete address in order to locate and identify the pipeline run.

/// 
/// # Examples
/// 
/// - https://github.com/open-telemetry/semantic-conventions/actions/runs/9753949763?pr=1075
/// Note: This attribute is experimental and may change in the future.
pub const CICD_PIPELINE_RUN_URL_FULL: []const u8 = "cicd.pipeline.run.url.full";

/// The unique identifier of a worker within a CICD system.
/// 
/// # Examples
/// 
/// - abc123
/// - 10.0.1.2
/// - controller
/// Note: This attribute is experimental and may change in the future.
pub const CICD_WORKER_ID: []const u8 = "cicd.worker.id";

/// The name of a worker within a CICD system.
/// 
/// # Examples
/// 
/// - agent-abc
/// - controller
/// - Ubuntu LTS
/// Note: This attribute is experimental and may change in the future.
pub const CICD_WORKER_NAME: []const u8 = "cicd.worker.name";

/// The [URL](https://wikipedia.org/wiki/URL) of the worker, providing the complete address in order to locate and identify the worker.
/// 
/// # Examples
/// 
/// - https://cicd.example.org/worker/abc123
/// Note: This attribute is experimental and may change in the future.
pub const CICD_WORKER_URL_FULL: []const u8 = "cicd.worker.url.full";

/// The cloud account ID the resource is assigned to.

/// 
/// # Examples
/// 
/// - 111111111111
/// - opentelemetry
/// Note: This attribute is experimental and may change in the future.
pub const CLOUD_ACCOUNT_ID: []const u8 = "cloud.account.id";

/// Cloud regions often have multiple, isolated locations known as zones to increase availability. Availability zone represents the zone where the resource is running.

/// 
/// # Examples
/// 
/// - us-east-1c
/// Note: This attribute is experimental and may change in the future.
pub const CLOUD_AVAILABILITY_ZONE: []const u8 = "cloud.availability_zone";

/// The cloud platform in use.

/// Note: This attribute is experimental and may change in the future.
pub const CLOUD_PLATFORM: []const u8 = "cloud.platform";

/// Name of the cloud provider.

/// Note: This attribute is experimental and may change in the future.
pub const CLOUD_PROVIDER: []const u8 = "cloud.provider";

/// The geographical region within a cloud provider. When associated with a resource, this attribute specifies the region where the resource operates. When calling services or APIs deployed on a cloud, this attribute identifies the region where the called destination is deployed.

/// 
/// # Examples
/// 
/// - us-central1
/// - us-east-1
/// Note: This attribute is experimental and may change in the future.
pub const CLOUD_REGION: []const u8 = "cloud.region";

/// Cloud provider-specific native identifier of the monitored cloud resource (e.g. an [ARN](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html) on AWS, a [fully qualified resource ID](https://learn.microsoft.com/rest/api/resources/resources/get-by-id) on Azure, a [full resource name](https://google.aip.dev/122#full-resource-names) on GCP)

/// 
/// # Examples
/// 
/// - arn:aws:lambda:REGION:ACCOUNT_ID:function:my-function
/// - //run.googleapis.com/projects/PROJECT_ID/locations/LOCATION_ID/services/SERVICE_ID
/// - /subscriptions/<SUBSCRIPTION_GUID>/resourceGroups/<RG>/providers/Microsoft.Web/sites/<FUNCAPP>/functions/<FUNC>
/// Note: This attribute is experimental and may change in the future.
pub const CLOUD_RESOURCE_ID: []const u8 = "cloud.resource_id";

/// The guid of the application.

/// 
/// # Examples
/// 
/// - 218fc5a9-a5f1-4b54-aa05-46717d0ab26d
/// Note: This attribute is experimental and may change in the future.
pub const CLOUDFOUNDRY_APP_ID: []const u8 = "cloudfoundry.app.id";

/// The name of the application.

/// 
/// # Examples
/// 
/// - my-app-name
/// Note: This attribute is experimental and may change in the future.
pub const CLOUDFOUNDRY_APP_NAME: []const u8 = "cloudfoundry.app.name";

/// The guid of the CloudFoundry org the application is running in.

/// 
/// # Examples
/// 
/// - 218fc5a9-a5f1-4b54-aa05-46717d0ab26d
/// Note: This attribute is experimental and may change in the future.
pub const CLOUDFOUNDRY_ORG_ID: []const u8 = "cloudfoundry.org.id";

/// The name of the CloudFoundry organization the app is running in.

/// 
/// # Examples
/// 
/// - my-org-name
/// Note: This attribute is experimental and may change in the future.
pub const CLOUDFOUNDRY_ORG_NAME: []const u8 = "cloudfoundry.org.name";

/// The UID identifying the process.

/// 
/// # Examples
/// 
/// - 218fc5a9-a5f1-4b54-aa05-46717d0ab26d
/// Note: This attribute is experimental and may change in the future.
pub const CLOUDFOUNDRY_PROCESS_ID: []const u8 = "cloudfoundry.process.id";

/// The type of process.

/// 
/// # Examples
/// 
/// - web
/// Note: This attribute is experimental and may change in the future.
pub const CLOUDFOUNDRY_PROCESS_TYPE: []const u8 = "cloudfoundry.process.type";

/// The guid of the CloudFoundry space the application is running in.

/// 
/// # Examples
/// 
/// - 218fc5a9-a5f1-4b54-aa05-46717d0ab26d
/// Note: This attribute is experimental and may change in the future.
pub const CLOUDFOUNDRY_SPACE_ID: []const u8 = "cloudfoundry.space.id";

/// The name of the CloudFoundry space the application is running in.

/// 
/// # Examples
/// 
/// - my-space-name
/// Note: This attribute is experimental and may change in the future.
pub const CLOUDFOUNDRY_SPACE_NAME: []const u8 = "cloudfoundry.space.name";

/// A guid or another name describing the event source.

/// 
/// # Examples
/// 
/// - cf/gorouter
/// Note: This attribute is experimental and may change in the future.
pub const CLOUDFOUNDRY_SYSTEM_ID: []const u8 = "cloudfoundry.system.id";

/// A guid describing the concrete instance of the event source.

/// 
/// # Examples
/// 
/// - 218fc5a9-a5f1-4b54-aa05-46717d0ab26d
/// Note: This attribute is experimental and may change in the future.
pub const CLOUDFOUNDRY_SYSTEM_INSTANCE_ID: []const u8 = "cloudfoundry.system.instance.id";

/// The command used to run the container (i.e. the command name).

/// 
/// # Examples
/// 
/// - otelcontribcol
/// Note: This attribute is experimental and may change in the future.
pub const CONTAINER_COMMAND: []const u8 = "container.command";

/// All the command arguments (including the command/executable itself) run by the container.

/// 
/// # Examples
/// 
/// - [\"otelcontribcol\", \"--config\", \"config.yaml\"]
/// Note: This attribute is experimental and may change in the future.
pub const CONTAINER_COMMAND_ARGS: []const u8 = "container.command_args";

/// The full command run by the container as a single string representing the full command.

/// 
/// # Examples
/// 
/// - otelcontribcol --config config.yaml
/// Note: This attribute is experimental and may change in the future.
pub const CONTAINER_COMMAND_LINE: []const u8 = "container.command_line";

/// Container ID. Usually a UUID, as for example used to [identify Docker containers](https://docs.docker.com/engine/containers/run/#container-identification). The UUID might be abbreviated.

/// 
/// # Examples
/// 
/// - a3bf90e006b2
/// Note: This attribute is experimental and may change in the future.
pub const CONTAINER_ID: []const u8 = "container.id";

/// Runtime specific image identifier. Usually a hash algorithm followed by a UUID.

/// 
/// # Examples
/// 
/// - sha256:19c92d0a00d1b66d897bceaa7319bee0dd38a10a851c60bcec9474aa3f01e50f
/// Note: This attribute is experimental and may change in the future.
pub const CONTAINER_IMAGE_ID: []const u8 = "container.image.id";

/// Name of the image the container was built on.

/// 
/// # Examples
/// 
/// - gcr.io/opentelemetry/operator
/// Note: This attribute is experimental and may change in the future.
pub const CONTAINER_IMAGE_NAME: []const u8 = "container.image.name";

/// Repo digests of the container image as provided by the container runtime.

/// 
/// # Examples
/// 
/// - [\"example@sha256:afcc7f1ac1b49db317a7196c902e61c6c3c4607d63599ee1a82d702d249a0ccb\", \"internal.registry.example.com:5000/example@sha256:b69959407d21e8a062e0416bf13405bb2b71ed7a84dde4158ebafacfa06f5578\"]
/// Note: This attribute is experimental and may change in the future.
pub const CONTAINER_IMAGE_REPO_DIGESTS: []const u8 = "container.image.repo_digests";

/// Container image tags. An example can be found in [Docker Image Inspect](https://docs.docker.com/engine/api/v1.43/#tag/Image/operation/ImageInspect). Should be only the `<tag>` section of the full name for example from `registry.example.com/my-org/my-image:<tag>`.

/// 
/// # Examples
/// 
/// - [\"v1.27.1\", \"3.5.7-0\"]
/// Note: This attribute is experimental and may change in the future.
pub const CONTAINER_IMAGE_TAGS: []const u8 = "container.image.tags";

/// Container labels, `<key>` being the label name, the value being the label value.

/// 
/// # Examples
/// 
/// - nginx
/// Note: This attribute is experimental and may change in the future.
pub const CONTAINER_LABEL: []const u8 = "container.label";

/// Container name used by container runtime.

/// 
/// # Examples
/// 
/// - opentelemetry-autoconf
/// Note: This attribute is experimental and may change in the future.
pub const CONTAINER_NAME: []const u8 = "container.name";

/// The container runtime managing this container.

/// 
/// # Examples
/// 
/// - docker
/// - containerd
/// - rkt
/// Note: This attribute is experimental and may change in the future.
pub const CONTAINER_RUNTIME: []const u8 = "container.runtime";

/// Name of the [deployment environment](https://wikipedia.org/wiki/Deployment_environment) (aka deployment tier).

/// 
/// # Examples
/// 
/// - staging
/// - production
/// Note: This attribute is experimental and may change in the future.
pub const DEPLOYMENT_ENVIRONMENT_NAME: []const u8 = "deployment.environment.name";

/// A unique identifier representing the device

/// 
/// # Examples
/// 
/// - 123456789012345
/// - 01:23:45:67:89:AB
/// Note: This attribute is experimental and may change in the future.
pub const DEVICE_ID: []const u8 = "device.id";

/// The name of the device manufacturer

/// 
/// # Examples
/// 
/// - Apple
/// - Samsung
/// Note: This attribute is experimental and may change in the future.
pub const DEVICE_MANUFACTURER: []const u8 = "device.manufacturer";

/// The model identifier for the device

/// 
/// # Examples
/// 
/// - iPhone3,4
/// - SM-G920F
/// Note: This attribute is experimental and may change in the future.
pub const DEVICE_MODEL_IDENTIFIER: []const u8 = "device.model.identifier";

/// The marketing name for the device model

/// 
/// # Examples
/// 
/// - iPhone 6s Plus
/// - Samsung Galaxy S6
/// Note: This attribute is experimental and may change in the future.
pub const DEVICE_MODEL_NAME: []const u8 = "device.model.name";

/// The execution environment ID as a string, that will be potentially reused for other invocations to the same function/function version.

/// 
/// # Examples
/// 
/// - 2021/06/28/[$LATEST]2f399eb14537447da05ab2a2e39309de
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_INSTANCE: []const u8 = "faas.instance";

/// The amount of memory available to the serverless function converted to Bytes.

/// 
/// # Examples
/// 
/// - 134217728
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_MAX_MEMORY: []const u8 = "faas.max_memory";

/// The name of the single function that this runtime instance executes.

/// 
/// # Examples
/// 
/// - my-function
/// - myazurefunctionapp/some-function-name
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_NAME: []const u8 = "faas.name";

/// The immutable version of the function being executed.
/// 
/// # Examples
/// 
/// - 26
/// - pinkfroid-00002
/// Note: This attribute is experimental and may change in the future.
pub const FAAS_VERSION: []const u8 = "faas.version";

/// The container within GCP where the AppHub application is defined.

/// 
/// # Examples
/// 
/// - projects/my-container-project
/// Note: This attribute is experimental and may change in the future.
pub const GCP_APPHUB_APPLICATION_CONTAINER: []const u8 = "gcp.apphub.application.container";

/// The name of the application as configured in AppHub.

/// 
/// # Examples
/// 
/// - my-application
/// Note: This attribute is experimental and may change in the future.
pub const GCP_APPHUB_APPLICATION_ID: []const u8 = "gcp.apphub.application.id";

/// The GCP zone or region where the application is defined.

/// 
/// # Examples
/// 
/// - us-central1
/// Note: This attribute is experimental and may change in the future.
pub const GCP_APPHUB_APPLICATION_LOCATION: []const u8 = "gcp.apphub.application.location";

/// Criticality of a service indicates its importance to the business.

/// Note: This attribute is experimental and may change in the future.
pub const GCP_APPHUB_SERVICE_CRITICALITY_TYPE: []const u8 = "gcp.apphub.service.criticality_type";

/// Environment of a service is the stage of a software lifecycle.

/// Note: This attribute is experimental and may change in the future.
pub const GCP_APPHUB_SERVICE_ENVIRONMENT_TYPE: []const u8 = "gcp.apphub.service.environment_type";

/// The name of the service as configured in AppHub.

/// 
/// # Examples
/// 
/// - my-service
/// Note: This attribute is experimental and may change in the future.
pub const GCP_APPHUB_SERVICE_ID: []const u8 = "gcp.apphub.service.id";

/// Criticality of a workload indicates its importance to the business.

/// Note: This attribute is experimental and may change in the future.
pub const GCP_APPHUB_WORKLOAD_CRITICALITY_TYPE: []const u8 = "gcp.apphub.workload.criticality_type";

/// Environment of a workload is the stage of a software lifecycle.

/// Note: This attribute is experimental and may change in the future.
pub const GCP_APPHUB_WORKLOAD_ENVIRONMENT_TYPE: []const u8 = "gcp.apphub.workload.environment_type";

/// The name of the workload as configured in AppHub.

/// 
/// # Examples
/// 
/// - my-workload
/// Note: This attribute is experimental and may change in the future.
pub const GCP_APPHUB_WORKLOAD_ID: []const u8 = "gcp.apphub.workload.id";

/// The name of the Cloud Run [execution](https://cloud.google.com/run/docs/managing/job-executions) being run for the Job, as set by the [`CLOUD_RUN_EXECUTION`](https://cloud.google.com/run/docs/container-contract#jobs-env-vars) environment variable.

/// 
/// # Examples
/// 
/// - job-name-xxxx
/// - sample-job-mdw84
/// Note: This attribute is experimental and may change in the future.
pub const GCP_CLOUD_RUN_JOB_EXECUTION: []const u8 = "gcp.cloud_run.job.execution";

/// The index for a task within an execution as provided by the [`CLOUD_RUN_TASK_INDEX`](https://cloud.google.com/run/docs/container-contract#jobs-env-vars) environment variable.

/// 
/// # Examples
/// 
/// - 0
/// - 1
/// Note: This attribute is experimental and may change in the future.
pub const GCP_CLOUD_RUN_JOB_TASK_INDEX: []const u8 = "gcp.cloud_run.job.task_index";

/// The hostname of a GCE instance. This is the full value of the default or [custom hostname](https://cloud.google.com/compute/docs/instances/custom-hostname-vm).

/// 
/// # Examples
/// 
/// - my-host1234.example.com
/// - sample-vm.us-west1-b.c.my-project.internal
/// Note: This attribute is experimental and may change in the future.
pub const GCP_GCE_INSTANCE_HOSTNAME: []const u8 = "gcp.gce.instance.hostname";

/// The instance name of a GCE instance. This is the value provided by `host.name`, the visible name of the instance in the Cloud Console UI, and the prefix for the default hostname of the instance as defined by the [default internal DNS name](https://cloud.google.com/compute/docs/internal-dns#instance-fully-qualified-domain-names).

/// 
/// # Examples
/// 
/// - instance-1
/// - my-vm-name
/// Note: This attribute is experimental and may change in the future.
pub const GCP_GCE_INSTANCE_NAME: []const u8 = "gcp.gce.instance.name";

/// Unique identifier for the application

/// 
/// # Examples
/// 
/// - 2daa2797-e42b-4624-9322-ec3f968df4da
/// Note: This attribute is experimental and may change in the future.
pub const HEROKU_APP_ID: []const u8 = "heroku.app.id";

/// Commit hash for the current release

/// 
/// # Examples
/// 
/// - e6134959463efd8966b20e75b913cafe3f5ec
/// Note: This attribute is experimental and may change in the future.
pub const HEROKU_RELEASE_COMMIT: []const u8 = "heroku.release.commit";

/// Time and date the release was created

/// 
/// # Examples
/// 
/// - 2022-10-23T18:00:42Z
/// Note: This attribute is experimental and may change in the future.
pub const HEROKU_RELEASE_CREATION_TIMESTAMP: []const u8 = "heroku.release.creation_timestamp";

/// The CPU architecture the host system is running on.

/// Note: This attribute is experimental and may change in the future.
pub const HOST_ARCH: []const u8 = "host.arch";

/// The amount of level 2 memory cache available to the processor (in Bytes).

/// 
/// # Examples
/// 
/// - 12288000
/// Note: This attribute is experimental and may change in the future.
pub const HOST_CPU_CACHE_L2_SIZE: []const u8 = "host.cpu.cache.l2.size";

/// Family or generation of the CPU.

/// 
/// # Examples
/// 
/// - 6
/// - PA-RISC 1.1e
/// Note: This attribute is experimental and may change in the future.
pub const HOST_CPU_FAMILY: []const u8 = "host.cpu.family";

/// Model identifier. It provides more granular information about the CPU, distinguishing it from other CPUs within the same family.

/// 
/// # Examples
/// 
/// - 6
/// - 9000/778/B180L
/// Note: This attribute is experimental and may change in the future.
pub const HOST_CPU_MODEL_ID: []const u8 = "host.cpu.model.id";

/// Model designation of the processor.

/// 
/// # Examples
/// 
/// - 11th Gen Intel(R) Core(TM) i7-1185G7 @ 3.00GHz
/// Note: This attribute is experimental and may change in the future.
pub const HOST_CPU_MODEL_NAME: []const u8 = "host.cpu.model.name";

/// Stepping or core revisions.

/// 
/// # Examples
/// 
/// - 1
/// - r1p1
/// Note: This attribute is experimental and may change in the future.
pub const HOST_CPU_STEPPING: []const u8 = "host.cpu.stepping";

/// Processor manufacturer identifier. A maximum 12-character string.

/// 
/// # Examples
/// 
/// - GenuineIntel
/// Note: This attribute is experimental and may change in the future.
pub const HOST_CPU_VENDOR_ID: []const u8 = "host.cpu.vendor.id";

/// Unique host ID. For Cloud, this must be the instance_id assigned by the cloud provider. For non-containerized systems, this should be the `machine-id`. See the table below for the sources to use to determine the `machine-id` based on operating system.

/// 
/// # Examples
/// 
/// - fdbf79e8af94cb7f9e8df36789187052
/// Note: This attribute is experimental and may change in the future.
pub const HOST_ID: []const u8 = "host.id";

/// VM image ID or host OS image ID. For Cloud, this value is from the provider.

/// 
/// # Examples
/// 
/// - ami-07b06b442921831e5
/// Note: This attribute is experimental and may change in the future.
pub const HOST_IMAGE_ID: []const u8 = "host.image.id";

/// Name of the VM image or OS install the host was instantiated from.

/// 
/// # Examples
/// 
/// - infra-ami-eks-worker-node-7d4ec78312
/// - CentOS-8-x86_64-1905
/// Note: This attribute is experimental and may change in the future.
pub const HOST_IMAGE_NAME: []const u8 = "host.image.name";

/// The version string of the VM image or host OS as defined in [Version Attributes](/docs/resource/README.md#version-attributes).

/// 
/// # Examples
/// 
/// - 0.1
/// Note: This attribute is experimental and may change in the future.
pub const HOST_IMAGE_VERSION: []const u8 = "host.image.version";

/// Available IP addresses of the host, excluding loopback interfaces.

/// 
/// # Examples
/// 
/// - [\"192.168.1.140\", \"fe80::abc2:4a28:737a:609e\"]
/// Note: This attribute is experimental and may change in the future.
pub const HOST_IP: []const u8 = "host.ip";

/// Available MAC addresses of the host, excluding loopback interfaces.

/// 
/// # Examples
/// 
/// - [\"AC-DE-48-23-45-67\", \"AC-DE-48-23-45-67-01-9F\"]
/// Note: This attribute is experimental and may change in the future.
pub const HOST_MAC: []const u8 = "host.mac";

/// Name of the host. On Unix systems, it may contain what the hostname command returns, or the fully qualified hostname, or another name specified by the user.

/// 
/// # Examples
/// 
/// - opentelemetry-test
/// Note: This attribute is experimental and may change in the future.
pub const HOST_NAME: []const u8 = "host.name";

/// Type of host. For Cloud, this must be the machine type.

/// 
/// # Examples
/// 
/// - n1-standard-1
/// Note: This attribute is experimental and may change in the future.
pub const HOST_TYPE: []const u8 = "host.type";

/// The name of the cluster.

/// 
/// # Examples
/// 
/// - opentelemetry-cluster
/// Note: This attribute is experimental and may change in the future.
pub const K8S_CLUSTER_NAME: []const u8 = "k8s.cluster.name";

/// A pseudo-ID for the cluster, set to the UID of the `kube-system` namespace.

/// 
/// # Examples
/// 
/// - 218fc5a9-a5f1-4b54-aa05-46717d0ab26d
/// Note: This attribute is experimental and may change in the future.
pub const K8S_CLUSTER_UID: []const u8 = "k8s.cluster.uid";

/// The name of the Container from Pod specification, must be unique within a Pod. Container runtime usually uses different globally unique name (`container.name`).

/// 
/// # Examples
/// 
/// - redis
/// Note: This attribute is experimental and may change in the future.
pub const K8S_CONTAINER_NAME: []const u8 = "k8s.container.name";

/// Number of times the container was restarted. This attribute can be used to identify a particular container (running or stopped) within a container spec.

/// Note: This attribute is experimental and may change in the future.
pub const K8S_CONTAINER_RESTART_COUNT: []const u8 = "k8s.container.restart_count";

/// Last terminated reason of the Container.

/// 
/// # Examples
/// 
/// - Evicted
/// - Error
/// Note: This attribute is experimental and may change in the future.
pub const K8S_CONTAINER_STATUS_LAST_TERMINATED_REASON: []const u8 = "k8s.container.status.last_terminated_reason";

/// The cronjob annotation placed on the CronJob, the `<key>` being the annotation name, the value being the annotation value.

/// 
/// # Examples
/// 
/// - 4
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_CRONJOB_ANNOTATION: []const u8 = "k8s.cronjob.annotation";

/// The label placed on the CronJob, the `<key>` being the label name, the value being the label value.

/// 
/// # Examples
/// 
/// - weekly
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_CRONJOB_LABEL: []const u8 = "k8s.cronjob.label";

/// The name of the CronJob.

/// 
/// # Examples
/// 
/// - opentelemetry
/// Note: This attribute is experimental and may change in the future.
pub const K8S_CRONJOB_NAME: []const u8 = "k8s.cronjob.name";

/// The UID of the CronJob.

/// 
/// # Examples
/// 
/// - 275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
/// Note: This attribute is experimental and may change in the future.
pub const K8S_CRONJOB_UID: []const u8 = "k8s.cronjob.uid";

/// The annotation placed on the DaemonSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// # Examples
/// 
/// - 1
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_DAEMONSET_ANNOTATION: []const u8 = "k8s.daemonset.annotation";

/// The label placed on the DaemonSet, the `<key>` being the label name, the value being the label value, even if the value is empty.

/// 
/// # Examples
/// 
/// - guestbook
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_DAEMONSET_LABEL: []const u8 = "k8s.daemonset.label";

/// The name of the DaemonSet.

/// 
/// # Examples
/// 
/// - opentelemetry
/// Note: This attribute is experimental and may change in the future.
pub const K8S_DAEMONSET_NAME: []const u8 = "k8s.daemonset.name";

/// The UID of the DaemonSet.

/// 
/// # Examples
/// 
/// - 275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
/// Note: This attribute is experimental and may change in the future.
pub const K8S_DAEMONSET_UID: []const u8 = "k8s.daemonset.uid";

/// The annotation placed on the Deployment, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// # Examples
/// 
/// - 1
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_DEPLOYMENT_ANNOTATION: []const u8 = "k8s.deployment.annotation";

/// The label placed on the Deployment, the `<key>` being the label name, the value being the label value, even if the value is empty.

/// 
/// # Examples
/// 
/// - guestbook
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_DEPLOYMENT_LABEL: []const u8 = "k8s.deployment.label";

/// The name of the Deployment.

/// 
/// # Examples
/// 
/// - opentelemetry
/// Note: This attribute is experimental and may change in the future.
pub const K8S_DEPLOYMENT_NAME: []const u8 = "k8s.deployment.name";

/// The UID of the Deployment.

/// 
/// # Examples
/// 
/// - 275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
/// Note: This attribute is experimental and may change in the future.
pub const K8S_DEPLOYMENT_UID: []const u8 = "k8s.deployment.uid";

/// The name of the horizontal pod autoscaler.

/// 
/// # Examples
/// 
/// - opentelemetry
/// Note: This attribute is experimental and may change in the future.
pub const K8S_HPA_NAME: []const u8 = "k8s.hpa.name";

/// The API version of the target resource to scale for the HorizontalPodAutoscaler.

/// 
/// # Examples
/// 
/// - apps/v1
/// - autoscaling/v2
/// Note: This attribute is experimental and may change in the future.
pub const K8S_HPA_SCALETARGETREF_API_VERSION: []const u8 = "k8s.hpa.scaletargetref.api_version";

/// The kind of the target resource to scale for the HorizontalPodAutoscaler.

/// 
/// # Examples
/// 
/// - Deployment
/// - StatefulSet
/// Note: This attribute is experimental and may change in the future.
pub const K8S_HPA_SCALETARGETREF_KIND: []const u8 = "k8s.hpa.scaletargetref.kind";

/// The name of the target resource to scale for the HorizontalPodAutoscaler.

/// 
/// # Examples
/// 
/// - my-deployment
/// - my-statefulset
/// Note: This attribute is experimental and may change in the future.
pub const K8S_HPA_SCALETARGETREF_NAME: []const u8 = "k8s.hpa.scaletargetref.name";

/// The UID of the horizontal pod autoscaler.

/// 
/// # Examples
/// 
/// - 275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
/// Note: This attribute is experimental and may change in the future.
pub const K8S_HPA_UID: []const u8 = "k8s.hpa.uid";

/// The annotation placed on the Job, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// # Examples
/// 
/// - 1
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_JOB_ANNOTATION: []const u8 = "k8s.job.annotation";

/// The label placed on the Job, the `<key>` being the label name, the value being the label value, even if the value is empty.

/// 
/// # Examples
/// 
/// - ci
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_JOB_LABEL: []const u8 = "k8s.job.label";

/// The name of the Job.

/// 
/// # Examples
/// 
/// - opentelemetry
/// Note: This attribute is experimental and may change in the future.
pub const K8S_JOB_NAME: []const u8 = "k8s.job.name";

/// The UID of the Job.

/// 
/// # Examples
/// 
/// - 275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
/// Note: This attribute is experimental and may change in the future.
pub const K8S_JOB_UID: []const u8 = "k8s.job.uid";

/// The annotation placed on the Namespace, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// # Examples
/// 
/// - 0
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_NAMESPACE_ANNOTATION: []const u8 = "k8s.namespace.annotation";

/// The label placed on the Namespace, the `<key>` being the label name, the value being the label value, even if the value is empty.

/// 
/// # Examples
/// 
/// - default
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_NAMESPACE_LABEL: []const u8 = "k8s.namespace.label";

/// The name of the namespace that the pod is running in.

/// 
/// # Examples
/// 
/// - default
/// Note: This attribute is experimental and may change in the future.
pub const K8S_NAMESPACE_NAME: []const u8 = "k8s.namespace.name";

/// The annotation placed on the Node, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// # Examples
/// 
/// - 0
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_NODE_ANNOTATION: []const u8 = "k8s.node.annotation";

/// The label placed on the Node, the `<key>` being the label name, the value being the label value, even if the value is empty.

/// 
/// # Examples
/// 
/// - arm64
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_NODE_LABEL: []const u8 = "k8s.node.label";

/// The name of the Node.

/// 
/// # Examples
/// 
/// - node-1
/// Note: This attribute is experimental and may change in the future.
pub const K8S_NODE_NAME: []const u8 = "k8s.node.name";

/// The UID of the Node.

/// 
/// # Examples
/// 
/// - 1eb3a0c6-0477-4080-a9cb-0cb7db65c6a2
/// Note: This attribute is experimental and may change in the future.
pub const K8S_NODE_UID: []const u8 = "k8s.node.uid";

/// The annotation placed on the Pod, the `<key>` being the annotation name, the value being the annotation value.

/// 
/// # Examples
/// 
/// - true
/// - x64
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_POD_ANNOTATION: []const u8 = "k8s.pod.annotation";

/// The label placed on the Pod, the `<key>` being the label name, the value being the label value.

/// 
/// # Examples
/// 
/// - my-app
/// - x64
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_POD_LABEL: []const u8 = "k8s.pod.label";

/// The name of the Pod.

/// 
/// # Examples
/// 
/// - opentelemetry-pod-autoconf
/// Note: This attribute is experimental and may change in the future.
pub const K8S_POD_NAME: []const u8 = "k8s.pod.name";

/// The UID of the Pod.

/// 
/// # Examples
/// 
/// - 275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
/// Note: This attribute is experimental and may change in the future.
pub const K8S_POD_UID: []const u8 = "k8s.pod.uid";

/// The annotation placed on the ReplicaSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// # Examples
/// 
/// - 0
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_REPLICASET_ANNOTATION: []const u8 = "k8s.replicaset.annotation";

/// The label placed on the ReplicaSet, the `<key>` being the label name, the value being the label value, even if the value is empty.

/// 
/// # Examples
/// 
/// - guestbook
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_REPLICASET_LABEL: []const u8 = "k8s.replicaset.label";

/// The name of the ReplicaSet.

/// 
/// # Examples
/// 
/// - opentelemetry
/// Note: This attribute is experimental and may change in the future.
pub const K8S_REPLICASET_NAME: []const u8 = "k8s.replicaset.name";

/// The UID of the ReplicaSet.

/// 
/// # Examples
/// 
/// - 275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
/// Note: This attribute is experimental and may change in the future.
pub const K8S_REPLICASET_UID: []const u8 = "k8s.replicaset.uid";

/// The name of the replication controller.

/// 
/// # Examples
/// 
/// - opentelemetry
/// Note: This attribute is experimental and may change in the future.
pub const K8S_REPLICATIONCONTROLLER_NAME: []const u8 = "k8s.replicationcontroller.name";

/// The UID of the replication controller.

/// 
/// # Examples
/// 
/// - 275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
/// Note: This attribute is experimental and may change in the future.
pub const K8S_REPLICATIONCONTROLLER_UID: []const u8 = "k8s.replicationcontroller.uid";

/// The name of the resource quota.

/// 
/// # Examples
/// 
/// - opentelemetry
/// Note: This attribute is experimental and may change in the future.
pub const K8S_RESOURCEQUOTA_NAME: []const u8 = "k8s.resourcequota.name";

/// The UID of the resource quota.

/// 
/// # Examples
/// 
/// - 275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
/// Note: This attribute is experimental and may change in the future.
pub const K8S_RESOURCEQUOTA_UID: []const u8 = "k8s.resourcequota.uid";

/// The annotation placed on the StatefulSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.

/// 
/// # Examples
/// 
/// - 1
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_STATEFULSET_ANNOTATION: []const u8 = "k8s.statefulset.annotation";

/// The label placed on the StatefulSet, the `<key>` being the label name, the value being the label value, even if the value is empty.

/// 
/// # Examples
/// 
/// - guestbook
/// - 
/// Note: This attribute is experimental and may change in the future.
pub const K8S_STATEFULSET_LABEL: []const u8 = "k8s.statefulset.label";

/// The name of the StatefulSet.

/// 
/// # Examples
/// 
/// - opentelemetry
/// Note: This attribute is experimental and may change in the future.
pub const K8S_STATEFULSET_NAME: []const u8 = "k8s.statefulset.name";

/// The UID of the StatefulSet.

/// 
/// # Examples
/// 
/// - 275ecb36-5aa8-4c2a-9c47-d8bb681b9aff
/// Note: This attribute is experimental and may change in the future.
pub const K8S_STATEFULSET_UID: []const u8 = "k8s.statefulset.uid";

/// Name of the logical partition that hosts a systems with a mainframe operating system.
/// 
/// # Examples
/// 
/// - LPAR01
/// Note: This attribute is experimental and may change in the future.
pub const MAINFRAME_LPAR_NAME: []const u8 = "mainframe.lpar.name";

/// The digest of the OCI image manifest. For container images specifically is the digest by which the container image is known.

/// 
/// # Examples
/// 
/// - sha256:e4ca62c0d62f3e886e684806dfe9d4e0cda60d54986898173c1083856cfda0f4
/// Note: This attribute is experimental and may change in the future.
pub const OCI_MANIFEST_DIGEST: []const u8 = "oci.manifest.digest";

/// Unique identifier for a particular build or compilation of the operating system.
/// 
/// # Examples
/// 
/// - TQ3C.230805.001.B2
/// - 20E247
/// - 22621
/// Note: This attribute is experimental and may change in the future.
pub const OS_BUILD_ID: []const u8 = "os.build_id";

/// Human readable (not intended to be parsed) OS version information, like e.g. reported by `ver` or `lsb_release -a` commands.

/// 
/// # Examples
/// 
/// - Microsoft Windows [Version 10.0.18363.778]
/// - Ubuntu 18.04.1 LTS
/// Note: This attribute is experimental and may change in the future.
pub const OS_DESCRIPTION: []const u8 = "os.description";

/// Human readable operating system name.
/// 
/// # Examples
/// 
/// - iOS
/// - Android
/// - Ubuntu
/// Note: This attribute is experimental and may change in the future.
pub const OS_NAME: []const u8 = "os.name";

/// The operating system type.

/// Note: This attribute is experimental and may change in the future.
pub const OS_TYPE: []const u8 = "os.type";

/// The version string of the operating system as defined in [Version Attributes](/docs/resource/README.md#version-attributes).

/// 
/// # Examples
/// 
/// - 14.2.1
/// - 18.04.1
/// Note: This attribute is experimental and may change in the future.
pub const OS_VERSION: []const u8 = "os.version";

/// The name of the instrumentation scope - (`InstrumentationScope.Name` in OTLP).
/// 
/// # Examples
/// 
/// - io.opentelemetry.contrib.mongodb
pub const OTEL_SCOPE_NAME: []const u8 = "otel.scope.name";

/// The version of the instrumentation scope - (`InstrumentationScope.Version` in OTLP).
/// 
/// # Examples
/// 
/// - 1.0.0
pub const OTEL_SCOPE_VERSION: []const u8 = "otel.scope.version";

/// The command used to launch the process (i.e. the command name). On Linux based systems, can be set to the zeroth string in `proc/[pid]/cmdline`. On Windows, can be set to the first parameter extracted from `GetCommandLineW`.

/// 
/// # Examples
/// 
/// - cmd/otelcol
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_COMMAND: []const u8 = "process.command";

/// All the command arguments (including the command/executable itself) as received by the process. On Linux-based systems (and some other Unixoid systems supporting procfs), can be set according to the list of null-delimited strings extracted from `proc/[pid]/cmdline`. For libc-based executables, this would be the full argv vector passed to `main`. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.

/// 
/// # Examples
/// 
/// - [\"cmd/otecol\", \"--config=config.yaml\"]
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_COMMAND_ARGS: []const u8 = "process.command_args";

/// The full command used to launch the process as a single string representing the full command. On Windows, can be set to the result of `GetCommandLineW`. Do not set this if you have to assemble it just for monitoring; use `process.command_args` instead. SHOULD NOT be collected by default unless there is sanitization that excludes sensitive data.

/// 
/// # Examples
/// 
/// - C:\cmd\otecol --config=\"my directory\config.yaml\"
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_COMMAND_LINE: []const u8 = "process.command_line";

/// The name of the process executable. On Linux based systems, this SHOULD be set to the base name of the target of `/proc/[pid]/exe`. On Windows, this SHOULD be set to the base name of `GetProcessImageFileNameW`.

/// 
/// # Examples
/// 
/// - otelcol
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_EXECUTABLE_NAME: []const u8 = "process.executable.name";

/// The full path to the process executable. On Linux based systems, can be set to the target of `proc/[pid]/exe`. On Windows, can be set to the result of `GetProcessImageFileNameW`.

/// 
/// # Examples
/// 
/// - /usr/bin/cmd/otelcol
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_EXECUTABLE_PATH: []const u8 = "process.executable.path";

/// The control group associated with the process.
/// 
/// # Examples
/// 
/// - 1:name=systemd:/user.slice/user-1000.slice/session-3.scope
/// - 0::/user.slice/user-1000.slice/user@1000.service/tmux-spawn-0267755b-4639-4a27-90ed-f19f88e53748.scope
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_LINUX_CGROUP: []const u8 = "process.linux.cgroup";

/// The username of the user that owns the process.

/// 
/// # Examples
/// 
/// - root
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_OWNER: []const u8 = "process.owner";

/// Parent Process identifier (PPID).

/// 
/// # Examples
/// 
/// - 111
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_PARENT_PID: []const u8 = "process.parent_pid";

/// Process identifier (PID).

/// 
/// # Examples
/// 
/// - 1234
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_PID: []const u8 = "process.pid";

/// An additional description about the runtime of the process, for example a specific vendor customization of the runtime environment.

/// 
/// # Examples
/// 
/// - Eclipse OpenJ9 Eclipse OpenJ9 VM openj9-0.21.0
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_RUNTIME_DESCRIPTION: []const u8 = "process.runtime.description";

/// The name of the runtime of this process.

/// 
/// # Examples
/// 
/// - OpenJDK Runtime Environment
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_RUNTIME_NAME: []const u8 = "process.runtime.name";

/// The version of the runtime of this process, as returned by the runtime without modification.

/// 
/// # Examples
/// 
/// - 14.0.2
/// Note: This attribute is experimental and may change in the future.
pub const PROCESS_RUNTIME_VERSION: []const u8 = "process.runtime.version";

/// The string ID of the service instance.

/// 
/// # Examples
/// 
/// - 627cc493-f310-47de-96bd-71410b7dec09
/// Note: This attribute is experimental and may change in the future.
pub const SERVICE_INSTANCE_ID: []const u8 = "service.instance.id";

/// Logical name of the service.

/// 
/// # Examples
/// 
/// - shoppingcart
pub const SERVICE_NAME: []const u8 = "service.name";

/// A namespace for `service.name`.

/// 
/// # Examples
/// 
/// - Shop
/// Note: This attribute is experimental and may change in the future.
pub const SERVICE_NAMESPACE: []const u8 = "service.namespace";

/// The version string of the service API or implementation. The format is not defined by these conventions.

/// 
/// # Examples
/// 
/// - 2.0.0
/// - a01dbef8a
pub const SERVICE_VERSION: []const u8 = "service.version";

/// The name of the auto instrumentation agent or distribution, if used.

/// 
/// # Examples
/// 
/// - parts-unlimited-java
/// Note: This attribute is experimental and may change in the future.
pub const TELEMETRY_DISTRO_NAME: []const u8 = "telemetry.distro.name";

/// The version string of the auto instrumentation agent or distribution, if used.

/// 
/// # Examples
/// 
/// - 1.2.3
/// Note: This attribute is experimental and may change in the future.
pub const TELEMETRY_DISTRO_VERSION: []const u8 = "telemetry.distro.version";

/// The language of the telemetry SDK.

pub const TELEMETRY_SDK_LANGUAGE: []const u8 = "telemetry.sdk.language";

/// The name of the telemetry SDK as defined above.

/// 
/// # Examples
/// 
/// - opentelemetry
pub const TELEMETRY_SDK_NAME: []const u8 = "telemetry.sdk.name";

/// The version string of the telemetry SDK.

/// 
/// # Examples
/// 
/// - 1.2.3
pub const TELEMETRY_SDK_VERSION: []const u8 = "telemetry.sdk.version";

/// Full user-agent string provided by the browser
/// 
/// # Examples
/// 
/// - Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36
pub const USER_AGENT_ORIGINAL: []const u8 = "user_agent.original";

/// The name of the [reference](https://git-scm.com/docs/gitglossary#def_ref) such as **branch** or **tag** in the repository.

/// 
/// # Examples
/// 
/// - my-feature-branch
/// - tag-1-test
/// Note: This attribute is experimental and may change in the future.
pub const VCS_REF_HEAD_NAME: []const u8 = "vcs.ref.head.name";

/// The revision, literally [revised version](https://www.merriam-webster.com/dictionary/revision), The revision most often refers to a commit object in Git, or a revision number in SVN.

/// 
/// # Examples
/// 
/// - 9d59409acf479dfa0df1aa568182e43e43df8bbe28d60fcf2bc52e30068802cc
/// - main
/// - 123
/// - HEAD
/// Note: This attribute is experimental and may change in the future.
pub const VCS_REF_HEAD_REVISION: []const u8 = "vcs.ref.head.revision";

/// The type of the [reference](https://git-scm.com/docs/gitglossary#def_ref) in the repository.

/// 
/// # Examples
/// 
/// - branch
/// - tag
/// Note: This attribute is experimental and may change in the future.
pub const VCS_REF_TYPE: []const u8 = "vcs.ref.type";

/// The human readable name of the repository. It SHOULD NOT include any additional identifier like Group/SubGroup in GitLab or organization in GitHub.

/// 
/// # Examples
/// 
/// - semantic-conventions
/// - my-cool-repo
/// Note: This attribute is experimental and may change in the future.
pub const VCS_REPOSITORY_NAME: []const u8 = "vcs.repository.name";

/// The [canonical URL](https://support.google.com/webmasters/answer/10347851?hl=en#:~:text=A%20canonical%20URL%20is%20the,Google%20chooses%20one%20as%20canonical.) of the repository providing the complete HTTP(S) address in order to locate and identify the repository through a browser.

/// 
/// # Examples
/// 
/// - https://github.com/opentelemetry/open-telemetry-collector-contrib
/// - https://gitlab.com/my-org/my-project/my-projects-project/repo
/// Note: This attribute is experimental and may change in the future.
pub const VCS_REPOSITORY_URL_FULL: []const u8 = "vcs.repository.url.full";

/// Additional description of the web engine (e.g. detailed version and edition information).

/// 
/// # Examples
/// 
/// - WildFly Full 21.0.0.Final (WildFly Core 13.0.1.Final) - 2.2.2.Final
/// Note: This attribute is experimental and may change in the future.
pub const WEBENGINE_DESCRIPTION: []const u8 = "webengine.description";

/// The name of the web engine.

/// 
/// # Examples
/// 
/// - WildFly
/// Note: This attribute is experimental and may change in the future.
pub const WEBENGINE_NAME: []const u8 = "webengine.name";

/// The version of the web engine.

/// 
/// # Examples
/// 
/// - 21.0.0
/// Note: This attribute is experimental and may change in the future.
pub const WEBENGINE_VERSION: []const u8 = "webengine.version";

/// The System Management Facility (SMF) Identifier uniquely identified a z/OS system within a SYSPLEX or mainframe environment and is used for system and performance analysis.
/// 
/// # Examples
/// 
/// - SYS1
/// Note: This attribute is experimental and may change in the future.
pub const ZOS_SMF_ID: []const u8 = "zos.smf.id";

/// The name of the SYSPLEX to which the z/OS system belongs too.
/// 
/// # Examples
/// 
/// - SYSPLEX1
/// Note: This attribute is experimental and may change in the future.
pub const ZOS_SYSPLEX_NAME: []const u8 = "zos.sysplex.name";


test "semantic resource attributes" {
    @import("std").testing.refAllDecls(@This());
}