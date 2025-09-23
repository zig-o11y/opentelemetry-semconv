//! Generated from registry.yaml
//! Namespace: k8s
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

/// Kubernetes resource attributes.
/// Display name: Kubernetes Attributes
pub const volumeTypeValue = enum {
    /// A [persistentVolumeClaim](https://v1-30.docs.kubernetes.io/docs/concepts/storage/volumes/#persistentvolumeclaim) volume
    persistent_volume_claim,
    /// A [configMap](https://v1-30.docs.kubernetes.io/docs/concepts/storage/volumes/#configmap) volume
    config_map,
    /// A [downwardAPI](https://v1-30.docs.kubernetes.io/docs/concepts/storage/volumes/#downwardapi) volume
    downward_api,
    /// An [emptyDir](https://v1-30.docs.kubernetes.io/docs/concepts/storage/volumes/#emptydir) volume
    empty_dir,
    /// A [secret](https://v1-30.docs.kubernetes.io/docs/concepts/storage/volumes/#secret) volume
    secret,
    /// A [local](https://v1-30.docs.kubernetes.io/docs/concepts/storage/volumes/#local) volume
    local,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .persistent_volume_claim => "persistentVolumeClaim",
            .config_map => "configMap",
            .downward_api => "downwardAPI",
            .empty_dir => "emptyDir",
            .secret => "secret",
            .local => "local",
        };
    }
};

pub const namespacePhaseValue = enum {
    /// Active namespace phase as described by [K8s API](https://pkg.go.dev/k8s.io/api@v0.31.3/core/v1#NamespacePhase)
    active,
    /// Terminating namespace phase as described by [K8s API](https://pkg.go.dev/k8s.io/api@v0.31.3/core/v1#NamespacePhase)
    terminating,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .active => "active",
            .terminating => "terminating",
        };
    }
};

pub const nodeConditionTypeValue = enum {
    /// The node is healthy and ready to accept pods
    ready,
    /// Pressure exists on the disk size—that is, if the disk capacity is low
    disk_pressure,
    /// Pressure exists on the node memory—that is, if the node memory is low
    memory_pressure,
    /// Pressure exists on the processes—that is, if there are too many processes on the node
    pid_pressure,
    /// The network for the node is not correctly configured
    network_unavailable,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .ready => "Ready",
            .disk_pressure => "DiskPressure",
            .memory_pressure => "MemoryPressure",
            .pid_pressure => "PIDPressure",
            .network_unavailable => "NetworkUnavailable",
        };
    }
};

pub const nodeConditionStatusValue = enum {
    ///
    condition_true,
    ///
    condition_false,
    ///
    condition_unknown,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .condition_true => "",
            .condition_false => "",
            .condition_unknown => "unknown",
        };
    }
};

pub const containerStatusStateValue = enum {
    /// The container has terminated.
    terminated,
    /// The container is running.
    running,
    /// The container is waiting.
    waiting,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .terminated => "terminated",
            .running => "running",
            .waiting => "waiting",
        };
    }
};

pub const containerStatusReasonValue = enum {
    /// The container is being created.
    container_creating,
    /// The container is in a crash loop back off state.
    crash_loop_back_off,
    /// There was an error creating the container configuration.
    create_container_config_error,
    /// There was an error pulling the container image.
    err_image_pull,
    /// The container image pull is in back off state.
    image_pull_back_off,
    /// The container was killed due to out of memory.
    oom_killed,
    /// The container has completed execution.
    completed,
    /// There was an error with the container.
    @"error",
    /// The container cannot run.
    container_cannot_run,

    pub fn toString(self: @This()) []const u8 {
        return switch (self) {
            .container_creating => "ContainerCreating",
            .crash_loop_back_off => "CrashLoopBackOff",
            .create_container_config_error => "CreateContainerConfigError",
            .err_image_pull => "ErrImagePull",
            .image_pull_back_off => "ImagePullBackOff",
            .oom_killed => "OOMKilled",
            .completed => "Completed",
            .@"error" => "Error",
            .container_cannot_run => "ContainerCannotRun",
        };
    }
};

