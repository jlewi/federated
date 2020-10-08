
# Update the golang generated files.
.PHONY: go-protos
go-protos:
	bazel build //tensorflow_federated/proto/v0:go_protos
	cp -f bazel-bin/tensorflow_federated/proto/v0/linux_amd64_stripped/go_protos%/github.com/tensorflow/federated/tensorflow_federated/go/*.go \
		tensorflow_federated/go/tensorflow_federated_v0/