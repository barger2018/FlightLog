output vpc-id {
    value = aws_vpc.default.id
}

output main-cidr-group {
    value = "10.0.0.0/16"
}