pub const RegistryK8s = union(enum) {
    /// The name of the cluster.
    clusterName: types.StringAttribute,
    /// A pseudo-ID for the cluster, set to the UID of the `kube-system` namespace.
    clusterUid: types.StringAttribute,
    /// The name of the Node.
    nodeName: types.StringAttribute,
    /// The UID of the Node.
    nodeUid: types.StringAttribute,
    /// The label placed on the Node, the `<key>` being the label name, the value being the label value, even if the value is empty.
    nodeLabel: types.StringAttribute,
    /// The annotation placed on the Node, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    nodeAnnotation: types.StringAttribute,
    /// The name of the namespace that the pod is running in.
    namespaceName: types.StringAttribute,
    /// The label placed on the Namespace, the `<key>` being the label name, the value being the label value, even if the value is empty.
    namespaceLabel: types.StringAttribute,
    /// The annotation placed on the Namespace, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    namespaceAnnotation: types.StringAttribute,
    /// The UID of the Pod.
    podUid: types.StringAttribute,
    /// The name of the Pod.
    podName: types.StringAttribute,
    /// The label placed on the Pod, the `<key>` being the label name, the value being the label value.
    podLabel: types.StringAttribute,
    /// The annotation placed on the Pod, the `<key>` being the annotation name, the value being the annotation value.
    podAnnotation: types.StringAttribute,
    /// The name of the Container from Pod specification, must be unique within a Pod. Container runtime usually uses different globally unique name (`container.name`).
    containerName: types.StringAttribute,
    /// Number of times the container was restarted. This attribute can be used to identify a particular container (running or stopped) within a container spec.
    containerRestartCount: types.StringAttribute,
    /// Last terminated reason of the Container.
    containerStatusLastTerminatedReason: types.StringAttribute,
    /// The UID of the ReplicaSet.
    replicasetUid: types.StringAttribute,
    /// The name of the ReplicaSet.
    replicasetName: types.StringAttribute,
    /// The label placed on the ReplicaSet, the `<key>` being the label name, the value being the label value, even if the value is empty.
    replicasetLabel: types.StringAttribute,
    /// The annotation placed on the ReplicaSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    replicasetAnnotation: types.StringAttribute,
    /// The UID of the replication controller.
    replicationcontrollerUid: types.StringAttribute,
    /// The name of the replication controller.
    replicationcontrollerName: types.StringAttribute,
    /// The UID of the resource quota.
    resourcequotaUid: types.StringAttribute,
    /// The name of the resource quota.
    resourcequotaName: types.StringAttribute,
    /// The UID of the Deployment.
    deploymentUid: types.StringAttribute,
    /// The name of the Deployment.
    deploymentName: types.StringAttribute,
    /// The label placed on the Deployment, the `<key>` being the label name, the value being the label value, even if the value is empty.
    deploymentLabel: types.StringAttribute,
    /// The annotation placed on the Deployment, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    deploymentAnnotation: types.StringAttribute,
    /// The UID of the StatefulSet.
    statefulsetUid: types.StringAttribute,
    /// The name of the StatefulSet.
    statefulsetName: types.StringAttribute,
    /// The label placed on the StatefulSet, the `<key>` being the label name, the value being the label value, even if the value is empty.
    statefulsetLabel: types.StringAttribute,
    /// The annotation placed on the StatefulSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    statefulsetAnnotation: types.StringAttribute,
    /// The UID of the DaemonSet.
    daemonsetUid: types.StringAttribute,
    /// The name of the DaemonSet.
    daemonsetName: types.StringAttribute,
    /// The label placed on the DaemonSet, the `<key>` being the label name, the value being the label value, even if the value is empty.
    daemonsetLabel: types.StringAttribute,
    /// The annotation placed on the DaemonSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    daemonsetAnnotation: types.StringAttribute,
    /// The UID of the horizontal pod autoscaler.
    hpaUid: types.StringAttribute,
    /// The name of the horizontal pod autoscaler.
    hpaName: types.StringAttribute,
    /// The kind of the target resource to scale for the HorizontalPodAutoscaler.
    hpaScaletargetrefKind: types.StringAttribute,
    /// The name of the target resource to scale for the HorizontalPodAutoscaler.
    hpaScaletargetrefName: types.StringAttribute,
    /// The API version of the target resource to scale for the HorizontalPodAutoscaler.
    hpaScaletargetrefApiVersion: types.StringAttribute,
    /// The type of metric source for the horizontal pod autoscaler.
    hpaMetricType: types.StringAttribute,
    /// The UID of the Job.
    jobUid: types.StringAttribute,
    /// The name of the Job.
    jobName: types.StringAttribute,
    /// The label placed on the Job, the `<key>` being the label name, the value being the label value, even if the value is empty.
    jobLabel: types.StringAttribute,
    /// The annotation placed on the Job, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    jobAnnotation: types.StringAttribute,
    /// The UID of the CronJob.
    cronjobUid: types.StringAttribute,
    /// The name of the CronJob.
    cronjobName: types.StringAttribute,
    /// The label placed on the CronJob, the `<key>` being the label name, the value being the label value.
    cronjobLabel: types.StringAttribute,
    /// The cronjob annotation placed on the CronJob, the `<key>` being the annotation name, the value being the annotation value.
    cronjobAnnotation: types.StringAttribute,
    /// The name of the K8s volume.
    volumeName: types.StringAttribute,
    /// The type of the K8s volume.
    volumeType: types.EnumAttribute(volumeTypeValue),
    /// The phase of the K8s namespace.
    namespacePhase: types.EnumAttribute(namespacePhaseValue),
    /// The condition type of a K8s Node.
    nodeConditionType: types.EnumAttribute(nodeConditionTypeValue),
    /// The status of the condition, one of True, False, Unknown.
    nodeConditionStatus: types.EnumAttribute(nodeConditionStatusValue),
    /// The state of the container. [K8s ContainerState](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/
    containerStatusState: types.EnumAttribute(containerStatusStateValue),
    /// The reason for the container state. Corresponds to the `reason` field of the: [K8s ContainerStateWaiting](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/ or [K8s ContainerStateTerminated](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/
    containerStatusReason: types.EnumAttribute(containerStatusReasonValue),
    /// The size (identifier) of the K8s huge page.
    hugepageSize: types.StringAttribute,
    /// The name of K8s [StorageClass](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/ object.
    storageclassName: types.StringAttribute,
    /// The name of the K8s resource a resource quota defines.
    resourcequotaResourceName: types.StringAttribute,

    /// Extract attribute information from this union variant
    pub fn get(self: @This()) types.AttributeInfo {
        return switch (self) {
            .clusterName => types.AttributeInfo{
                .name = "k8s.cluster.name",
                .brief = "The name of the cluster.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "opentelemetry-cluster"
                },
            },
            .clusterUid => types.AttributeInfo{
                .name = "k8s.cluster.uid",
                .brief = "A pseudo-ID for the cluster, set to the UID of the `kube-system` namespace.",
                .note = "K8s doesn't have support for obtaining a cluster ID. If this is ever\nadded, we will recommend collecting the `k8s.cluster.uid` through the\nofficial APIs. In the meantime, we are able to use the `uid` of the\n`kube-system` namespace as a proxy for cluster ID. Read on for the\nrationale.\n\nEvery object created in a K8s cluster is assigned a distinct UID. The\n`kube-system` namespace is used by Kubernetes itself and will exist\nfor the lifetime of the cluster. Using the `uid` of the `kube-system`\nnamespace is a reasonable proxy for the K8s ClusterID as it will only\nchange if the cluster is rebuilt. Furthermore, Kubernetes UIDs are\nUUIDs as standardized by\n[ISO/IEC 9834-8 and ITU-T X.667](https://www.itu.int/ITU-T/studygroups/com17/oid.html).\nWhich states:\n\n> If generated according to one of the mechanisms defined in Rec.\n> ITU-T X.667 | ISO/IEC 9834-8, a UUID is either guaranteed to be\n> different from all other UUIDs generated before 3603 A.D., or is\n> extremely likely to be different (depending on the mechanism chosen).\n\nTherefore, UIDs between clusters should be extremely unlikely to\nconflict.",
                .stability = .development,
                .examples = &.{
                    "218fc5a9-a5f1-4b54-aa05-46717d0ab26d"
                },
            },
            .nodeName => types.AttributeInfo{
                .name = "k8s.node.name",
                .brief = "The name of the Node.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "node-1"
                },
            },
            .nodeUid => types.AttributeInfo{
                .name = "k8s.node.uid",
                .brief = "The UID of the Node.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "1eb3a0c6-0477-4080-a9cb-0cb7db65c6a2"
                },
            },
            .nodeLabel => types.AttributeInfo{
                .name = "k8s.node.label",
                .brief = "The label placed on the Node, the `<key>` being the label name, the value being the label value, even if the value is empty.",
                .note = "Examples:\n\n- A label `kubernetes.io/arch` with value `arm64` SHOULD be recorded\nas the `k8s.node.label.kubernetes.io/arch` attribute with value `\"arm64\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.node.label.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "arm64",
                    ""
                },
            },
            .nodeAnnotation => types.AttributeInfo{
                .name = "k8s.node.annotation",
                .brief = "The annotation placed on the Node, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
                .note = "Examples:\n\n- An annotation `node.alpha.kubernetes.io/ttl` with value `0` SHOULD be recorded as\nthe `k8s.node.annotation.node.alpha.kubernetes.io/ttl` attribute with value `\"0\"`.\n- An annotation `data` with empty string value SHOULD be recorded as\nthe `k8s.node.annotation.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "0",
                    ""
                },
            },
            .namespaceName => types.AttributeInfo{
                .name = "k8s.namespace.name",
                .brief = "The name of the namespace that the pod is running in.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "default"
                },
            },
            .namespaceLabel => types.AttributeInfo{
                .name = "k8s.namespace.label",
                .brief = "The label placed on the Namespace, the `<key>` being the label name, the value being the label value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `kubernetes.io/metadata.name` with value `default` SHOULD be recorded\nas the `k8s.namespace.label.kubernetes.io/metadata.name` attribute with value `\"default\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.namespace.label.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "default",
                    ""
                },
            },
            .namespaceAnnotation => types.AttributeInfo{
                .name = "k8s.namespace.annotation",
                .brief = "The annotation placed on the Namespace, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `ttl` with value `0` SHOULD be recorded\nas the `k8s.namespace.annotation.ttl` attribute with value `\"0\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.namespace.annotation.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "0",
                    ""
                },
            },
            .podUid => types.AttributeInfo{
                .name = "k8s.pod.uid",
                .brief = "The UID of the Pod.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "275ecb36-5aa8-4c2a-9c47-d8bb681b9aff"
                },
            },
            .podName => types.AttributeInfo{
                .name = "k8s.pod.name",
                .brief = "The name of the Pod.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "opentelemetry-pod-autoconf"
                },
            },
            .podLabel => types.AttributeInfo{
                .name = "k8s.pod.label",
                .brief = "The label placed on the Pod, the `<key>` being the label name, the value being the label value.",
                .note = "Examples:\n\n- A label `app` with value `my-app` SHOULD be recorded as\nthe `k8s.pod.label.app` attribute with value `\"my-app\"`.\n- A label `mycompany.io/arch` with value `x64` SHOULD be recorded as\nthe `k8s.pod.label.mycompany.io/arch` attribute with value `\"x64\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.pod.label.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "my-app",
                    "x64",
                    ""
                },
            },
            .podAnnotation => types.AttributeInfo{
                .name = "k8s.pod.annotation",
                .brief = "The annotation placed on the Pod, the `<key>` being the annotation name, the value being the annotation value.",
                .note = "Examples:\n\n- An annotation `kubernetes.io/enforce-mountable-secrets` with value `true` SHOULD be recorded as\nthe `k8s.pod.annotation.kubernetes.io/enforce-mountable-secrets` attribute with value `\"true\"`.\n- An annotation `mycompany.io/arch` with value `x64` SHOULD be recorded as\nthe `k8s.pod.annotation.mycompany.io/arch` attribute with value `\"x64\"`.\n- An annotation `data` with empty string value SHOULD be recorded as\nthe `k8s.pod.annotation.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "x64",
                    ""
                },
            },
            .containerName => types.AttributeInfo{
                .name = "k8s.container.name",
                .brief = "The name of the Container from Pod specification, must be unique within a Pod. Container runtime usually uses different globally unique name (`container.name`).",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "redis"
                },
            },
            .containerRestartCount => types.AttributeInfo{
                .name = "k8s.container.restart_count",
                .brief = "Number of times the container was restarted. This attribute can be used to identify a particular container (running or stopped) within a container spec.",
                .note = null,
                .stability = .development,
                .examples = null,
            },
            .containerStatusLastTerminatedReason => types.AttributeInfo{
                .name = "k8s.container.status.last_terminated_reason",
                .brief = "Last terminated reason of the Container.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "Evicted",
                    "Error"
                },
            },
            .replicasetUid => types.AttributeInfo{
                .name = "k8s.replicaset.uid",
                .brief = "The UID of the ReplicaSet.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "275ecb36-5aa8-4c2a-9c47-d8bb681b9aff"
                },
            },
            .replicasetName => types.AttributeInfo{
                .name = "k8s.replicaset.name",
                .brief = "The name of the ReplicaSet.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "opentelemetry"
                },
            },
            .replicasetLabel => types.AttributeInfo{
                .name = "k8s.replicaset.label",
                .brief = "The label placed on the ReplicaSet, the `<key>` being the label name, the value being the label value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `app` with value `guestbook` SHOULD be recorded\nas the `k8s.replicaset.label.app` attribute with value `\"guestbook\"`.\n- A label `injected` with empty string value SHOULD be recorded as\nthe `k8s.replicaset.label.injected` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "guestbook",
                    ""
                },
            },
            .replicasetAnnotation => types.AttributeInfo{
                .name = "k8s.replicaset.annotation",
                .brief = "The annotation placed on the ReplicaSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `replicas` with value `0` SHOULD be recorded\nas the `k8s.replicaset.annotation.replicas` attribute with value `\"0\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.replicaset.annotation.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "0",
                    ""
                },
            },
            .replicationcontrollerUid => types.AttributeInfo{
                .name = "k8s.replicationcontroller.uid",
                .brief = "The UID of the replication controller.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "275ecb36-5aa8-4c2a-9c47-d8bb681b9aff"
                },
            },
            .replicationcontrollerName => types.AttributeInfo{
                .name = "k8s.replicationcontroller.name",
                .brief = "The name of the replication controller.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "opentelemetry"
                },
            },
            .resourcequotaUid => types.AttributeInfo{
                .name = "k8s.resourcequota.uid",
                .brief = "The UID of the resource quota.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "275ecb36-5aa8-4c2a-9c47-d8bb681b9aff"
                },
            },
            .resourcequotaName => types.AttributeInfo{
                .name = "k8s.resourcequota.name",
                .brief = "The name of the resource quota.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "opentelemetry"
                },
            },
            .deploymentUid => types.AttributeInfo{
                .name = "k8s.deployment.uid",
                .brief = "The UID of the Deployment.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "275ecb36-5aa8-4c2a-9c47-d8bb681b9aff"
                },
            },
            .deploymentName => types.AttributeInfo{
                .name = "k8s.deployment.name",
                .brief = "The name of the Deployment.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "opentelemetry"
                },
            },
            .deploymentLabel => types.AttributeInfo{
                .name = "k8s.deployment.label",
                .brief = "The label placed on the Deployment, the `<key>` being the label name, the value being the label value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `replicas` with value `0` SHOULD be recorded\nas the `k8s.deployment.label.app` attribute with value `\"guestbook\"`.\n- A label `injected` with empty string value SHOULD be recorded as\nthe `k8s.deployment.label.injected` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "guestbook",
                    ""
                },
            },
            .deploymentAnnotation => types.AttributeInfo{
                .name = "k8s.deployment.annotation",
                .brief = "The annotation placed on the Deployment, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `replicas` with value `1` SHOULD be recorded\nas the `k8s.deployment.annotation.replicas` attribute with value `\"1\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.deployment.annotation.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "1",
                    ""
                },
            },
            .statefulsetUid => types.AttributeInfo{
                .name = "k8s.statefulset.uid",
                .brief = "The UID of the StatefulSet.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "275ecb36-5aa8-4c2a-9c47-d8bb681b9aff"
                },
            },
            .statefulsetName => types.AttributeInfo{
                .name = "k8s.statefulset.name",
                .brief = "The name of the StatefulSet.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "opentelemetry"
                },
            },
            .statefulsetLabel => types.AttributeInfo{
                .name = "k8s.statefulset.label",
                .brief = "The label placed on the StatefulSet, the `<key>` being the label name, the value being the label value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `replicas` with value `0` SHOULD be recorded\nas the `k8s.statefulset.label.app` attribute with value `\"guestbook\"`.\n- A label `injected` with empty string value SHOULD be recorded as\nthe `k8s.statefulset.label.injected` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "guestbook",
                    ""
                },
            },
            .statefulsetAnnotation => types.AttributeInfo{
                .name = "k8s.statefulset.annotation",
                .brief = "The annotation placed on the StatefulSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `replicas` with value `1` SHOULD be recorded\nas the `k8s.statefulset.annotation.replicas` attribute with value `\"1\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.statefulset.annotation.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "1",
                    ""
                },
            },
            .daemonsetUid => types.AttributeInfo{
                .name = "k8s.daemonset.uid",
                .brief = "The UID of the DaemonSet.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "275ecb36-5aa8-4c2a-9c47-d8bb681b9aff"
                },
            },
            .daemonsetName => types.AttributeInfo{
                .name = "k8s.daemonset.name",
                .brief = "The name of the DaemonSet.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "opentelemetry"
                },
            },
            .daemonsetLabel => types.AttributeInfo{
                .name = "k8s.daemonset.label",
                .brief = "The label placed on the DaemonSet, the `<key>` being the label name, the value being the label value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `app` with value `guestbook` SHOULD be recorded\nas the `k8s.daemonset.label.app` attribute with value `\"guestbook\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.daemonset.label.injected` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "guestbook",
                    ""
                },
            },
            .daemonsetAnnotation => types.AttributeInfo{
                .name = "k8s.daemonset.annotation",
                .brief = "The annotation placed on the DaemonSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `replicas` with value `1` SHOULD be recorded\nas the `k8s.daemonset.annotation.replicas` attribute with value `\"1\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.daemonset.annotation.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "1",
                    ""
                },
            },
            .hpaUid => types.AttributeInfo{
                .name = "k8s.hpa.uid",
                .brief = "The UID of the horizontal pod autoscaler.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "275ecb36-5aa8-4c2a-9c47-d8bb681b9aff"
                },
            },
            .hpaName => types.AttributeInfo{
                .name = "k8s.hpa.name",
                .brief = "The name of the horizontal pod autoscaler.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "opentelemetry"
                },
            },
            .hpaScaletargetrefKind => types.AttributeInfo{
                .name = "k8s.hpa.scaletargetref.kind",
                .brief = "The kind of the target resource to scale for the HorizontalPodAutoscaler.",
                .note = "This maps to the `kind` field in the `scaleTargetRef` of the HPA spec.",
                .stability = .development,
                .examples = &.{
                    "Deployment",
                    "StatefulSet"
                },
            },
            .hpaScaletargetrefName => types.AttributeInfo{
                .name = "k8s.hpa.scaletargetref.name",
                .brief = "The name of the target resource to scale for the HorizontalPodAutoscaler.",
                .note = "This maps to the `name` field in the `scaleTargetRef` of the HPA spec.",
                .stability = .development,
                .examples = &.{
                    "my-deployment",
                    "my-statefulset"
                },
            },
            .hpaScaletargetrefApiVersion => types.AttributeInfo{
                .name = "k8s.hpa.scaletargetref.api_version",
                .brief = "The API version of the target resource to scale for the HorizontalPodAutoscaler.",
                .note = "This maps to the `apiVersion` field in the `scaleTargetRef` of the HPA spec.",
                .stability = .development,
                .examples = &.{
                    "apps/v1",
                    "autoscaling/v2"
                },
            },
            .hpaMetricType => types.AttributeInfo{
                .name = "k8s.hpa.metric.type",
                .brief = "The type of metric source for the horizontal pod autoscaler.",
                .note = "This attribute reflects the `type` field of spec.metrics[] in the HPA.",
                .stability = .development,
                .examples = &.{
                    "Resource",
                    "ContainerResource"
                },
            },
            .jobUid => types.AttributeInfo{
                .name = "k8s.job.uid",
                .brief = "The UID of the Job.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "275ecb36-5aa8-4c2a-9c47-d8bb681b9aff"
                },
            },
            .jobName => types.AttributeInfo{
                .name = "k8s.job.name",
                .brief = "The name of the Job.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "opentelemetry"
                },
            },
            .jobLabel => types.AttributeInfo{
                .name = "k8s.job.label",
                .brief = "The label placed on the Job, the `<key>` being the label name, the value being the label value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `jobtype` with value `ci` SHOULD be recorded\nas the `k8s.job.label.jobtype` attribute with value `\"ci\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.job.label.automated` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "ci",
                    ""
                },
            },
            .jobAnnotation => types.AttributeInfo{
                .name = "k8s.job.annotation",
                .brief = "The annotation placed on the Job, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
                .note = "\nExamples:\n\n- A label `number` with value `1` SHOULD be recorded\nas the `k8s.job.annotation.number` attribute with value `\"1\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.job.annotation.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "1",
                    ""
                },
            },
            .cronjobUid => types.AttributeInfo{
                .name = "k8s.cronjob.uid",
                .brief = "The UID of the CronJob.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "275ecb36-5aa8-4c2a-9c47-d8bb681b9aff"
                },
            },
            .cronjobName => types.AttributeInfo{
                .name = "k8s.cronjob.name",
                .brief = "The name of the CronJob.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "opentelemetry"
                },
            },
            .cronjobLabel => types.AttributeInfo{
                .name = "k8s.cronjob.label",
                .brief = "The label placed on the CronJob, the `<key>` being the label name, the value being the label value.",
                .note = "Examples:\n\n- A label `type` with value `weekly` SHOULD be recorded as the\n`k8s.cronjob.label.type` attribute with value `\"weekly\"`.\n- A label `automated` with empty string value SHOULD be recorded as\nthe `k8s.cronjob.label.automated` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "weekly",
                    ""
                },
            },
            .cronjobAnnotation => types.AttributeInfo{
                .name = "k8s.cronjob.annotation",
                .brief = "The cronjob annotation placed on the CronJob, the `<key>` being the annotation name, the value being the annotation value.",
                .note = "Examples:\n\n- An annotation `retries` with value `4` SHOULD be recorded as the\n`k8s.cronjob.annotation.retries` attribute with value `\"4\"`.\n- An annotation `data` with empty string value SHOULD be recorded as\nthe `k8s.cronjob.annotation.data` attribute with value `\"\"`.",
                .stability = .development,
                .examples = &.{
                    "4",
                    ""
                },
            },
            .volumeName => types.AttributeInfo{
                .name = "k8s.volume.name",
                .brief = "The name of the K8s volume.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "volume0"
                },
            },
            .volumeType => types.AttributeInfo{
                .name = "k8s.volume.type",
                .brief = "The type of the K8s volume.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "emptyDir",
                    "persistentVolumeClaim"
                },
            },
            .namespacePhase => types.AttributeInfo{
                .name = "k8s.namespace.phase",
                .brief = "The phase of the K8s namespace.",
                .note = "This attribute aligns with the `phase` field of the\n[K8s NamespaceStatus](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/",
                .stability = .development,
                .examples = &.{
                    "active",
                    "terminating"
                },
            },
            .nodeConditionType => types.AttributeInfo{
                .name = "k8s.node.condition.type",
                .brief = "The condition type of a K8s Node.",
                .note = "K8s Node conditions as described\nby [K8s documentation](https://v1-32.docs.kubernetes.io/docs/reference/node/node-status/\n\nThis attribute aligns with the `type` field of the\n[NodeCondition](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/\n\nThe set of possible values is not limited to those listed here. Managed Kubernetes environments,\nor custom controllers MAY introduce additional node condition types.\nWhen this occurs, the exact value as reported by the Kubernetes API SHOULD be used.",
                .stability = .development,
                .examples = &.{
                    "Ready",
                    "DiskPressure"
                },
            },
            .nodeConditionStatus => types.AttributeInfo{
                .name = "k8s.node.condition.status",
                .brief = "The status of the condition, one of True, False, Unknown.",
                .note = "This attribute aligns with the `status` field of the\n[NodeCondition](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/",
                .stability = .development,
                .examples = &.{
                    "unknown"
                },
            },
            .containerStatusState => types.AttributeInfo{
                .name = "k8s.container.status.state",
                .brief = "The state of the container. [K8s ContainerState](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/",
                .note = null,
                .stability = .experimental,
                .examples = &.{
                    "terminated",
                    "running",
                    "waiting"
                },
            },
            .containerStatusReason => types.AttributeInfo{
                .name = "k8s.container.status.reason",
                .brief = "The reason for the container state. Corresponds to the `reason` field of the: [K8s ContainerStateWaiting](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/ or [K8s ContainerStateTerminated](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/",
                .note = null,
                .stability = .experimental,
                .examples = &.{
                    "ContainerCreating",
                    "CrashLoopBackOff",
                    "CreateContainerConfigError",
                    "ErrImagePull",
                    "ImagePullBackOff",
                    "OOMKilled",
                    "Completed",
                    "Error",
                    "ContainerCannotRun"
                },
            },
            .hugepageSize => types.AttributeInfo{
                .name = "k8s.hugepage.size",
                .brief = "The size (identifier) of the K8s huge page.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "2Mi"
                },
            },
            .storageclassName => types.AttributeInfo{
                .name = "k8s.storageclass.name",
                .brief = "The name of K8s [StorageClass](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/ object.",
                .note = null,
                .stability = .development,
                .examples = &.{
                    "gold.storageclass.storage.k8s.io"
                },
            },
            .resourcequotaResourceName => types.AttributeInfo{
                .name = "k8s.resourcequota.resource_name",
                .brief = "The name of the K8s resource a resource quota defines.",
                .note = "The value for this attribute can be either the full `count/<resource>[.<group>]` string (e.g., count/deployments.apps, count/pods), or, for certain core Kubernetes resources, just the resource name (e.g., pods, services, configmaps). Both forms are supported by Kubernetes for object count quotas. See [Kubernetes Resource Quotas documentation](https://kubernetes.io/docs/concepts/policy/resource-quotas/ for more details.",
                .stability = .development,
                .examples = &.{
                    "count/replicationcontrollers"
                },
            },
        };
    }
};

