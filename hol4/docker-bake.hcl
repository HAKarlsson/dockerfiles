variable "DOCKER_USER" {
	default = "anonymous"
}

variable "HOL4_VERSION" {
	default = "master"
}

variable "POLYML_VERSION" {
	default = "master"
}

variable "HOL4VSCODE_VERSION" {
	default = "latest"
}

group "default" {
	targets = ["hol4", "hol4-devcontainer"]
}

target "hol4" {
	target     = "hol4"
	context    = "."
	dockerfile = "Dockerfile"
	args = {
		HOL4_VERSION   = "${HOL4_VERSION}"
		POLYML_VERSION = "${POLYML_VERSION}"
	}
	tags = [
		"${DOCKER_USER}/hol4:latest",
		"${DOCKER_USER}/hol4:${HOL4_VERSION}",
	]
}

target "hol4-devcontainer" {
	target     = "hol4-devcontainer"
	inherits   = ["hol4"]
	args = {
		HOL4VSCODE_VERSION = "${HOL4VSCODE_VERSION}"
	}
	tags = [
		"${DOCKER_USER}/hol4-devcontainer:latest",
		"${DOCKER_USER}/hol4-devcontainer:${HOL4_VERSION}_${HOL4VSCODE_VERSION}",
	]
}
