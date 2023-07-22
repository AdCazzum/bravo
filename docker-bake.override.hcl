
target "dapp" {
}

variable "TAG" {
  default = "dev"
}

variable "DOCKER_ORGANIZATION" {
  default = "ace"
}

target "server" {
  tags = ["${DOCKER_ORGANIZATION}/dapp:bravo-${TAG}-server"]
}

target "console" {
  tags = ["${DOCKER_ORGANIZATION}/dapp:bravo-${TAG}-console"]
}

target "machine" {
  tags = ["${DOCKER_ORGANIZATION}/dapp:bravo-${TAG}-machine"]
}
