//! Generated from registry.yaml
//! Namespace: k8s
//! This file contains semantic convention registry definitions.

const std = @import("std");
const types = @import("../types.zig");

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

/// The name of the cluster.
pub const k8s_cluster_name = types.StringAttribute{
    .name = "k8s.cluster.name",
    .brief = "The name of the cluster.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// A pseudo-ID for the cluster, set to the UID of the `kube-system` namespace.
pub const k8s_cluster_uid = types.StringAttribute{
    .name = "k8s.cluster.uid",
    .brief = "A pseudo-ID for the cluster, set to the UID of the `kube-system` namespace.",
    .note = "K8s doesn't have support for obtaining a cluster ID. If this is ever\nadded, we will recommend collecting the `k8s.cluster.uid` through the\nofficial APIs. In the meantime, we are able to use the `uid` of the\n`kube-system` namespace as a proxy for cluster ID. Read on for the\nrationale.\n\nEvery object created in a K8s cluster is assigned a distinct UID. The\n`kube-system` namespace is used by Kubernetes itself and will exist\nfor the lifetime of the cluster. Using the `uid` of the `kube-system`\nnamespace is a reasonable proxy for the K8s ClusterID as it will only\nchange if the cluster is rebuilt. Furthermore, Kubernetes UIDs are\nUUIDs as standardized by\n[ISO/IEC 9834-8 and ITU-T X.667](https://www.itu.int/ITU-T/studygroups/com17/oid.html).\nWhich states:\n\n> If generated according to one of the mechanisms defined in Rec.\n> ITU-T X.667 | ISO/IEC 9834-8, a UUID is either guaranteed to be\n> different from all other UUIDs generated before 3603 A.D., or is\n> extremely likely to be different (depending on the mechanism chosen).\n\nTherefore, UIDs between clusters should be extremely unlikely to\nconflict.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the Node.
pub const k8s_node_name = types.StringAttribute{
    .name = "k8s.node.name",
    .brief = "The name of the Node.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID of the Node.
pub const k8s_node_uid = types.StringAttribute{
    .name = "k8s.node.uid",
    .brief = "The UID of the Node.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The label placed on the Node, the `<key>` being the label name, the value being the label value, even if the value is empty.
pub const k8s_node_label = types.StringAttribute{
    .name = "k8s.node.label",
    .brief = "The label placed on the Node, the `<key>` being the label name, the value being the label value, even if the value is empty.",
    .note = "Examples:\n\n- A label `kubernetes.io/arch` with value `arm64` SHOULD be recorded\nas the `k8s.node.label.kubernetes.io/arch` attribute with value `\"arm64\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.node.label.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The annotation placed on the Node, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
pub const k8s_node_annotation = types.StringAttribute{
    .name = "k8s.node.annotation",
    .brief = "The annotation placed on the Node, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
    .note = "Examples:\n\n- An annotation `node.alpha.kubernetes.io/ttl` with value `0` SHOULD be recorded as\nthe `k8s.node.annotation.node.alpha.kubernetes.io/ttl` attribute with value `\"0\"`.\n- An annotation `data` with empty string value SHOULD be recorded as\nthe `k8s.node.annotation.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the namespace that the pod is running in.
pub const k8s_namespace_name = types.StringAttribute{
    .name = "k8s.namespace.name",
    .brief = "The name of the namespace that the pod is running in.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The label placed on the Namespace, the `<key>` being the label name, the value being the label value, even if the value is empty.
pub const k8s_namespace_label = types.StringAttribute{
    .name = "k8s.namespace.label",
    .brief = "The label placed on the Namespace, the `<key>` being the label name, the value being the label value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `kubernetes.io/metadata.name` with value `default` SHOULD be recorded\nas the `k8s.namespace.label.kubernetes.io/metadata.name` attribute with value `\"default\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.namespace.label.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The annotation placed on the Namespace, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
pub const k8s_namespace_annotation = types.StringAttribute{
    .name = "k8s.namespace.annotation",
    .brief = "The annotation placed on the Namespace, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `ttl` with value `0` SHOULD be recorded\nas the `k8s.namespace.annotation.ttl` attribute with value `\"0\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.namespace.annotation.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID of the Pod.
pub const k8s_pod_uid = types.StringAttribute{
    .name = "k8s.pod.uid",
    .brief = "The UID of the Pod.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the Pod.
pub const k8s_pod_name = types.StringAttribute{
    .name = "k8s.pod.name",
    .brief = "The name of the Pod.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The label placed on the Pod, the `<key>` being the label name, the value being the label value.
pub const k8s_pod_label = types.StringAttribute{
    .name = "k8s.pod.label",
    .brief = "The label placed on the Pod, the `<key>` being the label name, the value being the label value.",
    .note = "Examples:\n\n- A label `app` with value `my-app` SHOULD be recorded as\nthe `k8s.pod.label.app` attribute with value `\"my-app\"`.\n- A label `mycompany.io/arch` with value `x64` SHOULD be recorded as\nthe `k8s.pod.label.mycompany.io/arch` attribute with value `\"x64\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.pod.label.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The annotation placed on the Pod, the `<key>` being the annotation name, the value being the annotation value.
pub const k8s_pod_annotation = types.StringAttribute{
    .name = "k8s.pod.annotation",
    .brief = "The annotation placed on the Pod, the `<key>` being the annotation name, the value being the annotation value.",
    .note = "Examples:\n\n- An annotation `kubernetes.io/enforce-mountable-secrets` with value `true` SHOULD be recorded as\nthe `k8s.pod.annotation.kubernetes.io/enforce-mountable-secrets` attribute with value `\"true\"`.\n- An annotation `mycompany.io/arch` with value `x64` SHOULD be recorded as\nthe `k8s.pod.annotation.mycompany.io/arch` attribute with value `\"x64\"`.\n- An annotation `data` with empty string value SHOULD be recorded as\nthe `k8s.pod.annotation.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the Container from Pod specification, must be unique within a Pod. Container runtime usually uses different globally unique name (`container.name`).
pub const k8s_container_name = types.StringAttribute{
    .name = "k8s.container.name",
    .brief = "The name of the Container from Pod specification, must be unique within a Pod. Container runtime usually uses different globally unique name (`container.name`).",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Number of times the container was restarted. This attribute can be used to identify a particular container (running or stopped) within a container spec.
pub const k8s_container_restart_count = types.StringAttribute{
    .name = "k8s.container.restart_count",
    .brief = "Number of times the container was restarted. This attribute can be used to identify a particular container (running or stopped) within a container spec.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// Last terminated reason of the Container.
pub const k8s_container_status_last_terminated_reason = types.StringAttribute{
    .name = "k8s.container.status.last_terminated_reason",
    .brief = "Last terminated reason of the Container.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID of the ReplicaSet.
pub const k8s_replicaset_uid = types.StringAttribute{
    .name = "k8s.replicaset.uid",
    .brief = "The UID of the ReplicaSet.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the ReplicaSet.
pub const k8s_replicaset_name = types.StringAttribute{
    .name = "k8s.replicaset.name",
    .brief = "The name of the ReplicaSet.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The label placed on the ReplicaSet, the `<key>` being the label name, the value being the label value, even if the value is empty.
pub const k8s_replicaset_label = types.StringAttribute{
    .name = "k8s.replicaset.label",
    .brief = "The label placed on the ReplicaSet, the `<key>` being the label name, the value being the label value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `app` with value `guestbook` SHOULD be recorded\nas the `k8s.replicaset.label.app` attribute with value `\"guestbook\"`.\n- A label `injected` with empty string value SHOULD be recorded as\nthe `k8s.replicaset.label.injected` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The annotation placed on the ReplicaSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
pub const k8s_replicaset_annotation = types.StringAttribute{
    .name = "k8s.replicaset.annotation",
    .brief = "The annotation placed on the ReplicaSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `replicas` with value `0` SHOULD be recorded\nas the `k8s.replicaset.annotation.replicas` attribute with value `\"0\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.replicaset.annotation.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID of the replication controller.
pub const k8s_replicationcontroller_uid = types.StringAttribute{
    .name = "k8s.replicationcontroller.uid",
    .brief = "The UID of the replication controller.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the replication controller.
pub const k8s_replicationcontroller_name = types.StringAttribute{
    .name = "k8s.replicationcontroller.name",
    .brief = "The name of the replication controller.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID of the resource quota.
pub const k8s_resourcequota_uid = types.StringAttribute{
    .name = "k8s.resourcequota.uid",
    .brief = "The UID of the resource quota.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the resource quota.
pub const k8s_resourcequota_name = types.StringAttribute{
    .name = "k8s.resourcequota.name",
    .brief = "The name of the resource quota.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID of the Deployment.
pub const k8s_deployment_uid = types.StringAttribute{
    .name = "k8s.deployment.uid",
    .brief = "The UID of the Deployment.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the Deployment.
pub const k8s_deployment_name = types.StringAttribute{
    .name = "k8s.deployment.name",
    .brief = "The name of the Deployment.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The label placed on the Deployment, the `<key>` being the label name, the value being the label value, even if the value is empty.
pub const k8s_deployment_label = types.StringAttribute{
    .name = "k8s.deployment.label",
    .brief = "The label placed on the Deployment, the `<key>` being the label name, the value being the label value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `replicas` with value `0` SHOULD be recorded\nas the `k8s.deployment.label.app` attribute with value `\"guestbook\"`.\n- A label `injected` with empty string value SHOULD be recorded as\nthe `k8s.deployment.label.injected` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The annotation placed on the Deployment, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
pub const k8s_deployment_annotation = types.StringAttribute{
    .name = "k8s.deployment.annotation",
    .brief = "The annotation placed on the Deployment, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `replicas` with value `1` SHOULD be recorded\nas the `k8s.deployment.annotation.replicas` attribute with value `\"1\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.deployment.annotation.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID of the StatefulSet.
pub const k8s_statefulset_uid = types.StringAttribute{
    .name = "k8s.statefulset.uid",
    .brief = "The UID of the StatefulSet.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the StatefulSet.
pub const k8s_statefulset_name = types.StringAttribute{
    .name = "k8s.statefulset.name",
    .brief = "The name of the StatefulSet.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The label placed on the StatefulSet, the `<key>` being the label name, the value being the label value, even if the value is empty.
pub const k8s_statefulset_label = types.StringAttribute{
    .name = "k8s.statefulset.label",
    .brief = "The label placed on the StatefulSet, the `<key>` being the label name, the value being the label value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `replicas` with value `0` SHOULD be recorded\nas the `k8s.statefulset.label.app` attribute with value `\"guestbook\"`.\n- A label `injected` with empty string value SHOULD be recorded as\nthe `k8s.statefulset.label.injected` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The annotation placed on the StatefulSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
pub const k8s_statefulset_annotation = types.StringAttribute{
    .name = "k8s.statefulset.annotation",
    .brief = "The annotation placed on the StatefulSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `replicas` with value `1` SHOULD be recorded\nas the `k8s.statefulset.annotation.replicas` attribute with value `\"1\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.statefulset.annotation.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID of the DaemonSet.
pub const k8s_daemonset_uid = types.StringAttribute{
    .name = "k8s.daemonset.uid",
    .brief = "The UID of the DaemonSet.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the DaemonSet.
pub const k8s_daemonset_name = types.StringAttribute{
    .name = "k8s.daemonset.name",
    .brief = "The name of the DaemonSet.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The label placed on the DaemonSet, the `<key>` being the label name, the value being the label value, even if the value is empty.
pub const k8s_daemonset_label = types.StringAttribute{
    .name = "k8s.daemonset.label",
    .brief = "The label placed on the DaemonSet, the `<key>` being the label name, the value being the label value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `app` with value `guestbook` SHOULD be recorded\nas the `k8s.daemonset.label.app` attribute with value `\"guestbook\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.daemonset.label.injected` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The annotation placed on the DaemonSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
pub const k8s_daemonset_annotation = types.StringAttribute{
    .name = "k8s.daemonset.annotation",
    .brief = "The annotation placed on the DaemonSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `replicas` with value `1` SHOULD be recorded\nas the `k8s.daemonset.annotation.replicas` attribute with value `\"1\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.daemonset.annotation.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID of the horizontal pod autoscaler.
pub const k8s_hpa_uid = types.StringAttribute{
    .name = "k8s.hpa.uid",
    .brief = "The UID of the horizontal pod autoscaler.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the horizontal pod autoscaler.
pub const k8s_hpa_name = types.StringAttribute{
    .name = "k8s.hpa.name",
    .brief = "The name of the horizontal pod autoscaler.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The kind of the target resource to scale for the HorizontalPodAutoscaler.
pub const k8s_hpa_scaletargetref_kind = types.StringAttribute{
    .name = "k8s.hpa.scaletargetref.kind",
    .brief = "The kind of the target resource to scale for the HorizontalPodAutoscaler.",
    .note = "This maps to the `kind` field in the `scaleTargetRef` of the HPA spec.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the target resource to scale for the HorizontalPodAutoscaler.
pub const k8s_hpa_scaletargetref_name = types.StringAttribute{
    .name = "k8s.hpa.scaletargetref.name",
    .brief = "The name of the target resource to scale for the HorizontalPodAutoscaler.",
    .note = "This maps to the `name` field in the `scaleTargetRef` of the HPA spec.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The API version of the target resource to scale for the HorizontalPodAutoscaler.
pub const k8s_hpa_scaletargetref_api_version = types.StringAttribute{
    .name = "k8s.hpa.scaletargetref.api_version",
    .brief = "The API version of the target resource to scale for the HorizontalPodAutoscaler.",
    .note = "This maps to the `apiVersion` field in the `scaleTargetRef` of the HPA spec.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The type of metric source for the horizontal pod autoscaler.
pub const k8s_hpa_metric_type = types.StringAttribute{
    .name = "k8s.hpa.metric.type",
    .brief = "The type of metric source for the horizontal pod autoscaler.",
    .note = "This attribute reflects the `type` field of spec.metrics[] in the HPA.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID of the Job.
pub const k8s_job_uid = types.StringAttribute{
    .name = "k8s.job.uid",
    .brief = "The UID of the Job.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the Job.
pub const k8s_job_name = types.StringAttribute{
    .name = "k8s.job.name",
    .brief = "The name of the Job.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The label placed on the Job, the `<key>` being the label name, the value being the label value, even if the value is empty.
pub const k8s_job_label = types.StringAttribute{
    .name = "k8s.job.label",
    .brief = "The label placed on the Job, the `<key>` being the label name, the value being the label value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `jobtype` with value `ci` SHOULD be recorded\nas the `k8s.job.label.jobtype` attribute with value `\"ci\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.job.label.automated` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The annotation placed on the Job, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
pub const k8s_job_annotation = types.StringAttribute{
    .name = "k8s.job.annotation",
    .brief = "The annotation placed on the Job, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.",
    .note = "\nExamples:\n\n- A label `number` with value `1` SHOULD be recorded\nas the `k8s.job.annotation.number` attribute with value `\"1\"`.\n- A label `data` with empty string value SHOULD be recorded as\nthe `k8s.job.annotation.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The UID of the CronJob.
pub const k8s_cronjob_uid = types.StringAttribute{
    .name = "k8s.cronjob.uid",
    .brief = "The UID of the CronJob.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the CronJob.
pub const k8s_cronjob_name = types.StringAttribute{
    .name = "k8s.cronjob.name",
    .brief = "The name of the CronJob.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The label placed on the CronJob, the `<key>` being the label name, the value being the label value.
pub const k8s_cronjob_label = types.StringAttribute{
    .name = "k8s.cronjob.label",
    .brief = "The label placed on the CronJob, the `<key>` being the label name, the value being the label value.",
    .note = "Examples:\n\n- A label `type` with value `weekly` SHOULD be recorded as the\n`k8s.cronjob.label.type` attribute with value `\"weekly\"`.\n- A label `automated` with empty string value SHOULD be recorded as\nthe `k8s.cronjob.label.automated` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The cronjob annotation placed on the CronJob, the `<key>` being the annotation name, the value being the annotation value.
pub const k8s_cronjob_annotation = types.StringAttribute{
    .name = "k8s.cronjob.annotation",
    .brief = "The cronjob annotation placed on the CronJob, the `<key>` being the annotation name, the value being the annotation value.",
    .note = "Examples:\n\n- An annotation `retries` with value `4` SHOULD be recorded as the\n`k8s.cronjob.annotation.retries` attribute with value `\"4\"`.\n- An annotation `data` with empty string value SHOULD be recorded as\nthe `k8s.cronjob.annotation.data` attribute with value `\"\"`.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the K8s volume.
pub const k8s_volume_name = types.StringAttribute{
    .name = "k8s.volume.name",
    .brief = "The name of the K8s volume.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The type of the K8s volume.
pub const k8s_volume_type = types.EnumAttribute(volumeTypeValue){
    .base = types.StringAttribute{
        .name = "k8s.volume.type",
        .brief = "The type of the K8s volume.",
        .note = null,
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = volumeTypeValue.persistent_volume_claim,
};

/// The phase of the K8s namespace.
pub const k8s_namespace_phase = types.EnumAttribute(namespacePhaseValue){
    .base = types.StringAttribute{
        .name = "k8s.namespace.phase",
        .brief = "The phase of the K8s namespace.",
        .note = "This attribute aligns with the `phase` field of the\n[K8s NamespaceStatus](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/",
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = namespacePhaseValue.active,
};

/// The condition type of a K8s Node.
pub const k8s_node_condition_type = types.EnumAttribute(nodeConditionTypeValue){
    .base = types.StringAttribute{
        .name = "k8s.node.condition.type",
        .brief = "The condition type of a K8s Node.",
        .note = "K8s Node conditions as described\nby [K8s documentation](https://v1-32.docs.kubernetes.io/docs/reference/node/node-status/\n\nThis attribute aligns with the `type` field of the\n[NodeCondition](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/\n\nThe set of possible values is not limited to those listed here. Managed Kubernetes environments,\nor custom controllers MAY introduce additional node condition types.\nWhen this occurs, the exact value as reported by the Kubernetes API SHOULD be used.",
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = nodeConditionTypeValue.ready,
};

/// The status of the condition, one of True, False, Unknown.
pub const k8s_node_condition_status = types.EnumAttribute(nodeConditionStatusValue){
    .base = types.StringAttribute{
        .name = "k8s.node.condition.status",
        .brief = "The status of the condition, one of True, False, Unknown.",
        .note = "This attribute aligns with the `status` field of the\n[NodeCondition](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/",
        .stability = .development,
        .requirement_level = .recommended,
    },
    .well_known_values = nodeConditionStatusValue.condition_true,
};

/// The state of the container. [K8s ContainerState](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/
pub const k8s_container_status_state = types.EnumAttribute(containerStatusStateValue){
    .base = types.StringAttribute{
        .name = "k8s.container.status.state",
        .brief = "The state of the container. [K8s ContainerState](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/",
        .note = null,
        .stability = .experimental,
        .requirement_level = .recommended,
    },
    .well_known_values = containerStatusStateValue.terminated,
};

/// The reason for the container state. Corresponds to the `reason` field of the: [K8s ContainerStateWaiting](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/ or [K8s ContainerStateTerminated](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/
pub const k8s_container_status_reason = types.EnumAttribute(containerStatusReasonValue){
    .base = types.StringAttribute{
        .name = "k8s.container.status.reason",
        .brief = "The reason for the container state. Corresponds to the `reason` field of the: [K8s ContainerStateWaiting](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/ or [K8s ContainerStateTerminated](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/",
        .note = null,
        .stability = .experimental,
        .requirement_level = .recommended,
    },
    .well_known_values = containerStatusReasonValue.container_creating,
};

/// The size (identifier) of the K8s huge page.
pub const k8s_hugepage_size = types.StringAttribute{
    .name = "k8s.hugepage.size",
    .brief = "The size (identifier) of the K8s huge page.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of K8s [StorageClass](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/ object.
pub const k8s_storageclass_name = types.StringAttribute{
    .name = "k8s.storageclass.name",
    .brief = "The name of K8s [StorageClass](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/ object.",
    .note = null,
    .stability = .development,
    .requirement_level = .recommended,
};

/// The name of the K8s resource a resource quota defines.
pub const k8s_resourcequota_resource_name = types.StringAttribute{
    .name = "k8s.resourcequota.resource_name",
    .brief = "The name of the K8s resource a resource quota defines.",
    .note = "The value for this attribute can be either the full `count/<resource>[.<group>]` string (e.g., count/deployments.apps, count/pods), or, for certain core Kubernetes resources, just the resource name (e.g., pods, services, configmaps). Both forms are supported by Kubernetes for object count quotas. See [Kubernetes Resource Quotas documentation](https://kubernetes.io/docs/concepts/policy/resource-quotas/ for more details.",
    .stability = .development,
    .requirement_level = .recommended,
};

/// Kubernetes resource attributes.
/// Display name: Kubernetes Attributes
pub const Registry = struct {
    /// The name of the cluster.
    pub const clusterName = k8s_cluster_name;
    /// A pseudo-ID for the cluster, set to the UID of the `kube-system` namespace.
    pub const clusterUid = k8s_cluster_uid;
    /// The name of the Node.
    pub const nodeName = k8s_node_name;
    /// The UID of the Node.
    pub const nodeUid = k8s_node_uid;
    /// The label placed on the Node, the `<key>` being the label name, the value being the label value, even if the value is empty.
    pub const nodeLabel = k8s_node_label;
    /// The annotation placed on the Node, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    pub const nodeAnnotation = k8s_node_annotation;
    /// The name of the namespace that the pod is running in.
    pub const namespaceName = k8s_namespace_name;
    /// The label placed on the Namespace, the `<key>` being the label name, the value being the label value, even if the value is empty.
    pub const namespaceLabel = k8s_namespace_label;
    /// The annotation placed on the Namespace, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    pub const namespaceAnnotation = k8s_namespace_annotation;
    /// The UID of the Pod.
    pub const podUid = k8s_pod_uid;
    /// The name of the Pod.
    pub const podName = k8s_pod_name;
    /// The label placed on the Pod, the `<key>` being the label name, the value being the label value.
    pub const podLabel = k8s_pod_label;
    /// The annotation placed on the Pod, the `<key>` being the annotation name, the value being the annotation value.
    pub const podAnnotation = k8s_pod_annotation;
    /// The name of the Container from Pod specification, must be unique within a Pod. Container runtime usually uses different globally unique name (`container.name`).
    pub const containerName = k8s_container_name;
    /// Number of times the container was restarted. This attribute can be used to identify a particular container (running or stopped) within a container spec.
    pub const containerRestartCount = k8s_container_restart_count;
    /// Last terminated reason of the Container.
    pub const containerStatusLastTerminatedReason = k8s_container_status_last_terminated_reason;
    /// The UID of the ReplicaSet.
    pub const replicasetUid = k8s_replicaset_uid;
    /// The name of the ReplicaSet.
    pub const replicasetName = k8s_replicaset_name;
    /// The label placed on the ReplicaSet, the `<key>` being the label name, the value being the label value, even if the value is empty.
    pub const replicasetLabel = k8s_replicaset_label;
    /// The annotation placed on the ReplicaSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    pub const replicasetAnnotation = k8s_replicaset_annotation;
    /// The UID of the replication controller.
    pub const replicationcontrollerUid = k8s_replicationcontroller_uid;
    /// The name of the replication controller.
    pub const replicationcontrollerName = k8s_replicationcontroller_name;
    /// The UID of the resource quota.
    pub const resourcequotaUid = k8s_resourcequota_uid;
    /// The name of the resource quota.
    pub const resourcequotaName = k8s_resourcequota_name;
    /// The UID of the Deployment.
    pub const deploymentUid = k8s_deployment_uid;
    /// The name of the Deployment.
    pub const deploymentName = k8s_deployment_name;
    /// The label placed on the Deployment, the `<key>` being the label name, the value being the label value, even if the value is empty.
    pub const deploymentLabel = k8s_deployment_label;
    /// The annotation placed on the Deployment, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    pub const deploymentAnnotation = k8s_deployment_annotation;
    /// The UID of the StatefulSet.
    pub const statefulsetUid = k8s_statefulset_uid;
    /// The name of the StatefulSet.
    pub const statefulsetName = k8s_statefulset_name;
    /// The label placed on the StatefulSet, the `<key>` being the label name, the value being the label value, even if the value is empty.
    pub const statefulsetLabel = k8s_statefulset_label;
    /// The annotation placed on the StatefulSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    pub const statefulsetAnnotation = k8s_statefulset_annotation;
    /// The UID of the DaemonSet.
    pub const daemonsetUid = k8s_daemonset_uid;
    /// The name of the DaemonSet.
    pub const daemonsetName = k8s_daemonset_name;
    /// The label placed on the DaemonSet, the `<key>` being the label name, the value being the label value, even if the value is empty.
    pub const daemonsetLabel = k8s_daemonset_label;
    /// The annotation placed on the DaemonSet, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    pub const daemonsetAnnotation = k8s_daemonset_annotation;
    /// The UID of the horizontal pod autoscaler.
    pub const hpaUid = k8s_hpa_uid;
    /// The name of the horizontal pod autoscaler.
    pub const hpaName = k8s_hpa_name;
    /// The kind of the target resource to scale for the HorizontalPodAutoscaler.
    pub const hpaScaletargetrefKind = k8s_hpa_scaletargetref_kind;
    /// The name of the target resource to scale for the HorizontalPodAutoscaler.
    pub const hpaScaletargetrefName = k8s_hpa_scaletargetref_name;
    /// The API version of the target resource to scale for the HorizontalPodAutoscaler.
    pub const hpaScaletargetrefApiVersion = k8s_hpa_scaletargetref_api_version;
    /// The type of metric source for the horizontal pod autoscaler.
    pub const hpaMetricType = k8s_hpa_metric_type;
    /// The UID of the Job.
    pub const jobUid = k8s_job_uid;
    /// The name of the Job.
    pub const jobName = k8s_job_name;
    /// The label placed on the Job, the `<key>` being the label name, the value being the label value, even if the value is empty.
    pub const jobLabel = k8s_job_label;
    /// The annotation placed on the Job, the `<key>` being the annotation name, the value being the annotation value, even if the value is empty.
    pub const jobAnnotation = k8s_job_annotation;
    /// The UID of the CronJob.
    pub const cronjobUid = k8s_cronjob_uid;
    /// The name of the CronJob.
    pub const cronjobName = k8s_cronjob_name;
    /// The label placed on the CronJob, the `<key>` being the label name, the value being the label value.
    pub const cronjobLabel = k8s_cronjob_label;
    /// The cronjob annotation placed on the CronJob, the `<key>` being the annotation name, the value being the annotation value.
    pub const cronjobAnnotation = k8s_cronjob_annotation;
    /// The name of the K8s volume.
    pub const volumeName = k8s_volume_name;
    /// The type of the K8s volume.
    pub const volumeType = k8s_volume_type;
    /// The phase of the K8s namespace.
    pub const namespacePhase = k8s_namespace_phase;
    /// The condition type of a K8s Node.
    pub const nodeConditionType = k8s_node_condition_type;
    /// The status of the condition, one of True, False, Unknown.
    pub const nodeConditionStatus = k8s_node_condition_status;
    /// The state of the container. [K8s ContainerState](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/
    pub const containerStatusState = k8s_container_status_state;
    /// The reason for the container state. Corresponds to the `reason` field of the: [K8s ContainerStateWaiting](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/ or [K8s ContainerStateTerminated](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/
    pub const containerStatusReason = k8s_container_status_reason;
    /// The size (identifier) of the K8s huge page.
    pub const hugepageSize = k8s_hugepage_size;
    /// The name of K8s [StorageClass](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.30/ object.
    pub const storageclassName = k8s_storageclass_name;
    /// The name of the K8s resource a resource quota defines.
    pub const resourcequotaResourceName = k8s_resourcequota_resource_name;
};

