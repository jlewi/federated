load("@com_google_protobuf//:protobuf.bzl", "py_proto_library")
#load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library", "go_test")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")

package(default_visibility = ["//visibility:public"])

licenses(["notice"])

py_library(
    name = "v0",
    srcs = ["__init__.py"],
)

py_proto_library(
    name = "computation_py_pb2",
    srcs = ["computation.proto"],
    default_runtime = "@com_google_protobuf//:protobuf_python",
    protoc = "@com_google_protobuf//:protoc",
    srcs_version = "PY3",
    deps = ["@com_google_protobuf//:protobuf_python"],
)

py_proto_library(
    name = "executor_py_pb2",
    srcs = ["executor.proto"],
    default_runtime = "@com_google_protobuf//:protobuf_python",
    protoc = "@com_google_protobuf//:protoc",
    srcs_version = "PY3",
    use_grpc_plugin = True,
    deps = [
        "@com_google_protobuf//:protobuf_python",
        ":computation_py_pb2",
    ],
)

proto_library(
    name = "v0_proto",
    srcs = ["computation.proto", "executor.proto"],
    deps = [
        "@com_google_protobuf//:any_proto",
    ],
    visibility = ["//visibility:public"],
)

go_proto_library(
    name = "go_protos",
    compilers = ["@io_bazel_rules_go//proto:go_grpc"],
    importpath = "github.com/tensorflow/federated/tensorflow_federated/go",
    proto = ":v0_proto",
)

filegroup(
    name = "proto_files",
    srcs = [
        "computation.proto",
        "executor.proto",
    ],
)
